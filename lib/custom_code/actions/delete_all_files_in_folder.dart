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

Future<void> deleteAllFilesInFolder(
    String bucketName, String folderPath) async {
  final client = SupaFlow.client;

  try {
    // List all files in the specified folder
    final List<FileObject> response =
        await client.storage.from(bucketName).list(path: folderPath);

    if (response.isEmpty) {
      print('No files found in folder $folderPath.');
      return;
    }

    // Extract file names with full paths
    final fileNames =
        response.map((item) => '$folderPath/${item.name}').toList();

    // Delete each file in the folder
    if (fileNames.isNotEmpty) {
      final deleteResponse =
          await client.storage.from(bucketName).remove(fileNames);

      if (deleteResponse.isEmpty) {
        print('All files in folder $folderPath have been deleted.');
      } else {
        print('Error deleting some files.');
      }
    }
  } catch (e) {
    print('Error deleting files: $e');
  }
}
