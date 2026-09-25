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

Future<bool> publishTraining(
  int tempId,
  String name,
  String description,
  String price,
) async {
  try {
    final temp = await SupaFlow.client
        .from('trainings_market_temp')
        .select()
        .eq('id', tempId)
        .single();

    final List<dynamic> tempPhotos =
        List<dynamic>.from(temp['training_photo'] ?? []);
    final String trainerId = temp['trainer_id'];
    final String draftType = temp['draft_type'] ?? 'new';
    final int? sourceId = temp['source_training_id'] as int?;

    if (tempPhotos.isEmpty) {
      if (kDebugMode) print('❌ publishTraining: no photos');
      return false;
    }

    final List<String> finalUrls = [];

    for (final photoUrl in tempPhotos) {
      final String url = photoUrl as String;

      if (url.contains('/acly-trainings/') &&
          !url.contains('/acly-trainings-temp/')) {
        finalUrls.add(url);
        if (kDebugMode) print('✅ Photo already permanent, skipping: $url');
        continue;
      }

      final uri = Uri.parse(url);
      final segments = uri.pathSegments;
      final bucketIndex = segments.indexOf('acly-trainings-temp');
      if (bucketIndex == -1) {
        finalUrls.add(url);
        continue;
      }
      final objectPath = segments.sublist(bucketIndex + 1).join('/');

      // Download with 30s timeout — fails fast if file missing
      final bytes = await SupaFlow.client.storage
          .from('acly-trainings-temp')
          .download(objectPath)
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw Exception(
                '❌ Storage download timed out for: $objectPath'),
          );

      final timestamp = DateTime.now().microsecondsSinceEpoch;
      final targetTrainingId =
          (draftType == 'edit' && sourceId != null) ? sourceId : tempId;
      final newPath = '$trainerId/$targetTrainingId/${timestamp}.jpg';

      await SupaFlow.client.storage.from('acly-trainings').uploadBinary(
          newPath, bytes,
          fileOptions:
              const FileOptions(contentType: 'image/jpeg', upsert: true));

      final permanentUrl =
          SupaFlow.client.storage.from('acly-trainings').getPublicUrl(newPath);

      finalUrls.add(permanentUrl);

      await SupaFlow.client.storage
          .from('acly-trainings-temp')
          .remove([objectPath]);
    }

    final Map<String, dynamic> photoData = {
      'training_photo': finalUrls,
      'training_photo1': finalUrls.isNotEmpty ? finalUrls[0] : null,
      'training_photo2': finalUrls.length > 1 ? finalUrls[1] : null,
      'training_photo3': finalUrls.length > 2 ? finalUrls[2] : null,
      'training_photo4': finalUrls.length > 3 ? finalUrls[3] : null,
      'training_photo5': finalUrls.length > 4 ? finalUrls[4] : null,
    };

    if (draftType == 'edit' && sourceId != null) {
      await SupaFlow.client.from('trainingsMarket').update({
        'training_name': name,
        'training_description': description,
        'training_price': int.tryParse(price),
        ...photoData,
      }).eq('id', sourceId);
      if (kDebugMode) print('✅ Updated existing training: $sourceId');
    } else {
      await SupaFlow.client.from('trainingsMarket').insert({
        'trainer_id': trainerId,
        'training_name': name,
        'training_description': description,
        'training_price': int.tryParse(price),
        'slot_duration': temp['slot_duration'] ?? 60,
        'training_status': true,
        'training_publish': true,
        ...photoData,
      });
      if (kDebugMode) print('✅ Inserted new training');
    }

    await SupaFlow.client
        .from('trainings_market_temp')
        .delete()
        .eq('id', tempId);

    if (kDebugMode) print('✅ publishTraining complete');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ publishTraining error: $e');
    return false;
  }
}
