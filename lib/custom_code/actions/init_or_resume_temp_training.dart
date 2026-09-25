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

import 'package:flutter/foundation.dart' show kDebugMode;

Future<int> initOrResumeTempTraining() async {
  try {
    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) {
      if (kDebugMode) print('❌ initOrResumeTempTraining: no user');
      return -1;
    }

    // Look for existing non-expired NEW training draft only
    // (source_training_id IS NULL = new training, not an edit)
    final existing = await SupaFlow.client
        .from('trainings_market_temp')
        .select()
        .eq('trainer_id', userId)
        .isFilter('source_training_id', null)
        .gt('expires_at', DateTime.now().toUtc().toIso8601String())
        .order('created_at', ascending: false)
        .limit(1);

    if (existing.isNotEmpty) {
      final id = existing.first['id'] as int;
      if (kDebugMode)
        print('📋 Resuming existing new-training draft tempId=$id');
      return id;
    }

    // No valid new-training draft found.
    // Clean up any expired rows for this trainer before inserting.
    await SupaFlow.client
        .from('trainings_market_temp')
        .delete()
        .eq('trainer_id', userId)
        .lt('expires_at', DateTime.now().toUtc().toIso8601String());

    if (kDebugMode) print('🧹 Cleaned up expired temp rows');

    // Create fresh temp row
    final inserted = await SupaFlow.client
        .from('trainings_market_temp')
        .insert({
          'trainer_id': userId,
          'slot_duration': 60,
          // source_training_id intentionally omitted = NULL
        })
        .select('id')
        .single();

    final id = inserted['id'] as int;
    if (kDebugMode) print('✅ Created new temp row tempId=$id');
    return id;
  } catch (e) {
    if (kDebugMode) print('❌ initOrResumeTempTraining error: $e');
    return -1;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
