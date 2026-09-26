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

Future<bool> deleteTempNutritionPhoto(int tempId, int photoIndex) async {
  try {
    final row = await SupaFlow.client
        .from('nutrition_plans_market_temp')
        .select('nutrition_plan_photo, trainer_id')
        .eq('id', tempId)
        .single();

    final List<dynamic> currentPhotos =
        List<dynamic>.from(row['nutrition_plan_photo'] ?? []);

    if (photoIndex < 0 || photoIndex >= currentPhotos.length) return false;

    final String photoUrl = currentPhotos[photoIndex] as String;
    const String tempBucket = 'acly-nutritionplans-temp';
    const String permBucket = 'acly-nutritionplans';

    String? bucket;
    String? objectPath;

    if (photoUrl.contains('/$tempBucket/')) {
      bucket = tempBucket;
      objectPath = photoUrl
          .substring(photoUrl.indexOf('/$tempBucket/') + tempBucket.length + 2);
    } else if (photoUrl.contains('/$permBucket/')) {
      bucket = permBucket;
      objectPath = photoUrl
          .substring(photoUrl.indexOf('/$permBucket/') + permBucket.length + 2);
    }

    if (bucket != null && objectPath != null) {
      try {
        await SupaFlow.client.storage.from(bucket).remove([objectPath]);
      } catch (e) {
        if (kDebugMode) print('⚠️ Storage delete failed (non-fatal): $e');
      }
    }

    currentPhotos.removeAt(photoIndex);

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

    if (kDebugMode) print('✅ Nutrition photo deleted at index $photoIndex');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ deleteTempNutritionPhoto error: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
