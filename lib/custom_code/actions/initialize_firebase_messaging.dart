// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

// CRITICAL: This must be a TOP-LEVEL function (outside any class)
// This handles notifications when app is COMPLETELY CLOSED
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDaajaSrE7SvpvvKKtSs42cW3gwJ6JZ5_E',
      appId: '1:934347834753:android:59486f35fd7e4ebfcc9480',
      messagingSenderId: '934347834753',
      projectId: 'acly2025',
    ),
  );

  if (kDebugMode) {
    print('🔔 BACKGROUND MESSAGE RECEIVED (app terminated)');
    print('📬 Title: ${message.notification?.title}');
    print('📬 Body: ${message.notification?.body}');
  }
}

Future initializeFirebaseMessaging() async {
  try {
    // Initialize Firebase with explicit options (fast, local)
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyDaajaSrE7SvpvvKKtSs42cW3gwJ6JZ5_E',
          appId: '1:934347834753:android:59486f35fd7e4ebfcc9480',
          messagingSenderId: '934347834753',
          projectId: 'acly2025',
        ),
      );
    }

    if (kDebugMode) print('✅ Firebase initialized with explicit options');

    // Register background handler (synchronous, safe)
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    if (kDebugMode) print('✅ Background message handler registered');

    final messaging = FirebaseMessaging.instance;

    // Request notification permissions WITH 5s TIMEOUT
    // User may never respond to the dialog — don't hang forever
    NotificationSettings? settings;
    try {
      settings = await messaging
          .requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      )
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          if (kDebugMode) print('⚠️ FCM requestPermission timed out');
          throw TimeoutException('requestPermission timeout');
        },
      );
    } catch (e) {
      if (kDebugMode) print('⚠️ FCM permission request failed: $e');
      return; // bail out — don't block login
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) print('✅ User granted notification permission');
    } else {
      if (kDebugMode) print('⚠️ User declined notification permission');
      return;
    }

    // Get FCM token WITH 10s TIMEOUT
    // This is the 17-second FIS_AUTH_ERROR hang we saw in the log
    String? fcmToken;
    try {
      fcmToken = await messaging.getToken().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          if (kDebugMode) print('⚠️ FCM getToken timed out');
          return null;
        },
      );
    } catch (e) {
      if (kDebugMode) print('⚠️ FCM getToken failed: $e');
      return;
    }

    if (fcmToken == null) {
      if (kDebugMode) print('❌ No FCM token available');
      return;
    }

    if (kDebugMode) {
      print('✅ FCM Token obtained: ${fcmToken.substring(0, 30)}...');
    }

    // Get current user ID from Supabase
    final userId = SupaFlow.client.auth.currentUser?.id;

    if (userId == null || userId.isEmpty) {
      if (kDebugMode) print('❌ No user logged in — skipping token save');
      return;
    }

    // Save FCM token to database (with timeout — don't let DB stall block either)
    try {
      await SupaFlow.client
          .from('user_profile')
          .update({'fcm_token': fcmToken})
          .eq('user_id', userId)
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) print('✅ FCM token saved to database for user: $userId');
    } catch (e) {
      if (kDebugMode) print('⚠️ Failed to save FCM token: $e');
      // continue — listeners below are still worth registering
    }

    // Listen for token refresh (fire-and-forget, runs for app lifetime)
    messaging.onTokenRefresh.listen((newToken) async {
      final currentUserId = SupaFlow.client.auth.currentUser?.id;
      if (currentUserId == null || currentUserId.isEmpty) return;
      try {
        await SupaFlow.client
            .from('user_profile')
            .update({'fcm_token': newToken})
            .eq('user_id', currentUserId)
            .timeout(const Duration(seconds: 10));
        if (kDebugMode) print('✅ FCM token refreshed and saved');
      } catch (e) {
        if (kDebugMode) print('⚠️ Token refresh save failed: $e');
      }
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('📬 Foreground notification: ${message.notification?.title}');
        print('📬 Body: ${message.notification?.body}');
      }
    });

    // Handle notification tap (app in background)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('📬 Notification tapped: ${message.notification?.title}');
      }
    });

    // Check if app was opened from terminated state via notification tap
    try {
      final initialMessage = await messaging
          .getInitialMessage()
          .timeout(const Duration(seconds: 5));
      if (initialMessage != null && kDebugMode) {
        print(
            '📬 App opened from notification (terminated): ${initialMessage.notification?.title}');
      }
    } catch (e) {
      if (kDebugMode) print('⚠️ getInitialMessage timed out or failed: $e');
    }

    if (kDebugMode) print('✅ FCM initialization complete!');
  } catch (e) {
    if (kDebugMode) print('❌ Error initializing FCM: $e');
  }
}
