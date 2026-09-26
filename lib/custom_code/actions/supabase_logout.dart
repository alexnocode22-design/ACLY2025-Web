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

// Imports other custom actions
// Imports custom functions

// Custom Action - SupabaseLogout
Future<void> supabaseLogout() async {
  try {
    // Perform the logout action
    await SupaFlow.client.auth.signOut();

    // Log success or handle UI changes here if needed
    print('User logged out successfully');
  } catch (e) {
    // Handle errors if any
    print('Error logging out: $e');
    throw Exception('Failed to log out');
  }
}
