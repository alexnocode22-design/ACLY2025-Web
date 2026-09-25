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

Future<int> initOrResumeEditNutritionPlan(int nutritionPlanId) async {
  try {
    final String userId = currentUserUid;

    final existing = await SupaFlow.client
        .from('nutrition_plans_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .eq('source_plan_id', nutritionPlanId)
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (existing != null) {
      final int tempId = existing['id'] as int;
      FFAppState().draftNutritionTempId = tempId;
      FFAppState().draftNutritionName =
          (existing['nutrition_plan_name'] ?? '') as String;
      FFAppState().draftNutritionDescription =
          (existing['nutrition_plan_description'] ?? '') as String;
      FFAppState().draftNutritionPrice =
          existing['nutrition_plan_price'] != null
              ? (existing['nutrition_plan_price'] as int).toString()
              : '';

      // Reset temp PDF to permanent if cron cleaned it up
      final String? tempPdfUrl = existing['nutrition_plan_file'] as String?;
      if (tempPdfUrl != null &&
          tempPdfUrl.isNotEmpty &&
          tempPdfUrl.contains('/acly-nutritionplans-temp/')) {
        try {
          final real = await SupaFlow.client
              .from('nutritionPlanMarket')
              .select('nutrition_plan_file')
              .eq('id', nutritionPlanId)
              .single();
          final String? permanentUrl = real['nutrition_plan_file'] as String?;
          if (permanentUrl != null && permanentUrl.isNotEmpty) {
            await SupaFlow.client
                .from('nutrition_plans_market_temp')
                .update({'nutrition_plan_file': permanentUrl}).eq('id', tempId);
            if (kDebugMode)
              print('✅ Reset nutrition PDF to permanent: $permanentUrl');
          }
        } catch (e) {
          if (kDebugMode) print('⚠️ Could not reset nutrition PDF: $e');
        }
      }

      if (kDebugMode)
        print(
            '✅ Resuming EDIT nutrition draft: $tempId for plan: $nutritionPlanId');
      return tempId;
    }

    // Fetch real plan and copy to temp
    final real = await SupaFlow.client
        .from('nutritionPlanMarket')
        .select()
        .eq('id', nutritionPlanId)
        .single();

    final List<dynamic> existingPhotos =
        List<dynamic>.from(real['nutrition_plan_photo'] ?? []);

    final inserted = await SupaFlow.client
        .from('nutrition_plans_market_temp')
        .insert({
          'trainer_id': userId,
          'draft_type': 'edit',
          'source_plan_id': nutritionPlanId,
          'nutrition_plan_name': real['nutrition_plan_name'],
          'nutrition_plan_description': real['nutrition_plan_description'],
          'nutrition_plan_price': real['nutrition_plan_price'],
          'nutrition_plan_photo': existingPhotos,
          'nutrition_plan_file': real['nutrition_plan_file'],
        })
        .select()
        .single();

    final int tempId = inserted['id'] as int;
    FFAppState().draftNutritionTempId = tempId;
    FFAppState().draftNutritionName =
        (real['nutrition_plan_name'] ?? '') as String;
    FFAppState().draftNutritionDescription =
        (real['nutrition_plan_description'] ?? '') as String;
    FFAppState().draftNutritionPrice = real['nutrition_plan_price'] != null
        ? (real['nutrition_plan_price'] as int).toString()
        : '';

    if (kDebugMode)
      print(
          '✅ Created EDIT nutrition draft: $tempId for plan: $nutritionPlanId');
    return tempId;
  } catch (e) {
    if (kDebugMode) print('❌ initOrResumeEditNutritionPlan error: $e');
    return 0;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
