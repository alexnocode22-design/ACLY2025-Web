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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> bulkBookTrainingSlots(List<int> trainingBoughtIds) async {
  try {
    print('📦 Starting bulk booking for ${trainingBoughtIds.length} slots');

    print('📋 Booking IDs: $trainingBoughtIds');

    final response = await SupaFlow.client.rpc('bulk_book_training_slots',
        params: {'input_ids': trainingBoughtIds});

    if (response == true) {
      print('✅ Bulk booking successful');
      print('   Created recurring bookings for 3 additional weeks');
      return true;
    } else {
      print(
          '⚠️ Bulk booking returned false - some slots may not have been available');
      return false;
    }
  } catch (e) {
    print('❌ Error in bulk booking: $e');
    // Check for specific error types
    if (e.toString().contains('slot not available')) {
      print('   Reason: One or more slots are no longer available');
    } else if (e.toString().contains('trainer already booked')) {
      print('   Reason: Trainer has conflicting bookings');
    }
    return false;
  }
}
