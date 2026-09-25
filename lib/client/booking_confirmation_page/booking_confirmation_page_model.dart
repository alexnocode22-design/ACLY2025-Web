import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'booking_confirmation_page_widget.dart'
    show BookingConfirmationPageWidget;
import 'package:flutter/material.dart';

class BookingConfirmationPageModel
    extends FlutterFlowModel<BookingConfirmationPageWidget> {
  ///  Local state fields for this page.

  List<TrainingsBoughtRow> recentBookings = [];
  void addToRecentBookings(TrainingsBoughtRow item) => recentBookings.add(item);
  void removeFromRecentBookings(TrainingsBoughtRow item) =>
      recentBookings.remove(item);
  void removeAtIndexFromRecentBookings(int index) =>
      recentBookings.removeAt(index);
  void insertAtIndexInRecentBookings(int index, TrainingsBoughtRow item) =>
      recentBookings.insert(index, item);
  void updateRecentBookingsAtIndex(
          int index, Function(TrainingsBoughtRow) updateFn) =>
      recentBookings[index] = updateFn(recentBookings[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in BookingConfirmationPage widget.
  List<TrainingsBoughtRow>? getRecentBookings;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
