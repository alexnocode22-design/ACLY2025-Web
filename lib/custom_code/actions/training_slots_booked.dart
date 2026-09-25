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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<List<DateTime>> trainingSlotsBooked(
  String trainerID,
  bool slotCancelled,
  bool trainingPayed,
) async {
  final response = await SupaFlow.client
      .from('trainingsBought')
      .select('slot_start_datetime')
      .eq('trainer_id', trainerID)
      .eq('slot_cancelled', slotCancelled)
      .eq('training_payed', trainingPayed);

  if (response == null || response.isEmpty) {
    return [];
  }

  try {
    final List<DateTime> bookedDates = [];

    for (final record in response) {
      final raw = record['slot_start_datetime'];
      if (raw == null) continue;
      // slot_start_datetime is stored in UTC — convert to Moscow (UTC+3)
      // to get the correct local date for calendar highlighting.
      final utcDt = raw is DateTime ? raw : DateTime.parse(raw.toString());
      final moscowDt = utcDt.toUtc().add(const Duration(hours: 3));
      // Add date-only (midnight) so calendar day comparison works correctly
      bookedDates.add(DateTime(moscowDt.year, moscowDt.month, moscowDt.day));
    }

    return bookedDates;
  } catch (e) {
    print('Error parsing slot_start_datetime: $e');
    return [];
  }
}
