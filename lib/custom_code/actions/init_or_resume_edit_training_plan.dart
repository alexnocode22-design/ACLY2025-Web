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

import 'package:flutter/foundation.dart' show kDebugMode;
import '/auth/supabase_auth/auth_util.dart';

Future<int> initOrResumeEditTrainingPlan(int trainingPlanId) async {
  try {
    final String userId = currentUserUid;

    // Check for existing edit draft for this specific plan
    final existing = await SupaFlow.client
        .from('training_plans_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .eq('source_plan_id', trainingPlanId)
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (existing != null) {
      final int tempId = existing['id'] as int;
      FFAppState().draftPlanTempId = tempId;
      FFAppState().draftPlanName =
          (existing['training_plan_name'] ?? '') as String;
      FFAppState().draftPlanDescription =
          (existing['training_plan_description'] ?? '') as String;
      FFAppState().draftPlanPrice = existing['training_plan_price'] != null
          ? (existing['training_plan_price'] as int).toString()
          : '';

      // If temp row has a temp-bucket PDF URL, reset it to the permanent
      // URL from the source plan — prevents 404 on publish if cron
      // cleaned up the temp PDF between sessions.
      final String? tempPdfUrl = existing['training_plan_file'] as String?;
      if (tempPdfUrl != null &&
          tempPdfUrl.isNotEmpty &&
          tempPdfUrl.contains('/acly-trainingplans-temp/')) {
        try {
          final real = await SupaFlow.client
              .from('trainingPlanMarket')
              .select('training_plan_file')
              .eq('id', trainingPlanId)
              .single();
          final String? permanentPdfUrl = real['training_plan_file'] as String?;
          if (permanentPdfUrl != null && permanentPdfUrl.isNotEmpty) {
            await SupaFlow.client.from('training_plans_market_temp').update(
                {'training_plan_file': permanentPdfUrl}).eq('id', tempId);
            if (kDebugMode)
              print('✅ Reset temp PDF to permanent URL: $permanentPdfUrl');
          }
        } catch (pdfResetError) {
          if (kDebugMode) print('⚠️ Could not reset PDF URL: $pdfResetError');
        }
      }

      if (kDebugMode)
        print('✅ Resuming EDIT plan draft: $tempId for plan: $trainingPlanId');
      return tempId;
    }

    // No existing draft — fetch real plan and copy to temp
    final real = await SupaFlow.client
        .from('trainingPlanMarket')
        .select()
        .eq('id', trainingPlanId)
        .single();

    final List<dynamic> existingPhotos =
        List<dynamic>.from(real['training_plan_photo'] ?? []);

    final inserted = await SupaFlow.client
        .from('training_plans_market_temp')
        .insert({
          'trainer_id': userId,
          'draft_type': 'edit',
          'source_plan_id': trainingPlanId,
          'training_plan_name': real['training_plan_name'],
          'training_plan_description': real['training_plan_description'],
          'training_plan_price': real['training_plan_price'],
          'training_plan_photo': existingPhotos,
          'training_plan_file': real['training_plan_file'],
        })
        .select()
        .single();

    final int tempId = inserted['id'] as int;
    FFAppState().draftPlanTempId = tempId;
    FFAppState().draftPlanName = (real['training_plan_name'] ?? '') as String;
    FFAppState().draftPlanDescription =
        (real['training_plan_description'] ?? '') as String;
    FFAppState().draftPlanPrice = real['training_plan_price'] != null
        ? (real['training_plan_price'] as int).toString()
        : '';

    if (kDebugMode)
      print('✅ Created EDIT plan draft: $tempId for plan: $trainingPlanId');
    return tempId;
  } catch (e) {
    if (kDebugMode) print('❌ initOrResumeEditTrainingPlan error: $e');
    return 0;
  }
}
