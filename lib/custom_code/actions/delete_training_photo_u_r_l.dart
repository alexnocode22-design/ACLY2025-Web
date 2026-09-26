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

Future<void> deleteTrainingPhotoURL(String? bucket, String? url) async {
  // delete file name = last two parts from  'url', from 'bucket' on Supabase storage
  if (bucket == null || url == null) {
    throw Exception('Bucket and URL cannot be null');
  }

  final supabase = SupaFlow.client;

  // Split the URL into parts
  final urlParts = url.split('/');

  // Extract the last two parts (parent folder and file name)
  final parentFolder = urlParts[urlParts.length - 3];
  final trainingFolder = urlParts[urlParts.length - 2];
  final fileName = urlParts[urlParts.length - 1];

  // Create the path to the file to be deleted
  final filePath = '$parentFolder/$trainingFolder/$fileName';

  // Delete the file from Supabase storage
  final response = await supabase.storage.from(bucket).remove([filePath]);

  //if (response.error != null) {
  // throw Exception('Error deleting file: ${response.error!.message}');
}
