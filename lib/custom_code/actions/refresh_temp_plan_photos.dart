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

Future<List<String>> refreshTempPlanPhotos(int tempId) async {
  try {
    final row = await SupaFlow.client
        .from('training_plans_market_temp')
        .select('training_plan_photo')
        .eq('id', tempId)
        .single();

    final photos = List<String>.from(row['training_plan_photo'] ?? []);
    if (kDebugMode) print('✅ Plan photos refreshed: ${photos.length}');
    return photos;
  } catch (e) {
    if (kDebugMode) print('❌ refreshTempPlanPhotos error: $e');
    return [];
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
