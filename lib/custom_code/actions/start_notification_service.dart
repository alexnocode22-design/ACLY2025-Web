// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

// Global variables - shared across all custom actions
dynamic _globalNotificationChannel;
bool _globalServiceActive = false;
OverlayEntry? _currentOverlay;
OverlayState? _overlayState;
BuildContext? _rootContext;
List<Map<String, dynamic>> _pendingNotifications = [];
bool _isShowingNotification = false;
String? _currentUserId;
Timer? _keepAliveTimer;
Timer? _sessionHeartbeatTimer;
_AppLifecycleObserver? _lifecycleObserver;

Future startNotificationService(BuildContext context) async {
  // Check auth up front — bail if no user
  final user = SupaFlow.client.auth.currentUser;
  if (user == null) {
    if (kDebugMode)
      debugPrint('❌ startNotificationService: no user logged in, skipping');
    return;
  }
  final userId = user.id;
  if (userId.isEmpty) {
    if (kDebugMode)
      debugPrint('❌ startNotificationService: user ID is empty, skipping');
    return;
  }

  // SKIP IF ALREADY RUNNING FOR THIS USER
  // Prevents duplicate initialization from parallel page loads or re-entry
  if (_globalServiceActive && _currentUserId == userId) {
    if (kDebugMode) {
      debugPrint(
          'ℹ️ Notification service already running for user: $userId — skipping start');
    }
    return;
  }

  // If service is running for a DIFFERENT user, stop cleanly before starting anew
  // (edge case: user logged out and logged in as different user without full restart)
  if (_globalServiceActive && _currentUserId != userId) {
    if (kDebugMode) {
      debugPrint(
          '⚠️ Service running for different user ($_currentUserId) — stopping before restart');
    }
    try {
      if (_globalNotificationChannel != null) {
        await SupaFlow.client.removeChannel(_globalNotificationChannel);
        _globalNotificationChannel = null;
      }
      _keepAliveTimer?.cancel();
      _keepAliveTimer = null;
      _sessionHeartbeatTimer?.cancel();
      _sessionHeartbeatTimer = null;
      _globalServiceActive = false;
      _pendingNotifications.clear();
      _isShowingNotification = false;
      _currentOverlay?.remove();
      _currentOverlay = null;
    } catch (e) {
      if (kDebugMode) debugPrint('⚠️ Error stopping previous service: $e');
    }
  }

  // Reset stop flag on every fresh start
  FFAppState().stopNotificationRequested = false;

  if (kDebugMode) {
    debugPrint('🔔 ============================================');
    debugPrint('🔔 START NOTIFICATION SERVICE');
    debugPrint('🔔 ============================================');
  }

  try {
    _overlayState = Overlay.of(context, rootOverlay: true);
    _rootContext = context;
    if (kDebugMode) debugPrint('✅ Overlay state and root context captured');

    _currentUserId = userId;
    if (kDebugMode) debugPrint('✅ Starting for user: $userId');

    // Mark app session as active immediately
    try {
      await SupaFlow.client.from('user_profile').update({
        'app_session_active': true,
        'last_seen': DateTime.now().toUtc().toIso8601String(),
      }).eq('user_id', userId);
      if (kDebugMode) debugPrint('✅ App session marked as active');
    } catch (e) {
      if (kDebugMode) debugPrint('⚠️ Error marking app session: $e');
    }

    // Set up app lifecycle observer (only if not already installed)
    if (_lifecycleObserver == null) {
      _lifecycleObserver = _AppLifecycleObserver();
      WidgetsBinding.instance.addObserver(_lifecycleObserver!);
      if (kDebugMode) debugPrint('✅ App lifecycle observer added');
    }

    // Query existing unread notifications
    try {
      final existingNotifications = await SupaFlow.client
          .from('notifications')
          .select()
          .eq('user_id', userId)
          .eq('message_sent', false)
          .order('created_at', ascending: true);

      if (existingNotifications.isNotEmpty) {
        if (kDebugMode) {
          debugPrint(
              '📬 Found ${existingNotifications.length} existing unread notifications');
        }
        _pendingNotifications
            .addAll(List<Map<String, dynamic>>.from(existingNotifications));

        if (!_isShowingNotification && _pendingNotifications.isNotEmpty) {
          _showNextNotification();
        }
      }
    } catch (e) {
      if (kDebugMode)
        debugPrint('⚠️ Error querying existing notifications: $e');
    }

    await _subscribeToChannel(userId);
    _startKeepAliveTimer();
    _startSessionHeartbeat(userId);

    _globalServiceActive = true;

    if (kDebugMode) {
      debugPrint('✅ Service started successfully');
      debugPrint('📡 Listening for notifications...');
      debugPrint('🔔 ============================================');
    }
  } catch (e) {
    if (kDebugMode) {
      debugPrint('❌ Error starting notification service: $e');
      debugPrint('🔔 ============================================');
    }
  }
}

