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
import '/auth/supabase_auth/auth_util.dart';

Future<int> initOrResumeEditDigiProd(int digiProdId) async {
  try {
    final String userId = currentUserUid;

    final existing = await SupaFlow.client
        .from('digital_products_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .eq('source_product_id', digiProdId)
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (existing != null) {
      final int tempId = existing['id'] as int;
      FFAppState().draftDigiProdTempId = tempId;
      FFAppState().draftDigiProdName =
          (existing['digital_product_name'] ?? '') as String;
      FFAppState().draftDigiProdDescription =
          (existing['digital_product_description'] ?? '') as String;
      FFAppState().draftDigiProdPrice =
          existing['digital_product_price'] != null
              ? (existing['digital_product_price'] as int).toString()
              : '';

      // Reset temp PDF to permanent if cron cleaned it up
      final String? tempPdfUrl = existing['digital_product_file'] as String?;
      if (tempPdfUrl != null &&
          tempPdfUrl.isNotEmpty &&
          tempPdfUrl.contains('/acly-digiproduct-temp/')) {
        try {
          final real = await SupaFlow.client
              .from('digitalProductMarket')
              .select('digital_product_file')
              .eq('id', digiProdId)
              .single();
          final String? permanentUrl = real['digital_product_file'] as String?;
          if (permanentUrl != null && permanentUrl.isNotEmpty) {
            await SupaFlow.client.from('digital_products_market_temp').update(
                {'digital_product_file': permanentUrl}).eq('id', tempId);
            if (kDebugMode)
              print('✅ Reset DigiProd PDF to permanent: $permanentUrl');
          }
        } catch (e) {
          if (kDebugMode) print('⚠️ Could not reset DigiProd PDF: $e');
        }
      }

      if (kDebugMode)
        print('✅ Resuming EDIT DigiProd draft: $tempId for plan: $digiProdId');
      return tempId;
    }

    // Fetch real plan and copy to temp
    final real = await SupaFlow.client
        .from('digitalProductMarket')
        .select()
        .eq('id', digiProdId)
        .single();

    final List<dynamic> existingPhotos =
        List<dynamic>.from(real['digital_product_photo'] ?? []);

    final inserted = await SupaFlow.client
        .from('digital_products_market_temp')
        .insert({
          'trainer_id': userId,
          'draft_type': 'edit',
          'source_product_id': digiProdId,
          'digital_product_name': real['digital_product_name'],
          'digital_product_description': real['digital_product_description'],
          'digital_product_price': real['digital_product_price'],
          'digital_product_photo': existingPhotos,
          'digital_product_file': real['digital_product_file'],
        })
        .select()
        .single();

    final int tempId = inserted['id'] as int;
    FFAppState().draftDigiProdTempId = tempId;
    FFAppState().draftDigiProdName =
        (real['digital_product_name'] ?? '') as String;
    FFAppState().draftDigiProdDescription =
        (real['digital_product_description'] ?? '') as String;
    FFAppState().draftDigiProdPrice = real['digital_product_price'] != null
        ? (real['digital_product_price'] as int).toString()
        : '';

    if (kDebugMode)
      print('✅ Created EDIT DigiProd draft: $tempId for plan: $digiProdId');
    return tempId;
  } catch (e) {
    if (kDebugMode) print('❌ initOrResumeEditDigiProd error: $e');
    return 0;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
