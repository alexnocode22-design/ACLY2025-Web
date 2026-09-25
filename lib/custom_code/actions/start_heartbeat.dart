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
import 'package:flutter/foundation.dart' show kDebugMode;

Timer? globalHeartbeatTimer;

Future<void> startHeartbeat(int tempId) async {
  globalHeartbeatTimer?.cancel();

  globalHeartbeatTimer = Timer.periodic(const Duration(minutes: 10), (_) async {
    try {
      final userId = SupaFlow.client.auth.currentUser?.id;
      if (userId == null) return;
      await SupaFlow.client
          .from('trainings_market_temp')
          .update({
            'expires_at': DateTime.now()
                .toUtc()
                .add(const Duration(hours: 2))
                .toIso8601String(),
          })
          .eq('id', tempId)
          .eq('trainer_id', userId);
      if (kDebugMode) print('💓 Heartbeat: extended expiry for tempId=$tempId');
    } catch (e) {
      if (kDebugMode) print('❌ Heartbeat error: $e');
    }
  });
  if (kDebugMode) print('▶️ Heartbeat started for tempId=$tempId');
}
