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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> finalizeBookings(
  String sessionId,
) async {
  final supabase = SupaFlow.client;
  final userId = supabase.auth.currentUser?.id;

  if (userId == null) {
    print('❌ User not authenticated');
    return 'Ошибка: пользователь не авторизован';
  }

  try {
    print('🔄 Finalizing bookings for session: $sessionId');

    // Step 1: Fetch all valid temp bookings for this session
    final tempBookings = await supabase
        .from('trainings_booked_temp')
        .select()
        .eq('session_id', sessionId)
        .eq('user_id', userId)
        .gt('expires_at', DateTime.now().toUtc().toIso8601String());

    if (tempBookings.isEmpty) {
      print('❌ No valid temp bookings found (may have expired)');
      return 'Время бронирования истекло. Пожалуйста, начните заново.';
    }

    print('📦 Found ${tempBookings.length} temp bookings to finalize');

    // Step 2: Build final bookings list
    List<Map<String, dynamic>> finalBookings = [];
    List<dynamic> slotIds = [];

    for (var booking in tempBookings) {
      finalBookings.add({
        'user_id': booking['user_id'],
        'training_id': booking['training_id'],
        'trainer_id': booking['trainer_id'],
        'slot_id': booking['slot_id'],
        'slot_start_datetime': booking['slot_start_datetime'],
        'slot_duration': booking['slot_duration'],
        'training_name': booking['training_name'],
        'training_photo1': booking['training_photo1'],
        'training_price': booking['training_price'],
        'training_quantity': booking['training_quantity'],
        'training_payed': true,
        'slot_cancelled': false,
        'created_at': DateTime.now().toUtc().toIso8601String(),
      });

      slotIds.add(booking['slot_id']);
    }

    // Step 3: Insert into trainingsBought
    print('💾 Inserting ${finalBookings.length} rows into trainingsBought...');
    try {
      await supabase.from('trainingsBought').insert(finalBookings);
    } on PostgrestException catch (e) {
      if (e.code == '23505') {
        print('❌ Duplicate booking detected: ${e.message}');
        return 'Этот слот только что был забронирован. Пожалуйста, выберите другое время.';
      }
      rethrow;
    }
    print('✅ Inserted into trainingsBought');

    // Step 4: Mark slots as unavailable
    print('🔒 Marking ${slotIds.length} slots as unavailable...');
    for (var slotId in slotIds) {
      try {
        await supabase
            .from('training_slots')
            .update({'is_available': false}).eq('id', slotId);
      } catch (e) {
        print('⚠️  Failed to mark slot $slotId as unavailable: $e');
      }
    }
    print('✅ Slots marked as unavailable');

    // Step 5: Delete temp bookings
    await supabase
        .from('trainings_booked_temp')
        .delete()
        .eq('session_id', sessionId)
        .eq('user_id', userId);
    print('✅ Temp bookings cleaned up');

    print('✅ Successfully finalized ${finalBookings.length} bookings');
    return '';
  } catch (e) {
    print('❌ Error finalizing bookings: $e');
    return 'Произошла ошибка при оформлении бронирования. Попробуйте ещё раз.';
  }
}
