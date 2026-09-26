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

Future<bool> saveTempTrainingFields(
  int tempId,
  String trainingName,
  String trainingDescription,
  String trainingPrice,
  String slotDuration,
) async {
  try {
    if (tempId <= 0) {
      if (kDebugMode) print('❌ saveTempTrainingFields: invalid tempId=$tempId');
      return false;
    }

    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) return false;

    // Parse safely inside the action — no crashes if field is empty
    final price = int.tryParse(trainingPrice.trim()) ?? 0;
    final duration = int.tryParse(slotDuration.trim()) ?? 60;

    await SupaFlow.client
        .from('trainings_market_temp')
        .update({
          'training_name': trainingName,
          'training_description': trainingDescription,
          'training_price': price,
          'slot_duration': duration,
          'expires_at': DateTime.now()
              .toUtc()
              .add(const Duration(minutes: 30))
              .toIso8601String(),
        })
        .eq('id', tempId)
        .eq('trainer_id', userId);

    if (kDebugMode) {
      print('💾 Saved: name=$trainingName, price=$price, duration=$duration');
    }
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ saveTempTrainingFields error: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