// App Lifecycle Observer to detect background/foreground
class _AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (kDebugMode) debugPrint('📱 App lifecycle changed: $state');

    final userId = _currentUserId;
    if (userId == null || userId.isEmpty) return;

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      if (kDebugMode)
        debugPrint('📱 App going to background - stopping heartbeat');

      _sessionHeartbeatTimer?.cancel();
      _sessionHeartbeatTimer = null;

      try {
        await SupaFlow.client.from('user_profile').update({
          'app_session_active': false,
          'last_seen': DateTime.now().toUtc().toIso8601String(),
        }).eq('user_id', userId);
        if (kDebugMode)
          debugPrint('✅ App session marked as INACTIVE (background)');
      } catch (e) {
        if (kDebugMode) debugPrint('⚠️ Error marking session inactive: $e');
      }
    } else if (state == AppLifecycleState.resumed) {
      if (kDebugMode)
        debugPrint('📱 App resumed to foreground - starting heartbeat');

      // Check if stop was requested while in background
      if (FFAppState().stopNotificationRequested) {
        if (kDebugMode)
          debugPrint(
              '🛑 Stop was requested while in background - not resuming');
        return;
      }

      try {
        await SupaFlow.client.from('user_profile').update({
          'app_session_active': true,
          'last_seen': DateTime.now().toUtc().toIso8601String(),
        }).eq('user_id', userId);
        if (kDebugMode)
          debugPrint('✅ App session marked as ACTIVE (foreground)');
      } catch (e) {
        if (kDebugMode) debugPrint('⚠️ Error marking session active: $e');
      }

      _startSessionHeartbeat(userId);
    }
  }
}

void _startSessionHeartbeat(String userId) {
  _sessionHeartbeatTimer?.cancel();

  _sessionHeartbeatTimer = Timer.periodic(Duration(seconds: 30), (timer) async {
    // Check stop flag
    if (FFAppState().stopNotificationRequested) {
      if (kDebugMode) debugPrint('🛑 Stop requested - cancelling heartbeat');
      timer.cancel();
      _sessionHeartbeatTimer = null;
      return;
    }

    if (!_globalServiceActive ||
        _currentUserId == null ||
        _currentUserId!.isEmpty) {
      if (kDebugMode)
        debugPrint('⚠️ Service not active, stopping heartbeat timer');
      timer.cancel();
      return;
    }

    try {
      await SupaFlow.client.from('user_profile').update({
        'app_session_active': true,
        'last_seen': DateTime.now().toUtc().toIso8601String(),
      }).eq('user_id', userId);
      if (kDebugMode) debugPrint('💓 Session heartbeat sent');
    } catch (e) {
      if (kDebugMode) debugPrint('⚠️ Heartbeat error: $e');
    }
  });

  if (kDebugMode) debugPrint('✅ Session heartbeat started (every 30 seconds)');
}

