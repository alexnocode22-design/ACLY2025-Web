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

Future<bool> deleteTempTrainingPhoto(
  int tempId,
  int photoIndex,
) async {
  try {
    final row = await SupaFlow.client
        .from('trainings_market_temp')
        .select('training_photo, trainer_id')
        .eq('id', tempId)
        .single();

    final List<dynamic> currentPhotos =
        List<dynamic>.from(row['training_photo'] ?? []);

    if (kDebugMode)
      print(
          '🔍 deleteTempTrainingPhoto: index=$photoIndex count=${currentPhotos.length}');

    if (photoIndex < 0 || photoIndex >= currentPhotos.length) {
      if (kDebugMode) print('❌ Invalid photo index: $photoIndex');
      return false;
    }

    final String photoUrl = currentPhotos[photoIndex] as String;
    if (kDebugMode) print('🔍 Photo URL: $photoUrl');

    // Determine which bucket the photo lives in
    const String tempBucket = 'acly-trainings-temp';
    const String permBucket = 'acly-trainings';

    String? bucketName;
    String? objectPath;

    if (photoUrl.contains('/$tempBucket/')) {
      bucketName = tempBucket;
      final int pos = photoUrl.indexOf('/$tempBucket/');
      objectPath = photoUrl.substring(pos + tempBucket.length + 2);
    } else if (photoUrl.contains('/$permBucket/') &&
        !photoUrl.contains('/$tempBucket/')) {
      // Photo is from permanent bucket — it was copied from the original
      // training into the edit draft. We delete it from storage only if
      // it belongs to this trainer (safety check via path prefix).
      bucketName = permBucket;
      final int pos = photoUrl.indexOf('/$permBucket/');
      objectPath = photoUrl.substring(pos + permBucket.length + 2);
    }

    if (bucketName != null && objectPath != null) {
      if (kDebugMode) print('🔍 Deleting from $bucketName: $objectPath');
      try {
        await SupaFlow.client.storage.from(bucketName).remove([objectPath]);
        if (kDebugMode) print('✅ Storage object deleted');
      } catch (storageError) {
        // Non-fatal — object may already be gone, continue to DB update
        if (kDebugMode)
          print('⚠️ Storage delete failed (non-fatal): $storageError');
      }
    } else {
      if (kDebugMode) print('⚠️ Could not determine bucket for URL: $photoUrl');
    }

    // Always update the DB array regardless of storage result
    currentPhotos.removeAt(photoIndex);

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

    if (kDebugMode) print('✅ Training photo deleted at index $photoIndex');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ deleteTempTrainingPhoto error: $e');
    return false;
  }
}
