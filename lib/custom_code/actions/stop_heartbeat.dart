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

import 'dart:async';
import 'package:flutter/foundation.dart' show kDebugMode;

// This works because Dart isolates share globals within the same app instance
Timer? globalHeartbeatTimer;

Future<void> stopHeartbeat() async {
  globalHeartbeatTimer?.cancel();
  globalHeartbeatTimer = null;
  if (kDebugMode) print('⏹️ Heartbeat stopped');
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
