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

Future<void> deleteImageFromBucketUserID(
  String? imageUrl,
  String? userId,
) async {
  if (imageUrl == null) {
    print('URL изображения не указан.');
    return; // Выход из функции, если URL-адрес изображения равен нулю
  }
  try {
    // Извлечь имя файла из URL
    final List<String> urlParts = imageUrl.split('/');
    final String imageName = urlParts.last;

    final String imgDeletePath = '$userId/$imageName';

    final response = await SupaFlow.client.storage
        .from('acly-users')
        .remove([imgDeletePath]); // Укажите полный путь к изображению
    if (response.isEmpty) {
      print('Изображение успешно удалено');
      // Выполните любое другое действие после удаления изображения.
    } else {
      print('Ошибка удаления изображения.');
      // Обработка ошибки по мере необходимости
    }
  } catch (e) {
    print('Error: $e');
    // Обработка ошибки по мере необходимости
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
