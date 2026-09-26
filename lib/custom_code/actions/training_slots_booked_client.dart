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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future<List<DateTime>> trainingSlotsBookedClient() async {
  try {
    // Get the authenticated user ID
    final user = SupaFlow.client.auth.currentUser;
    if (user == null) {
      print('Error: No authenticated user found');
      return [];
    }

    final userId = user.id;
    print('Fetching training slots for user: $userId');

    final response = await SupaFlow.client
        .from('trainingsBought')
        .select('slot_start_datetime')
        .eq('user_id', userId)
        .eq('training_payed', true)
        .eq('slot_cancelled', false);

    if (response.isEmpty) {
      print('No training slots found for user: $userId');
      return [];
    }

    final List<DateTime> bookedDates = [];

    for (final record in response) {
      try {
        final dynamic raw = record['slot_start_datetime'];
        if (raw == null) {
          print('Warning: null slot_start_datetime in record: $record');
          continue;
        }
        // slot_start_datetime is stored in UTC — convert to Moscow (UTC+3)
        // to get the correct local date for calendar highlighting.
        final utcDt = raw is DateTime ? raw : DateTime.parse(raw.toString());
        final moscowDt = utcDt.toUtc().add(const Duration(hours: 3));
        // Add date-only (midnight) so calendar day comparison works correctly
        bookedDates.add(DateTime(moscowDt.year, moscowDt.month, moscowDt.day));
      } catch (dateParseError) {
        final String displayValue =
            record['slot_start_datetime']?.toString() ?? 'null';
        print(
            'Warning: Failed to parse slot_start_datetime "$displayValue": $dateParseError');
        continue;
      }
    }

    print(
        'Successfully retrieved ${bookedDates.length} training slots for user: $userId');
    return bookedDates;
  } catch (e) {
    print('Error fetching training slots: $e');
    return [];
  }
}
