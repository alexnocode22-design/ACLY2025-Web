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

import 'package:flutter/foundation.dart' show kDebugMode;

Future<bool> checkImageFileSizeAction(
  FFUploadedFile uploadedFile,
  int maxSizeKb,
) async {
  try {
    final bytes = uploadedFile.bytes;

    // No file selected — return true to pass through silently
    // uploadTempTrainingPhoto will guard against empty bytes
    if (bytes == null || bytes.isEmpty) {
      if (kDebugMode)
        print('⚠️ checkImageFileSizeAction: no bytes, skipping size check');
      return true;
    }

    final fileSizeKb = bytes.length / 1024;
    if (kDebugMode)
      print(
          '📁 File size: ${fileSizeKb.toStringAsFixed(1)} KB, limit: $maxSizeKb KB');

    if (fileSizeKb > maxSizeKb) {
      if (kDebugMode)
        print('❌ File too large: ${fileSizeKb.toStringAsFixed(1)} KB');
      return false;
    }

    if (kDebugMode) print('✅ File size OK');
    return true;
  } catch (e) {
    if (kDebugMode) print('❌ checkImageFileSizeAction error: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
