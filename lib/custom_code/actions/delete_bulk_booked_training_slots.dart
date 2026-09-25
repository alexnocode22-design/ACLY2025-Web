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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> deleteBulkBookedTrainingSlots(List<int> trainingBoughtIds) async {
  try {
    print(
        '🗑️ Starting bulk deletion for ${trainingBoughtIds.length} base bookings');
    print('📋 Booking IDs: $trainingBoughtIds');

    final response = await SupaFlow.client.rpc(
        'delete_bulk_booked_training_slots',
        params: {'input_ids': trainingBoughtIds});

    if (response == true) {
      print('✅ Bulk deletion successful');
      print('   Removed recurring bookings for 3 weeks');
      print('   Released blocked time slots');
      return true;
    } else {
      print('⚠️ Bulk deletion returned false');
      return false;
    }
  } catch (e) {
    print('❌ Error in deleting bulk booked slots: $e');
    return false;
  }
}
