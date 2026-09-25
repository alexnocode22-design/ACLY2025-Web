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

Future<List<String>> refreshTempDigiProdPhotos(int tempId) async {
  try {
    final row = await SupaFlow.client
        .from('digital_products_market_temp')
        .select('digital_product_photo')
        .eq('id', tempId)
        .single();

    final List<dynamic> photos =
        List<dynamic>.from(row['digital_product_photo'] ?? []);
    final result = photos.map((e) => e.toString()).toList();
    if (kDebugMode)
      print('📸 refreshTempDigiProdPhotos: ${result.length} photos');
    return result;
  } catch (e) {
    if (kDebugMode) print('❌ refreshTempDigiProdPhotos error: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
