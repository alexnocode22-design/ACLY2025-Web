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
import '/flutter_flow/upload_data.dart';

Future<String> replaceTempTrainingPhoto(
  int tempId,
  int photoIndex,
  FFUploadedFile uploadedFile,
) async {
  try {
    final bytes = uploadedFile.bytes;
    if (bytes == null || bytes.isEmpty) {
      if (kDebugMode) print('❌ No file bytes in replaceTempTrainingPhoto');
      return '';
    }

    final row = await SupaFlow.client
        .from('trainings_market_temp')
        .select('training_photo, trainer_id')
        .eq('id', tempId)
        .single();

    final List<dynamic> currentPhotos =
        List<dynamic>.from(row['training_photo'] ?? []);
    final String trainerId = row['trainer_id'] as String;

    if (kDebugMode)
      print(
          '🔍 replaceTempTrainingPhoto: index=$photoIndex count=${currentPhotos.length} bytes=${bytes.length}');

    if (photoIndex < 0 || photoIndex >= currentPhotos.length) {
      if (kDebugMode) print('❌ Invalid photo index: $photoIndex');
      return '';
    }

    // Delete old photo from whichever bucket it lives in
    const String tempBucket = 'acly-trainings-temp';
    const String permBucket = 'acly-trainings';

    final String oldUrl = currentPhotos[photoIndex] as String;

    String? oldBucket;
    String? oldPath;

    if (oldUrl.contains('/$tempBucket/')) {
      oldBucket = tempBucket;
      final int pos = oldUrl.indexOf('/$tempBucket/');
      oldPath = oldUrl.substring(pos + tempBucket.length + 2);
    } else if (oldUrl.contains('/$permBucket/')) {
      oldBucket = permBucket;
      final int pos = oldUrl.indexOf('/$permBucket/');
      oldPath = oldUrl.substring(pos + permBucket.length + 2);
    }

    if (oldBucket != null && oldPath != null) {
      if (kDebugMode) print('🔍 Deleting old photo from $oldBucket: $oldPath');
      try {
        await SupaFlow.client.storage.from(oldBucket).remove([oldPath]);
        if (kDebugMode) print('✅ Old photo deleted from storage');
      } catch (storageError) {
        // Non-fatal — old object may already be gone
        if (kDebugMode)
          print('⚠️ Old photo delete failed (non-fatal): $storageError');
      }
    } else {
      if (kDebugMode)
        print('⚠️ Could not determine bucket for old URL: $oldUrl');
    }

    // Upload new photo to temp bucket
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final String newPath = '$trainerId/$tempId/$timestamp.jpg';

    await SupaFlow.client.storage.from(tempBucket).uploadBinary(newPath, bytes,
        fileOptions:
            const FileOptions(contentType: 'image/jpeg', upsert: true));

    final String newUrl =
        SupaFlow.client.storage.from(tempBucket).getPublicUrl(newPath);

    if (kDebugMode) print('✅ New photo uploaded: $newUrl');

    currentPhotos[photoIndex] = newUrl;

    final Map<String, dynamic> updateData = {
      'training_photo': currentPhotos,
      'training_photo1': currentPhotos.isNotEmpty ? currentPhotos[0] : null,
      'training_photo2': currentPhotos.length > 1 ? currentPhotos[1] : null,
      'training_photo3': currentPhotos.length > 2 ? currentPhotos[2] : null,
      'training_photo4': currentPhotos.length > 3 ? currentPhotos[3] : null,
      'training_photo5': currentPhotos.length > 4 ? currentPhotos[4] : null,
    };

    await SupaFlow.client
        .from('trainings_market_temp')
        .update(updateData)
        .eq('id', tempId);

    if (kDebugMode)
      print('✅ Training photo replaced at index $photoIndex: $newUrl');
    return newUrl;
  } catch (e) {
    if (kDebugMode) print('❌ replaceTempTrainingPhoto error: $e');
    return '';
  }
}
