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

Future<String> uploadTempTrainingPhoto(
  int tempId,
  FFUploadedFile imageFile,
) async {
  try {
    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) {
      if (kDebugMode) print('❌ uploadTempTrainingPhoto: no user');
      return '';
    }

    final imageBytes = imageFile.bytes;
    if (imageBytes == null || imageBytes.isEmpty) {
      if (kDebugMode) print('❌ uploadTempTrainingPhoto: empty bytes');
      return '';
    }

    // Check current photo count — max 5
    final tempRow = await SupaFlow.client
        .from('trainings_market_temp')
        .select('training_photo')
        .eq('id', tempId)
        .eq('trainer_id', userId)
        .single();

    final currentPhotos = List<String>.from(tempRow['training_photo'] ?? []);

    if (currentPhotos.length >= 5) {
      if (kDebugMode) print('⚠️ uploadTempTrainingPhoto: max 5 photos reached');
      return 'MAX_REACHED';
    }

    // Filename matches existing pattern: microsecond timestamp
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final filename = '$timestamp.jpg';
    final storagePath = '$userId/$tempId/$filename';

    if (kDebugMode) {
      print('📤 Uploading to acly-trainings-temp: $storagePath');
    }

    await SupaFlow.client.storage.from('acly-trainings-temp').uploadBinary(
          storagePath,
          imageBytes,
          fileOptions: const FileOptions(
            contentType: 'image/jpeg',
            upsert: false,
          ),
        );

    final publicUrl = SupaFlow.client.storage
        .from('acly-trainings-temp')
        .getPublicUrl(storagePath);

    if (kDebugMode) print('✅ Upload successful: $publicUrl');

    // Append to training_photo array and extend expiry
    final updatedPhotos = [...currentPhotos, publicUrl];

    await SupaFlow.client
        .from('trainings_market_temp')
        .update({
          'training_photo': updatedPhotos,
          'expires_at': DateTime.now()
              .toUtc()
              .add(const Duration(minutes: 30))
              .toIso8601String(),
        })
        .eq('id', tempId)
        .eq('trainer_id', userId);

    if (kDebugMode) {
      print('✅ Photo array updated: ${updatedPhotos.length}/5');
    }
    return publicUrl;
  } catch (e) {
    if (kDebugMode) print('❌ uploadTempTrainingPhoto error: $e');
    return '';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
