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

import 'package:flutter/foundation.dart' show kDebugMode;
import '/auth/supabase_auth/auth_util.dart';

Future<int> initOrResumeEditTraining(int trainingId) async {
  try {
    final String userId = currentUserUid;

    final existing = await SupaFlow.client
        .from('trainings_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .eq('source_training_id', trainingId)
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (existing != null) {
      final int tempId = existing['id'] as int;
      FFAppState().draftTempId = tempId;
      FFAppState().draftName = (existing['training_name'] ?? '') as String;
      FFAppState().draftDescription =
          (existing['training_description'] ?? '') as String;
      FFAppState().draftPrice = existing['training_price'] != null
          ? (existing['training_price'] as int).toString()
          : '';
      FFAppState().draftSlotDuration = existing['slot_duration'] != null
          ? (existing['slot_duration'] as int)
          : 60;
      if (kDebugMode)
        print('✅ Resuming EDIT draft: $tempId for training: $trainingId');
      return tempId;
    }

    final real = await SupaFlow.client
        .from('trainingsMarket')
        .select()
        .eq('id', trainingId)
        .single();

    final List<dynamic> existingPhotos =
        List<dynamic>.from(real['training_photo'] ?? []);

    final int slotDuration =
        real['slot_duration'] != null ? (real['slot_duration'] as int) : 60;

    final inserted = await SupaFlow.client
        .from('trainings_market_temp')
        .insert({
          'trainer_id': userId,
          'draft_type': 'edit',
          'source_training_id': trainingId,
          'training_name': real['training_name'],
          'training_description': real['training_description'],
          'training_price': real['training_price'],
          'slot_duration': slotDuration,
          'training_photo': existingPhotos,
        })
        .select()
        .single();

    final int tempId = inserted['id'] as int;

    FFAppState().draftTempId = tempId;
    FFAppState().draftName = (real['training_name'] ?? '') as String;
    FFAppState().draftDescription =
        (real['training_description'] ?? '') as String;
    FFAppState().draftPrice = real['training_price'] != null
        ? (real['training_price'] as int).toString()
        : '';
    FFAppState().draftSlotDuration = slotDuration;

    if (kDebugMode)
      print('✅ Created EDIT draft: $tempId for training: $trainingId');
    return tempId;
  } catch (e) {
    if (kDebugMode) print('❌ initOrResumeEditTraining error: $e');
    return 0;
  }
}
