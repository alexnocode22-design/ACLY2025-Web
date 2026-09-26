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

Future<int> getSlotDuration(int trainingId) async {
  try {
    final row = await SupaFlow.client
        .from('trainingsMarket')
        .select('slot_duration')
        .eq('id', trainingId)
        .single();

    final val = row['slot_duration'];
    print('📖 getSlotDuration: trainingId=$trainingId → $val');
    return (val as num).toInt();
  } catch (e) {
    print('❌ getSlotDuration error: $e');
    return 30; // safe default
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
