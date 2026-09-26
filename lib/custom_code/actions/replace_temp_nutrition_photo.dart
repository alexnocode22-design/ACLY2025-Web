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
import '/flutter_flow/upload_data.dart';

Future<String> replaceTempNutritionPhoto(
  int tempId,
  int photoIndex,
  FFUploadedFile uploadedFile,
) async {
  try {
    final bytes = uploadedFile.bytes;
    if (bytes == null || bytes.isEmpty) return '';

    final row = await SupaFlow.client
        .from('nutrition_plans_market_temp')
        .select('nutrition_plan_photo, trainer_id')
        .eq('id', tempId)
        .single();

    final List<dynamic> currentPhotos =
        List<dynamic>.from(row['nutrition_plan_photo'] ?? []);
    final String trainerId = row['trainer_id'] as String;

    if (photoIndex < 0 || photoIndex >= currentPhotos.length) return '';

    const String tempBucket = 'acly-nutritionplans-temp';
    const String permBucket = 'acly-nutritionplans';

    final String oldUrl = currentPhotos[photoIndex] as String;
    String? oldBucket;
    String? oldPath;

    if (oldUrl.contains('/$tempBucket/')) {
      oldBucket = tempBucket;
      oldPath = oldUrl
          .substring(oldUrl.indexOf('/$tempBucket/') + tempBucket.length + 2);
    } else if (oldUrl.contains('/$permBucket/')) {
      oldBucket = permBucket;
      oldPath = oldUrl
          .substring(oldUrl.indexOf('/$permBucket/') + permBucket.length + 2);
    }

    if (oldBucket != null && oldPath != null) {
      try {
        await SupaFlow.client.storage.from(oldBucket).remove([oldPath]);
      } catch (e) {
        if (kDebugMode) print('⚠️ Old photo delete failed (non-fatal): $e');
      }
    }

    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final String newPath = '$trainerId/$tempId/$timestamp.jpg';

    await SupaFlow.client.storage.from(tempBucket).uploadBinary(newPath, bytes,
        fileOptions:
            const FileOptions(contentType: 'image/jpeg', upsert: true));

    final String newUrl =
        SupaFlow.client.storage.from(tempBucket).getPublicUrl(newPath);

    currentPhotos[photoIndex] = newUrl;

    await SupaFlow.client.from('nutrition_plans_market_temp').update({
      'nutrition_plan_photo': currentPhotos,
      'nutrition_plan_photo1':
          currentPhotos.isNotEmpty ? currentPhotos[0] : null,
      'nutrition_plan_photo2':
          currentPhotos.length > 1 ? currentPhotos[1] : null,
      'nutrition_plan_photo3':
          currentPhotos.length > 2 ? currentPhotos[2] : null,
      'nutrition_plan_photo4':
          currentPhotos.length > 3 ? currentPhotos[3] : null,
      'nutrition_plan_photo5':
          currentPhotos.length > 4 ? currentPhotos[4] : null,
    }).eq('id', tempId);

    if (kDebugMode)
      print('✅ Nutrition photo replaced at index $photoIndex: $newUrl');
    return newUrl;
  } catch (e) {
    if (kDebugMode) print('❌ replaceTempNutritionPhoto error: $e');
    return '';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
