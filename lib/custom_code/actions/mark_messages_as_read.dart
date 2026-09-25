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

// Imports other custom actions
// Imports custom functions

import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> markMessagesAsRead(
  int chatID,
  String userID,
) async {
  try {
    final supabase = SupaFlow.client;
    final response = await supabase.rpc(
      'messages_read',
      params: {
        'user_id': userID,
        'chat_id': chatID,
      },
    );

    // Since our Supabase function returns void, we return true on success
    return true;
  } catch (e) {
    print('Error in markMessagesAsRead: $e');
    return false;
  }
}
