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
import '/auth/supabase_auth/auth_util.dart';

Future<String> loadOrCreateTrainingPlanDraft() async {
  try {
    final String userId = currentUserUid;

    // Cleanup stale edit drafts before proceeding
    await SupaFlow.client
        .from('training_plans_market_temp')
        .delete()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .lt(
            'created_at',
            DateTime.now()
                .toUtc()
                .subtract(Duration(hours: 24))
                .toIso8601String());

    // Only resume NEW drafts, never edit drafts
    final existing = await SupaFlow.client
        .from('training_plans_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'new')
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    int tempId;

    if (existing != null) {
      tempId = existing['id'] as int;
      FFAppState().draftPlanTempId = tempId;
      FFAppState().draftPlanName =
          (existing['training_plan_name'] ?? '') as String;
      FFAppState().draftPlanDescription =
          (existing['training_plan_description'] ?? '') as String;
      FFAppState().draftPlanPrice = existing['training_plan_price'] != null
          ? (existing['training_plan_price'] as int).toString()
          : '';
      if (kDebugMode) print('✅ Resuming NEW plan draft: $tempId');
    } else {
      try {
        final inserted = await SupaFlow.client
            .from('training_plans_market_temp')
            .insert({'trainer_id': userId, 'draft_type': 'new'})
            .select()
            .single();
        tempId = inserted['id'] as int;
        FFAppState().draftPlanTempId = tempId;
        FFAppState().draftPlanName = '';
        FFAppState().draftPlanDescription = '';
        FFAppState().draftPlanPrice = '';
        if (kDebugMode) print('✅ Created new plan draft: $tempId');
      } catch (insertError) {
        // UNIQUE constraint blocked duplicate — fetch the existing row
        if (kDebugMode)
          print('⚠️ Insert blocked, fetching existing draft: $insertError');
        final recovered = await SupaFlow.client
            .from('training_plans_market_temp')
            .select()
            .eq('trainer_id', userId)
            .eq('draft_type', 'new')
            .order('created_at', ascending: false)
            .limit(1)
            .single();
        tempId = recovered['id'] as int;
        FFAppState().draftPlanTempId = tempId;
        FFAppState().draftPlanName =
            (recovered['training_plan_name'] ?? '') as String;
        FFAppState().draftPlanDescription =
            (recovered['training_plan_description'] ?? '') as String;
        FFAppState().draftPlanPrice = recovered['training_plan_price'] != null
            ? (recovered['training_plan_price'] as int).toString()
            : '';
        if (kDebugMode) print('✅ Recovered existing plan draft: $tempId');
      }
    }
    return tempId.toString();
  } catch (e) {
    if (kDebugMode) print('❌ loadOrCreateTrainingPlanDraft error: $e');
    return '';
  }
}