Future<void> _subscribeToChannel(String userId) async {
  try {
    _globalNotificationChannel =
        SupaFlow.client.channel('notifications-$userId');

    _globalNotificationChannel
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'notifications',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) {
            if (kDebugMode) {
              debugPrint('📬 ============================================');
              debugPrint('📬 NOTIFICATION RECEIVED!');
            }
            final title = payload.newRecord['title'] ?? 'Notification';
            final body = payload.newRecord['body'] ?? '';
            final id = payload.newRecord['id'];
            final active = payload.newRecord['user_active'] ?? true;

            if (kDebugMode) {
              debugPrint('   Title: $title');
              debugPrint('   Body: $body');
              debugPrint('   ID: $id');
              debugPrint('   user_active: $active');
              debugPrint('📬 ============================================');
            }

            _pendingNotifications.add({
              'id': id,
              'title': title,
              'body': body,
              'user_active': active,
            });

            scheduleMicrotask(() {
              if (!_isShowingNotification) {
                _showNextNotification();
              }
            });
          },
        )
        .subscribe();

    if (kDebugMode) debugPrint('✅ Subscribed to realtime channel');
  } catch (e) {
    if (kDebugMode) debugPrint('❌ Error subscribing to channel: $e');
    rethrow;
  }
}

void _startKeepAliveTimer() {
  _keepAliveTimer?.cancel();

  _keepAliveTimer = Timer.periodic(Duration(minutes: 3), (timer) async {
    if (kDebugMode) debugPrint('⏰ Keep-alive check...');

    // Check stop flag first
    if (FFAppState().stopNotificationRequested) {
      if (kDebugMode)
        debugPrint('🛑 Stop requested - shutting down service from keep-alive');
      timer.cancel();
      _keepAliveTimer = null;
      _sessionHeartbeatTimer?.cancel();
      _sessionHeartbeatTimer = null;
      if (_lifecycleObserver != null) {
        WidgetsBinding.instance.removeObserver(_lifecycleObserver!);
        _lifecycleObserver = null;
      }
      if (_globalNotificationChannel != null) {
        await SupaFlow.client.removeChannel(_globalNotificationChannel);
        _globalNotificationChannel = null;
      }
      _currentOverlay?.remove();
      _currentOverlay = null;
      if (_currentUserId != null && _currentUserId!.isNotEmpty) {
        try {
          await SupaFlow.client.from('user_profile').update({
            'app_session_active': false,
            'last_seen': DateTime.now().toUtc().toIso8601String(),
          }).eq('user_id', _currentUserId!);
        } catch (e) {
          if (kDebugMode)
            debugPrint('⚠️ Error marking session inactive on stop: $e');
        }
      }
      _globalServiceActive = false;
      _currentUserId = null;
      _pendingNotifications.clear();
      _isShowingNotification = false;
      FFAppState().stopNotificationRequested = false;
      if (kDebugMode) debugPrint('✅ Service fully stopped via App State flag');
      return;
    }

    if (!_globalServiceActive ||
        _currentUserId == null ||
        _currentUserId!.isEmpty) {
      if (kDebugMode)
        debugPrint('⚠️ Service not active, stopping keep-alive timer');
      timer.cancel();
      return;
    }

    try {
      final missedNotifications = await SupaFlow.client
          .from('notifications')
          .select()
          .eq('user_id', _currentUserId!)
          .eq('message_sent', false)
          .order('created_at', ascending: true);

      if (missedNotifications.isNotEmpty) {
        if (kDebugMode) {
          debugPrint(
              '📬 Found ${missedNotifications.length} missed notifications during keep-alive check');
        }

        for (var notification in missedNotifications) {
          final id = notification['id'];
          final exists = _pendingNotifications.any((n) => n['id'] == id);
          if (!exists) {
            if (kDebugMode) debugPrint('   Adding missed notification ID: $id');
            _pendingNotifications.add(notification);
          }
        }

        if (!_isShowingNotification && _pendingNotifications.isNotEmpty) {
          _showNextNotification();
        }
      } else {
        if (kDebugMode) debugPrint('✅ No missed notifications');
      }
    } catch (e) {
      if (kDebugMode) debugPrint('⚠️ Keep-alive check error: $e');
      await _reconnectChannel();
    }
  });

  if (kDebugMode)
    debugPrint('✅ Keep-alive timer started (checks every 3 minutes)');
}

