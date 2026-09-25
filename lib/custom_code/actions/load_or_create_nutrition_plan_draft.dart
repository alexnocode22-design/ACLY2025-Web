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

Future<bool> loadOrCreateNutritionPlanDraft() async {
  try {
    final String userId = currentUserUid;

    // Clean stale edit drafts older than 24h
    await SupaFlow.client
        .from('nutrition_plans_market_temp')
        .delete()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .lt(
            'created_at',
            DateTime.now()
                .toUtc()
                .subtract(const Duration(hours: 24))
                .toIso8601String());

    // Look for existing new draft
    final existing = await SupaFlow.client
        .from('nutrition_plans_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'new')
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (existing != null) {
      FFAppState().draftNutritionTempId = existing['id'] as int;
      FFAppState().draftNutritionName =
          (existing['nutrition_plan_name'] ?? '') as String;
      FFAppState().draftNutritionDescription =
          (existing['nutrition_plan_description'] ?? '') as String;
      FFAppState().draftNutritionPrice =
          existing['nutrition_plan_price'] != null
              ? (existing['nutrition_plan_price'] as int).toString()
              : '';
      if (kDebugMode)
        print('✅ Resuming NEW nutrition draft: ${existing['id']}');
      return true;
    }

    // Try to create new draft
    try {
      final inserted = await SupaFlow.client
          .from('nutrition_plans_market_temp')
          .insert({'trainer_id': userId, 'draft_type': 'new'})
          .select()
          .single();
      FFAppState().draftNutritionTempId = inserted['id'] as int;
      FFAppState().draftNutritionName = '';
      FFAppState().draftNutritionDescription = '';
      FFAppState().draftNutritionPrice = '';
      if (kDebugMode) print('✅ Created new nutrition draft: ${inserted['id']}');
    } catch (insertError) {
      // UNIQUE constraint blocked duplicate — recover existing row
      if (kDebugMode)
        print('⚠️ Insert blocked, fetching existing draft: $insertError');
      final recovered = await SupaFlow.client
          .from('nutrition_plans_market_temp')
          .select()
          .eq('trainer_id', userId)
          .eq('draft_type', 'new')
          .order('created_at', ascending: false)
          .limit(1)
          .single();
      FFAppState().draftNutritionTempId = recovered['id'] as int;
      FFAppState().draftNutritionName =
          (recovered['nutrition_plan_name'] ?? '') as String;
      FFAppState().draftNutritionDescription =
          (recovered['nutrition_plan_description'] ?? '') as String;
      FFAppState().draftNutritionPrice =
          recovered['nutrition_plan_price'] != null
              ? (recovered['nutrition_plan_price'] as int).toString()
              : '';
      if (kDebugMode)
        print('✅ Recovered existing nutrition draft: ${recovered['id']}');
    }

    return true;
  } catch (e) {
    if (kDebugMode) print('❌ loadOrCreateNutritionPlanDraft error: $e');
    return false;
  }
}
