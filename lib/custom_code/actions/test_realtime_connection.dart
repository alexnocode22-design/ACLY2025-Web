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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

Future testRealtimeConnection() async {
  debugPrint('🔍 ============================================');
  debugPrint('🔍 TESTING REALTIME CONNECTION');
  debugPrint('🔍 ============================================');

  try {
    // Get current user
    final user = SupaFlow.client.auth.currentUser;

    if (user == null) {
      debugPrint('❌ No user logged in!');
      debugPrint('🔍 ============================================');
      return;
    }

    final userId = user.id;
    debugPrint('✅ Current User ID: $userId');

    // Check for unread notifications
    debugPrint('📋 Querying unread notifications...');

    final unreadNotifications = await SupaFlow.client
        .from('notifications')
        .select()
        .eq('user_id', userId)
        .eq('message_sent', false)
        .order('created_at', ascending: false);

    debugPrint('✅ Found ${unreadNotifications.length} unread notifications');

    if (unreadNotifications.isNotEmpty) {
      debugPrint('📬 Unread notifications:');
      for (int i = 0; i < unreadNotifications.length; i++) {
        final notif = unreadNotifications[i];
        debugPrint('  [$i] ID: ${notif['id']}');
        debugPrint('      Title: ${notif['title']}');
        debugPrint('      Body: ${notif['body']}');
        debugPrint('      user_active: ${notif['user_active']}');
        debugPrint('      Created: ${notif['created_at']}');
        debugPrint('---');
      }
    }

    // Test realtime by subscribing for 10 seconds
    debugPrint('📡 Testing realtime subscription for 10 seconds...');

    final testChannel = SupaFlow.client.channel('test-notifications-$userId');

    testChannel
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
            debugPrint('📡 REALTIME EVENT RECEIVED!');
            debugPrint('   Event Type: INSERT');
            debugPrint('   Data: ${payload.newRecord}');
          },
        )
        .subscribe();

    debugPrint('✅ Subscribed! Waiting 10 seconds for events...');
    debugPrint('💡 Now insert a notification in Supabase dashboard');

    // Wait 5 seconds
    await Future.delayed(Duration(seconds: 10));

    // Cancel test subscription
    await SupaFlow.client.removeChannel(testChannel);

    debugPrint('✅ Realtime test complete!');
    debugPrint('🔍 ============================================');
  } catch (e) {
    debugPrint('❌ ERROR: $e');
    debugPrint('🔍 ============================================');
  }
}

// End custom action code
