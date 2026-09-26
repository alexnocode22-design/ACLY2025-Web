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

Future<List<String>> refreshTempPhotos(int tempId) async {
  try {
    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) return [];

    final row = await SupaFlow.client
        .from('trainings_market_temp')
        .select('training_photo')
        .eq('id', tempId)
        .eq('trainer_id', userId)
        .single();

    final photos = List<String>.from(row['training_photo'] ?? []);
    if (kDebugMode) print('📸 refreshTempPhotos: ${photos.length} photos');
    return photos;
  } catch (e) {
    if (kDebugMode) print('❌ refreshTempPhotos error: $e');
    return [];
  }
}
