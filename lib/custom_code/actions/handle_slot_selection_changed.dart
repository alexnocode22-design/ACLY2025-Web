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

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

Future handleSlotSelectionChanged(
  List<dynamic> newSelectedSlots,
  List<dynamic> previousSelectedSlots,
  int trainingId,
  String trainerId,
  String sessionId,
  String trainingName,
  String trainingPhoto1,
  int trainingPrice,
) async {
  final supabase = SupaFlow.client;
  final userId = supabase.auth.currentUser?.id;

  if (userId == null) {
    print('❌ User not authenticated');
    return;
  }

  print('🔄 Handling slot selection change...');
  print('Training ID: $trainingId, Trainer ID: $trainerId');
  print('Session ID: $sessionId');
  print(
      'Previous slots: ${previousSelectedSlots.length}, New slots: ${newSelectedSlots.length}');

  // Find newly added slots
  final addedSlots = newSelectedSlots.where((newSlot) {
    return !previousSelectedSlots
        .any((oldSlot) => oldSlot['slotId'] == newSlot['slotId']);
  }).toList();

  // Find removed slots
  final removedSlots = previousSelectedSlots.where((oldSlot) {
    return !newSelectedSlots
        .any((newSlot) => newSlot['slotId'] == oldSlot['slotId']);
  }).toList();

  print('➕ Slots to add: ${addedSlots.length}');
  print('➖ Slots to remove: ${removedSlots.length}');

  // Insert newly selected slots into temp table
  for (var slot in addedSlots) {
    try {
      final slotId = slot['slotId'];
      final slotDate = slot['date'] as DateTime;
      final slotTime = slot['time'] as String; // "HH:mm" — display format

      print(
          '📍 Processing slot ID: $slotId for date: ${DateFormat('yyyy-MM-dd').format(slotDate)} at time: $slotTime');

      // ✅ CHECK IF BOOKING ALREADY EXISTS FIRST
      final existingBooking = await supabase
          .from('trainings_booked_temp')
          .select('id')
          .eq('user_id', userId)
          .eq('slot_id', slotId)
          .eq('session_id', sessionId)
          .maybeSingle();

      if (existingBooking != null) {
        print(
            '⚠️  Booking already exists for slot $slotId (ID: ${existingBooking['id']}), skipping insert');
        continue;
      }

      // Get full slot details from training_slots
      final slotDetails = await supabase
          .from('training_slots')
          .select()
          .eq('id', slotId)
          .single();

      print('📦 Retrieved slot details');

      // ─────────────────────────────────────────────────────────────────
      // TIMEZONE HANDLING (post 2026-04-21 migration)
      //
      // training_slots.start_time is plain TIME (no timezone) storing
      // UTC values (e.g. "05:00:00" for a Moscow 08:00 slot).
      //
      // We append "+00:00" when constructing slot_start_datetime so
      // Supabase interprets it unambiguously as UTC.
      //
      // Moscow display is handled at the presentation layer by adding
      // 3 hours when rendering.
      // ─────────────────────────────────────────────────────────────────

      // Read the authoritative UTC time from the DB (plain TIME "HH:mm:ss")
      String timeStr; // "HH:mm:ss"
      try {
        final startTime = slotDetails['start_time'];
        if (startTime != null) {
          final raw = startTime.toString(); // "05:00:00" or "05:00:00.000"
          timeStr = raw.length >= 8 ? raw.substring(0, 8) : '$slotTime:00';
        } else {
          timeStr = '$slotTime:00';
        }
      } catch (e) {
        print(
            '⚠️  Error reading start_time from DB: $e, falling back to widget time');
        timeStr = '$slotTime:00';
      }

      // Build slot_date string once — used in both the timestamp and
      // as a standalone field in the insert.
      final dateStr = DateFormat('yyyy-MM-dd').format(slotDate);

      // Construct UTC timestamp: DB time is already UTC, append +00:00.
      final slotStartDatetime = '${dateStr}T${timeStr}+00:00';

      print('✅ Constructed slot_start_datetime (UTC): $slotStartDatetime');

      // Prepare insert data
      final insertData = {
        'user_id': userId,
        'training_id': trainingId,
        'trainer_id': trainerId,
        'slot_id': slotId,
        'slot_start_datetime': slotStartDatetime,
        'slot_date': dateStr, // ← R4 fix: populate slot_date for resume flow
        'slot_duration': slot['duration'],
        'training_name': trainingName,
        'training_photo1': trainingPhoto1,
        'training_price': trainingPrice,
        'training_quantity': 1,
        'session_id': sessionId,
      };

      print('💾 Inserting into trainings_booked_temp...');

      final result = await supabase
          .from('trainings_booked_temp')
          .insert(insertData)
          .select()
          .single();

      print('✅ Added slot to temp bookings');
      print('   Temp booking ID: ${result['id']}');
    } catch (e) {
      print('❌ Error adding slot: $e');
      print('   Error details: ${e.toString()}');
      if (e.toString().contains('duplicate key')) {
        print('   ⚠️  Duplicate key violation - slot already exists');
      }
    }
  }

  // Remove deselected slots from temp table
  for (var slot in removedSlots) {
    try {
      final slotId = slot['slotId'];

      print('🗑️  Removing slot from temp bookings: $slotId');

      final result = await supabase
          .from('trainings_booked_temp')
          .delete()
          .eq('user_id', userId)
          .eq('slot_id', slotId)
          .eq('session_id', sessionId)
          .select();

      print('✅ Removed slot (${result.length} rows deleted)');
    } catch (e) {
      print('❌ Error removing slot: $e');
    }
  }

  print('✅ Slot selection change complete');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
}
