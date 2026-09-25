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
import '/flutter_flow/upload_data.dart';

Future<String> uploadTempTrainingPlanPhoto(
  int tempId,
  FFUploadedFile uploadedFile,
) async {
  try {
    // Get current photos
    final row = await SupaFlow.client
        .from('training_plans_market_temp')
        .select('training_plan_photo')
        .eq('id', tempId)
        .single();

    final List<dynamic> currentPhotos = row['training_plan_photo'] ?? [];

    if (currentPhotos.length >= 5) {
      if (kDebugMode) print('⚠️ Max photos reached');
      return 'MAX_REACHED';
    }

    final bytes = uploadedFile.bytes;
    if (bytes == null || bytes.isEmpty) {
      if (kDebugMode) print('❌ No file bytes in uploadTempTrainingPlanPhoto');
      return '';
    }
    final trainerId = currentPhotos.isEmpty
        ? await SupaFlow.client
            .from('training_plans_market_temp')
            .select('trainer_id')
            .eq('id', tempId)
            .single()
            .then((r) => r['trainer_id'] as String)
        : null;

    // Get trainer_id
    final trainerRow = await SupaFlow.client
        .from('training_plans_market_temp')
        .select('trainer_id')
        .eq('id', tempId)
        .single();
    final String tid = trainerRow['trainer_id'];

    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final path = '$tid/$tempId/${timestamp}.jpg';

    await SupaFlow.client.storage.from('acly-trainingplans-temp').uploadBinary(
        path, bytes,
        fileOptions:
            const FileOptions(contentType: 'image/jpeg', upsert: true));

    final publicUrl = SupaFlow.client.storage
        .from('acly-trainingplans-temp')
        .getPublicUrl(path);

    final updatedPhotos = [...currentPhotos, publicUrl];

    // Build individual columns
    final Map<String, dynamic> updateData = {
      'training_plan_photo': updatedPhotos,
      'training_plan_photo1':
          updatedPhotos.isNotEmpty ? updatedPhotos[0] : null,
      'training_plan_photo2':
          updatedPhotos.length > 1 ? updatedPhotos[1] : null,
      'training_plan_photo3':
          updatedPhotos.length > 2 ? updatedPhotos[2] : null,
      'training_plan_photo4':
          updatedPhotos.length > 3 ? updatedPhotos[3] : null,
      'training_plan_photo5':
          updatedPhotos.length > 4 ? updatedPhotos[4] : null,
    };

    await SupaFlow.client
        .from('training_plans_market_temp')
        .update(updateData)
        .eq('id', tempId);

    if (kDebugMode) print('✅ Plan photo uploaded: $publicUrl');
    return publicUrl;
  } catch (e) {
    if (kDebugMode) print('❌ uploadTempTrainingPlanPhoto error: $e');
    return '';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
