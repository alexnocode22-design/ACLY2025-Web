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

import 'package:intl/intl.dart';

Future<List<TrainingSlotsRow>> removeBookedSlotsFromAvailableList(
  List<TrainingSlotsRow> availableSlotsList,
  List<TrainingsBookedTempRow> bookedSlots,
) async {
  if (availableSlotsList.isEmpty || bookedSlots.isEmpty) {
    return availableSlotsList;
  }

  // Extract booked slot IDs
  Set<int> bookedSlotIds = {};
  for (var booking in bookedSlots) {
    if (booking.slotId != null) {
      bookedSlotIds.add(booking.slotId!);
    }
  }

  print(
      '🗑️ Removing ${bookedSlotIds.length} booked slots from ${availableSlotsList.length} available slots');

  // Filter out booked slots
  List<TrainingSlotsRow> filteredSlots = availableSlotsList.where((slot) {
    return !bookedSlotIds.contains(slot.id);
  }).toList();

  print('✅ ${filteredSlots.length} slots remaining');
  return filteredSlots;
}
