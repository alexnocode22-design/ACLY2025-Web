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

import 'package:intl/intl.dart';

Future<dynamic> formatSlotsForCalendar(
  List<TrainingSlotsRow> rawSlots,
) async {
  Map<String, List<dynamic>> groupedSlots = {};

  for (var slot in rawSlots) {
    try {
      final slotDate = slot.slotDate;
      final startTime = slot.startTime;
      final duration = slot.slotDuration ?? 30;
      final slotId = slot.id;

      if (slotDate == null || startTime == null || slotId == null) {
        print('Skipping slot: missing required fields');
        continue;
      }

      // Parse UTC time from DB
      final timeString = startTime.toString(); // "HH:mm:ss"
      final timeParts = timeString.split(':');
      final utcHour = int.tryParse(timeParts[0]) ?? 0;
      final utcMinute =
          int.tryParse(timeParts.length > 1 ? timeParts[1] : '0') ?? 0;

      // Convert UTC → Moscow (UTC+3)
      final utcDateTime = DateTime.utc(
        slotDate.year,
        slotDate.month,
        slotDate.day,
        utcHour,
        utcMinute,
      );
      final moscowDateTime = utcDateTime.add(const Duration(hours: 3));

      // Format Moscow time as "HH:mm"
      final timeStr = DateFormat('HH:mm').format(moscowDateTime);

      // Use Moscow date as the date key (slot may cross midnight)
      final dateKey = DateFormat('yyyy-MM-dd').format(moscowDateTime);

      if (!groupedSlots.containsKey(dateKey)) {
        groupedSlots[dateKey] = [];
      }

      groupedSlots[dateKey]!.add({
        'time': timeStr,
        'duration': duration,
        'slotId': slotId,
      });

      print('Added slot: date=$dateKey, time=$timeStr (Moscow), id=$slotId');
    } catch (e) {
      print('Error formatting slot: $e');
      continue;
    }
  }

  // Sort each day's slots by time
  groupedSlots.forEach((dateKey, slots) {
    slots.sort((a, b) {
      try {
        final timeA = DateFormat('HH:mm').parse(a['time']);
        final timeB = DateFormat('HH:mm').parse(b['time']);
        return timeA.compareTo(timeB);
      } catch (e) {
        return 0;
      }
    });
  });

  print('Formatted ${groupedSlots.length} dates with slots');
  return groupedSlots;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
