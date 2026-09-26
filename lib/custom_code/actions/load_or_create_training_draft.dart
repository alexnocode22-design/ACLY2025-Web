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

Future<String> loadOrCreateTrainingDraft() async {
  try {
    final String userId = currentUserUid;

    await SupaFlow.client
        .from('trainings_market_temp')
        .delete()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .lt(
            'created_at',
            DateTime.now()
                .toUtc()
                .subtract(Duration(hours: 24))
                .toIso8601String());

    final existing = await SupaFlow.client
        .from('trainings_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'new')
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    int tempId;

    if (existing != null) {
      tempId = existing['id'] as int;
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
      if (kDebugMode) print('✅ Resuming NEW draft: $tempId');
    } else {
      final inserted = await SupaFlow.client
          .from('trainings_market_temp')
          .insert({
            'trainer_id': userId,
            'draft_type': 'new',
            'expires_at': DateTime.now()
                .toUtc()
                .add(const Duration(hours: 2))
                .toIso8601String(),
          })
          .select()
          .single();

      tempId = inserted['id'] as int;
      FFAppState().draftTempId = tempId;
      FFAppState().draftName = '';
      FFAppState().draftDescription = '';
      FFAppState().draftPrice = '';
      FFAppState().draftSlotDuration = 60;
      if (kDebugMode) print('✅ Created new draft: $tempId');
    }

    return tempId.toString();
  } catch (e) {
    if (kDebugMode) print('❌ loadOrCreateTrainingDraft error: $e');
    return '';
  }
}
