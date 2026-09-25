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

Future<dynamic> removeBookedSlotsFromAvailable(
  dynamic availableSlots,
  List<TrainingsBookedTempRow> bookedSlots,
) async {
  if (availableSlots == null || bookedSlots.isEmpty) {
    return availableSlots;
  }

  // Convert to mutable map
  Map<String, List<dynamic>> available = {};

  if (availableSlots is Map) {
    availableSlots.forEach((key, value) {
      if (value is List) {
        available[key.toString()] = List<dynamic>.from(value);
      }
    });
  }

  // Extract booked slot IDs as integers (BIGINT)
  Set<int> bookedSlotIds = {};
  for (var booking in bookedSlots) {
    if (booking.slotId != null) {
      bookedSlotIds.add(booking.slotId!); // ✅ Already int, no conversion needed
    }
  }

  print(
      '🗑️  Removing ${bookedSlotIds.length} booked slots from available slots');
  print('   Booked slot IDs: $bookedSlotIds');

  // Remove booked slots from available
  int removedCount = 0;
  available.forEach((dateKey, slots) {
    final originalCount = slots.length;

    available[dateKey] = slots.where((slot) {
      // slotId in the map is dynamic, could be int or String
      final slotId = slot['slotId'];

      // Convert to int for comparison if needed
      int slotIdInt;
      if (slotId is int) {
        slotIdInt = slotId;
      } else if (slotId is String) {
        try {
          slotIdInt = int.parse(slotId);
        } catch (e) {
          print('⚠️  Could not parse slotId: $slotId');
          return true; // Keep the slot if we can't parse
        }
      } else {
        print('⚠️  Unknown slotId type: ${slotId.runtimeType}');
        return true; // Keep the slot if unknown type
      }

      // Return true to keep, false to remove
      return !bookedSlotIds.contains(slotIdInt);
    }).toList();

    removedCount += originalCount - available[dateKey]!.length;
  });

  print('✅ Removed $removedCount slots from available');

  // Remove empty dates
  available.removeWhere((key, value) => value.isEmpty);

  print('✅ Available slots updated: ${available.length} dates remaining');

  return available;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
