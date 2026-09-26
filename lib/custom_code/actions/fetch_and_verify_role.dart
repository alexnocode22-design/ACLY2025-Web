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

import 'package:flutter/foundation.dart' show kDebugMode;

/// Fetches is_trainer live from DB, updates FFAppState().userRole, returns
/// true if trainer.
///
/// Used by ClientMainWidget On-Page-Load to replace the stale
/// SharedPreferences check.
Future<bool> fetchAndVerifyRole() async {
  try {
    final userId = SupaFlow.client.auth.currentUser?.id;
    if (userId == null) return false;

    final rows = await SupaFlow.client
        .from('user_profiles')
        .select('is_trainer')
        .eq('user_id', userId)
        .limit(1);

    if (rows == null || (rows as List).isEmpty) return false;

    final isTrainer = (rows.first['is_trainer'] as bool?) ?? false;

    FFAppState().userRole = isTrainer ? ['Trainer'] : ['Client'];

    return isTrainer;
  } catch (e) {
    if (kDebugMode) print('fetchAndVerifyRole error: $e');
    return false;
  }
}
