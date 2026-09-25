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

Future<bool> saveTempTrainingPlansFields(
  int tempId,
  String trainingPlanName,
  String trainingPlanDescription,
  String trainingPrice,
) async {
  try {
    if (tempId <= 0) {
      if (kDebugMode)
        print('❌ saveTempTrainingPlansFields: invalid tempId=$tempId');
      return false;
    }
    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) return false;

    final int price = int.tryParse(trainingPrice.trim()) ?? 0;

    await SupaFlow.client
        .from('training_plans_market_temp') // ← fixed table name
        .update({
          'training_plan_name': trainingPlanName,
          'training_plan_description': trainingPlanDescription,
          'training_plan_price': price, // ← fixed: int not string
          'expires_at': DateTime.now()
              .toUtc()
              .add(const Duration(minutes: 30))
              .toIso8601String(),
        })
        .eq('id', tempId)
        .eq('trainer_id', userId);

    if (kDebugMode)
      print('💾 Saved plan fields: name=$trainingPlanName, price=$price');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ saveTempTrainingPlansFields error: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
