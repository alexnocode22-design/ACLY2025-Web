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

// Imports other custom actions
// Imports custom functions

import 'package:flutter/foundation.dart' show kDebugMode;

Future deleteFileURL(
  String? bucket,
  String? url,
) async {
  // ← ADD THIS GUARD
  if (bucket == null || bucket.isEmpty || url == null || url.isEmpty) {
    if (kDebugMode)
      print('⚠️ deleteFileURL skipped: bucket or url is null/empty');
    return;
  }

  try {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    final bucketIndex = segments.indexOf(bucket);
    if (bucketIndex == -1) {
      if (kDebugMode) print('❌ deleteFileURL: bucket not found in URL: $url');
      return;
    }
    final objectPath = segments.sublist(bucketIndex + 1).join('/');

    await SupaFlow.client.storage.from(bucket).remove([objectPath]);

    if (kDebugMode) print('✅ deleteFileURL: deleted $objectPath from $bucket');
  } catch (e) {
    if (kDebugMode) print('❌ deleteFileURL error: $e');
  }
}
