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

Future<bool> publishDigiProd(
  int tempId,
  String name,
  String description,
  String price,
) async {
  Future<T> withRetry<T>(
    Future<T> Function() fn, {
    int maxAttempts = 3,
    String label = '',
  }) async {
    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        return await fn();
      } catch (e) {
        if (kDebugMode) print('⚠️ $label attempt $attempt/$maxAttempts: $e');
        if (attempt == maxAttempts) rethrow;
        await Future.delayed(Duration(seconds: attempt * 2));
      }
    }
    throw Exception('$label: all attempts exhausted');
  }

  try {
    final temp = await SupaFlow.client
        .from('digital_products_market_temp')
        .select()
        .eq('id', tempId)
        .single();

    final List<dynamic> tempPhotos =
        List<dynamic>.from(temp['digital_product_photo'] ?? []);
    final String trainerId = temp['trainer_id'];
    final String draftType = temp['draft_type'] ?? 'new';
    final int? sourceId = temp['source_product_id'] as int?;

    if (tempPhotos.isEmpty) {
      if (kDebugMode) print('❌ publishDigiProd: no photos');
      return false;
    }

    const String tempBucket = 'acly-digiproduct-temp';
    const String permBucket = 'acly-digiproduct';
    final int targetId =
        (draftType == 'edit' && sourceId != null) ? sourceId : tempId;

    // ── Photos ─────────────────────────────────────────────────────────────
    final List<String> finalUrls = [];

    for (int i = 0; i < tempPhotos.length; i++) {
      final String url = tempPhotos[i] as String;

      if (url.contains('/$permBucket/') && !url.contains('/$tempBucket/')) {
        finalUrls.add(url);
        if (kDebugMode) print('✅ Photo $i already permanent');
        continue;
      }

      final int pos = url.indexOf('/$tempBucket/');
      if (pos == -1) {
        finalUrls.add(url);
        continue;
      }

      final String objectPath = url.substring(pos + tempBucket.length + 2);

      try {
        final permanentUrl = await withRetry(() async {
          final bytes = await SupaFlow.client.storage
              .from(tempBucket)
              .download(objectPath);
          final timestamp = DateTime.now().microsecondsSinceEpoch;
          final newPath = '$trainerId/$targetId/$timestamp.jpg';
          await SupaFlow.client.storage.from(permBucket).uploadBinary(
              newPath, bytes,
              fileOptions:
                  const FileOptions(contentType: 'image/jpeg', upsert: true));
          final url =
              SupaFlow.client.storage.from(permBucket).getPublicUrl(newPath);
          await SupaFlow.client.storage.from(tempBucket).remove([objectPath]);
          return url;
        }, label: 'photo $i move');

        finalUrls.add(permanentUrl);
        if (kDebugMode) print('✅ Photo $i moved: $permanentUrl');
      } catch (e) {
        if (kDebugMode) print('❌ Photo $i failed after retries: $e');
      }
    }

    if (finalUrls.isEmpty) {
      if (kDebugMode) print('❌ publishDigiProd: all photo moves failed');
      return false;
    }

    final Map<String, dynamic> photoData = {
      'digital_product_photo': finalUrls,
      'digital_product_photo1': finalUrls.isNotEmpty ? finalUrls[0] : null,
      'digital_product_photo2': finalUrls.length > 1 ? finalUrls[1] : null,
      'digital_product_photo3': finalUrls.length > 2 ? finalUrls[2] : null,
      'digital_product_photo4': finalUrls.length > 3 ? finalUrls[3] : null,
      'digital_product_photo5': finalUrls.length > 4 ? finalUrls[4] : null,
    };

    // ── PDF ────────────────────────────────────────────────────────────────
    final String? pdfUrl = temp['digital_product_file'] as String?;
    String? finalPdfUrl = pdfUrl;

    if (pdfUrl != null && pdfUrl.isNotEmpty) {
      if (pdfUrl.contains('/$permBucket/') &&
          !pdfUrl.contains('/$tempBucket/')) {
        if (kDebugMode) print('✅ PDF already permanent');
      } else if (pdfUrl.contains('/$tempBucket/')) {
        final int pos = pdfUrl.indexOf('/$tempBucket/');
        final String objectPath = pdfUrl.substring(pos + tempBucket.length + 2);
        try {
          finalPdfUrl = await withRetry(() async {
            final bytes = await SupaFlow.client.storage
                .from(tempBucket)
                .download(objectPath);
            final newPath = '$trainerId/$targetId/digiproduct.pdf';
            await SupaFlow.client.storage.from(permBucket).uploadBinary(
                newPath, bytes,
                fileOptions: const FileOptions(
                    contentType: 'application/pdf', upsert: true));
            final url =
                SupaFlow.client.storage.from(permBucket).getPublicUrl(newPath);
            await SupaFlow.client.storage.from(tempBucket).remove([objectPath]);
            return url;
          }, label: 'PDF move');
          if (kDebugMode) print('✅ PDF moved: $finalPdfUrl');
        } catch (pdfError) {
          if (kDebugMode) print('⚠️ PDF move failed: $pdfError');
          if (draftType == 'edit' && sourceId != null) {
            try {
              final sourceRow = await SupaFlow.client
                  .from('digitalProductMarket')
                  .select('digital_product_file')
                  .eq('id', sourceId)
                  .single();
              finalPdfUrl = sourceRow['digital_product_file'] as String?;
            } catch (_) {
              finalPdfUrl = null;
            }
          } else {
            finalPdfUrl = null;
          }
        }
      }
    }

    // ── DB write ───────────────────────────────────────────────────────────
    await withRetry(() async {
      if (draftType == 'edit' && sourceId != null) {
        await SupaFlow.client.from('digitalProductMarket').update({
          'digital_product_name': name,
          'digital_product_description': description,
          'digital_product_price': int.tryParse(price),
          'digital_product_file': finalPdfUrl,
          'digital_product_status': true,
          'digital_product_publish': true,
          ...photoData,
        }).eq('id', sourceId);
        if (kDebugMode) print('✅ Updated DigiProd: $sourceId');
      } else {
        await SupaFlow.client.from('digitalProductMarket').insert({
          'trainer_id': trainerId,
          'digital_product_name': name,
          'digital_product_description': description,
          'digital_product_price': int.tryParse(price),
          'digital_product_file': finalPdfUrl,
          'digital_product_status': true,
          'digital_product_publish': true,
          ...photoData,
        });
        if (kDebugMode) print('✅ Inserted new DigiProd');
      }
    }, label: 'DB write');

    // ── Cleanup ────────────────────────────────────────────────────────────
    await SupaFlow.client
        .from('digital_products_market_temp')
        .delete()
        .eq('id', tempId);

    if (kDebugMode) print('✅ publishDigiProd complete');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ publishDigiProd error: $e');
    return false;
  }
}