Future<void> _reconnectChannel() async {
  if (_currentUserId == null || _currentUserId!.isEmpty) {
    if (kDebugMode) debugPrint('❌ Cannot reconnect: no user ID stored');
    return;
  }

  if (kDebugMode) debugPrint('🔄 Attempting to reconnect channel...');

  try {
    if (_globalNotificationChannel != null) {
      await SupaFlow.client.removeChannel(_globalNotificationChannel);
      _globalNotificationChannel = null;
    }

    await Future.delayed(Duration(seconds: 1));
    await _subscribeToChannel(_currentUserId!);

    if (kDebugMode) debugPrint('✅ Successfully reconnected');
  } catch (e) {
    if (kDebugMode) debugPrint('❌ Reconnection failed: $e');
  }
}

Future<void> _showNextNotification() async {
  if (_isShowingNotification) {
    if (kDebugMode) debugPrint('⚠️ Already showing a notification');
    return;
  }

  if (_pendingNotifications.isEmpty) {
    if (kDebugMode) debugPrint('ℹ️ No more pending notifications');
    return;
  }

  _isShowingNotification = true;

  final notification = _pendingNotifications.first;
  final title = notification['title'] ?? 'Notification';
  final body = notification['body'] ?? '';
  final id = notification['id'];
  final active = notification['user_active'] ?? true;

  if (kDebugMode) debugPrint('🔔 Showing notification $id: $title');

  await _showDialog(title, body, id, active);
}

