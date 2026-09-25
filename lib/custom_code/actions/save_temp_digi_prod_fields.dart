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

Future<bool> saveTempDigiProdFields(
  int tempId,
  String digiProdName,
  String digiProdDescription,
  String digiProdPrice,
) async {
  try {
    if (tempId <= 0) {
      if (kDebugMode) print('❌ saveTempDigiProdFields: invalid tempId=$tempId');
      return false;
    }
    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) return false;

    final int price = int.tryParse(digiProdPrice.trim()) ?? 0;

    await SupaFlow.client
        .from('digital_products_market_temp')
        .update({
          'digital_product_name': digiProdName,
          'digital_product_description': digiProdDescription,
          'digital_product_price': price,
          'expires_at': DateTime.now()
              .toUtc()
              .add(const Duration(minutes: 30))
              .toIso8601String(),
        })
        .eq('id', tempId)
        .eq('trainer_id', userId);

    if (kDebugMode)
      print('💾 Saved digi prod fields: name=$digiProdName, price=$price');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ saveTempDigiProdFields error: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
