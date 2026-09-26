import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? currentTimeToMoscowTime() {
  // Take CurrentTime For example 2025-12-10 14:14:57.199732 add 3 hours and return in the same format
  DateTime currentTime = DateTime.parse("2025-12-10 14:14:57.199732");
  DateTime moscowTime = currentTime.add(Duration(hours: 3));
  return moscowTime;
}
