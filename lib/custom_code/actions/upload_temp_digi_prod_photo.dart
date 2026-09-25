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

Future<String> uploadTempDigiProdPhoto(
  int tempId,
  FFUploadedFile uploadedFile,
) async {
  try {
    final bytes = uploadedFile.bytes;
    if (bytes == null || bytes.isEmpty) return '';

    final row = await SupaFlow.client
        .from('digital_products_market_temp')
        .select('digital_product_photo, trainer_id')
        .eq('id', tempId)
        .single();

    final List<dynamic> currentPhotos =
        List<dynamic>.from(row['digital_product_photo'] ?? []);
    final String trainerId = row['trainer_id'] as String;

    if (currentPhotos.length >= 5) {
      if (kDebugMode) print('⚠️ Max 5 photos reached');
      return 'MAX_REACHED';
    }

    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final String path = '$trainerId/$tempId/$timestamp.jpg';

    await SupaFlow.client.storage.from('acly-digiproduct-temp').uploadBinary(
        path, bytes,
        fileOptions:
            const FileOptions(contentType: 'image/jpeg', upsert: true));

    final String url = SupaFlow.client.storage
        .from('acly-digiproduct-temp')
        .getPublicUrl(path);

    currentPhotos.add(url);

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

    if (kDebugMode) print('✅ DigiProd photo uploaded: $url');
    return url;
  } catch (e) {
    if (kDebugMode) print('❌ uploadTempDigiProdPhoto error: $e');
    return '';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