Future<void> _showDialog(String title, String body, int id, bool active) async {
  if (kDebugMode) debugPrint('🔔 Creating overlay notification: $title');

  try {
    if (_overlayState == null) {
      if (kDebugMode) debugPrint('❌ No overlay state available');
      _isShowingNotification = false;
      return;
    }

    _currentOverlay?.remove();
    _currentOverlay = null;

    Timer? autoLogoutTimer;
    if (!active) {
      if (kDebugMode)
        debugPrint('⏱️ User BANNED - starting 3-second auto-logout timer');
      autoLogoutTimer = Timer(Duration(seconds: 3), () async {
        if (kDebugMode)
          debugPrint('⏰ 3 seconds elapsed - auto-logging out BANNED user');
        _currentOverlay?.remove();
        _currentOverlay = null;
        _pendingNotifications.clear();
        _isShowingNotification = false;
        await _deleteAllNotificationsAndLogout();
      });
    }

    _currentOverlay = OverlayEntry(
      builder: (context) => WillPopScope(
        onWillPop: () async {
          if (kDebugMode)
            debugPrint('⚠️ Back button disabled during notification');
          return false;
        },
        child: Material(
          color: Colors.black54,
          child: Center(
            child: Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    body,
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {
                          if (kDebugMode)
                            debugPrint('🔔 Notification dismissed (ID: $id)');
                          autoLogoutTimer?.cancel();
                          _currentOverlay?.remove();
                          _currentOverlay = null;
                          _pendingNotifications
                              .removeWhere((n) => n['id'] == id);
                          _isShowingNotification = false;
                          if (!active) {
                            if (kDebugMode)
                              debugPrint('⚠️ User BANNED - logging out');
                            await _deleteAllNotificationsAndLogout();
                          } else {
                            if (_pendingNotifications.isNotEmpty) {
                              await Future.delayed(Duration(milliseconds: 300));
                              _showNextNotification();
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Color(0xFFFF740F),
                        ),
                        child: Text('Отмена'),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          if (kDebugMode)
                            debugPrint('🔔 Notification OK pressed (ID: $id)');
                          autoLogoutTimer?.cancel();
                          _currentOverlay?.remove();
                          _currentOverlay = null;
                          if (active) {
                            await _markSent(id);
                            if (kDebugMode)
                              debugPrint(
                                  '✅ Notification marked as sent (ID: $id)');
                          }
                          _pendingNotifications
                              .removeWhere((n) => n['id'] == id);
                          _isShowingNotification = false;
                          if (!active) {
                            if (kDebugMode)
                              debugPrint('⚠️ User BANNED - logging out');
                            await _deleteAllNotificationsAndLogout();
                          } else {
                            if (_pendingNotifications.isNotEmpty) {
                              await Future.delayed(Duration(milliseconds: 300));
                              _showNextNotification();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF740F),
                          foregroundColor: Colors.white,
                        ),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    _overlayState!.insert(_currentOverlay!);
    if (kDebugMode) debugPrint('✅ Overlay notification shown successfully');
  } catch (e) {
    if (kDebugMode) debugPrint('❌ Error showing overlay: $e');
    _isShowingNotification = false;
  }
}

Future<void> _markSent(int id) async {
  try {
    await SupaFlow.client
        .from('notifications')
        .update({'message_sent': true}).eq('id', id);
    if (kDebugMode) debugPrint('✅ Marked as sent in database');
  } catch (e) {
    if (kDebugMode) debugPrint('❌ Error marking as sent: $e');
  }
}

Future<void> _deleteAllNotificationsAndLogout() async {
  try {
    if (kDebugMode)
      debugPrint('🗑️ Deleting all notifications for banned user');
    if (_currentUserId != null && _currentUserId!.isNotEmpty) {
      await SupaFlow.client
          .from('notifications')
          .delete()
          .eq('user_id', _currentUserId!);
      if (kDebugMode)
        debugPrint('✅ Deleted all notifications for user: $_currentUserId');
    }
    await _doLogout(goToSignup: true);
  } catch (e) {
    if (kDebugMode) debugPrint('❌ Error deleting notifications: $e');
    await _doLogout(goToSignup: true);
  }
}

Future<void> _doLogout({bool goToSignup = false}) async {
  try {
    if (kDebugMode) {
      debugPrint('🚪 ============================================');
      debugPrint('🚪 LOGGING OUT USER');
      debugPrint('🚪 ============================================');
    }

    if (_lifecycleObserver != null) {
      WidgetsBinding.instance.removeObserver(_lifecycleObserver!);
      _lifecycleObserver = null;
      if (kDebugMode) debugPrint('✅ Lifecycle observer removed');
    }

    _sessionHeartbeatTimer?.cancel();
    _sessionHeartbeatTimer = null;
    _keepAliveTimer?.cancel();
    _keepAliveTimer = null;

    if (_currentUserId != null && _currentUserId!.isNotEmpty) {
      await SupaFlow.client.from('user_profile').update({
        'app_session_active': false,
        'last_seen': DateTime.now().toUtc().toIso8601String(),
      }).eq('user_id', _currentUserId!);
      if (kDebugMode) debugPrint('✅ App session marked as inactive');
    }

    _currentOverlay?.remove();
    _currentOverlay = null;

    if (_globalNotificationChannel != null) {
      await SupaFlow.client.removeChannel(_globalNotificationChannel);
      _globalNotificationChannel = null;
      if (kDebugMode) debugPrint('✅ Channel removed');
    }

    _globalServiceActive = false;
    _currentUserId = null;
    _pendingNotifications.clear();
    _isShowingNotification = false;

    await SupaFlow.client.auth.signOut();
    if (kDebugMode) debugPrint('✅ User signed out from Supabase');

    await Future.delayed(Duration(milliseconds: 500));

    SystemNavigator.pop();

    if (kDebugMode) {
      debugPrint('✅ App exit triggered');
      debugPrint('🚪 ============================================');
    }
  } catch (e) {
    if (kDebugMode) debugPrint('❌ Logout error: $e');
  }
}
