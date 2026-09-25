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

Future<bool> deleteTempDigiProdPhoto(int tempId, int photoIndex) async {
  try {
    final row = await SupaFlow.client
        .from('digital_products_market_temp')
        .select('digital_product_photo, trainer_id')
        .eq('id', tempId)
        .single();

    final List<dynamic> currentPhotos =
        List<dynamic>.from(row['digital_product_photo'] ?? []);

    if (photoIndex < 0 || photoIndex >= currentPhotos.length) return false;

    final String photoUrl = currentPhotos[photoIndex] as String;
    const String tempBucket = 'acly-digiproduct-temp';
    const String permBucket = 'acly-digiproduct';

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

    await SupaFlow.client.from('digital_products_market_temp').update({
      'digital_product_photo': currentPhotos,
      'digital_product_photo1':
          currentPhotos.isNotEmpty ? currentPhotos[0] : null,
      'digital_product_photo2':
          currentPhotos.length > 1 ? currentPhotos[1] : null,
      'digital_product_photo3':
          currentPhotos.length > 2 ? currentPhotos[2] : null,
      'digital_product_photo4':
          currentPhotos.length > 3 ? currentPhotos[3] : null,
      'digital_product_photo5':
          currentPhotos.length > 4 ? currentPhotos[4] : null,
    }).eq('id', tempId);

    if (kDebugMode) print('✅ DigiProd photo deleted at index $photoIndex');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ deleteTempDigiProdPhoto error: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
