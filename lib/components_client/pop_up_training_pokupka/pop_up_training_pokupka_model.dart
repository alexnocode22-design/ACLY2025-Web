import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pop_up_training_pokupka_widget.dart' show PopUpTrainingPokupkaWidget;
import 'package:flutter/material.dart';

class PopUpTrainingPokupkaModel
    extends FlutterFlowModel<PopUpTrainingPokupkaWidget> {
  ///  Local state fields for this component.

  bool paymentInProgress = false;

  bool bookingFinalized = false;

  List<TrainingsBookedTempRow> tempBookings = [];
  void addToTempBookings(TrainingsBookedTempRow item) => tempBookings.add(item);
  void removeFromTempBookings(TrainingsBookedTempRow item) =>
      tempBookings.remove(item);
  void removeAtIndexFromTempBookings(int index) => tempBookings.removeAt(index);
  void insertAtIndexInTempBookings(int index, TrainingsBookedTempRow item) =>
      tempBookings.insert(index, item);
  void updateTempBookingsAtIndex(
          int index, Function(TrainingsBookedTempRow) updateFn) =>
      tempBookings[index] = updateFn(tempBookings[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in PopUpTrainingPokupka widget.
  List<TrainingsBookedTempRow>? tempBookingsQuery;
  // Stores action output result for [Backend Call - Query Rows] action in PayContainer widget.
  List<TrainingsBookedTempRow>? tempBookingsQuery2;
  // Stores action output result for [Custom Action - finalizeBookings] action in PayContainer widget.
  String? bookingSuccessCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
