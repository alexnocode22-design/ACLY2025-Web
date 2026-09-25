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

Future<bool> loadOrCreateDigiProdDraft() async {
  try {
    final String userId = currentUserUid;

    // Clean stale edit drafts older than 24h
    await SupaFlow.client
        .from('digital_products_market_temp')
        .delete()
        .eq('trainer_id', userId)
        .eq('draft_type', 'edit')
        .lt(
            'created_at',
            DateTime.now()
                .toUtc()
                .subtract(const Duration(hours: 24))
                .toIso8601String());

    // Look for existing new draft
    final existing = await SupaFlow.client
        .from('digital_products_market_temp')
        .select()
        .eq('trainer_id', userId)
        .eq('draft_type', 'new')
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (existing != null) {
      FFAppState().draftDigiProdTempId = existing['id'] as int;
      FFAppState().draftDigiProdName =
          (existing['digital_product_name'] ?? '') as String;
      FFAppState().draftDigiProdDescription =
          (existing['digital_product_description'] ?? '') as String;
      FFAppState().draftDigiProdPrice =
          existing['digital_product_price'] != null
              ? (existing['digital_product_price'] as int).toString()
              : '';
      if (kDebugMode) print('✅ Resuming NEW DigiProd draft: ${existing['id']}');
      return true;
    }

    // Create new draft
    try {
      final inserted = await SupaFlow.client
          .from('digital_products_market_temp')
          .insert({'trainer_id': userId, 'draft_type': 'new'})
          .select()
          .single();
      FFAppState().draftDigiProdTempId = inserted['id'] as int;
      FFAppState().draftDigiProdName = '';
      FFAppState().draftDigiProdDescription = '';
      FFAppState().draftDigiProdPrice = '';
      if (kDebugMode) print('✅ Created new DigiProd draft: ${inserted['id']}');
    } catch (insertError) {
      if (kDebugMode)
        print('⚠️ Insert blocked, fetching existing draft: $insertError');
      final recovered = await SupaFlow.client
          .from('digital_products_market_temp')
          .select()
          .eq('trainer_id', userId)
          .eq('draft_type', 'new')
          .order('created_at', ascending: false)
          .limit(1)
          .single();
      FFAppState().draftDigiProdTempId = recovered['id'] as int;
      FFAppState().draftDigiProdName =
          (recovered['digital_product_name'] ?? '') as String;
      FFAppState().draftDigiProdDescription =
          (recovered['digital_product_description'] ?? '') as String;
      FFAppState().draftDigiProdPrice =
          recovered['digital_product_price'] != null
              ? (recovered['digital_product_price'] as int).toString()
              : '';
      if (kDebugMode)
        print('✅ Recovered existing DigiProd draft: ${recovered['id']}');
    }
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ loadOrCreateDigiProdnDraft error: $e');
    return false;
  }
}
