import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selected_slots_widget_widget.dart' show SelectedSlotsWidgetWidget;
import 'package:flutter/material.dart';

class SelectedSlotsWidgetModel
    extends FlutterFlowModel<SelectedSlotsWidgetWidget> {
  ///  Local state fields for this component.

  bool timerStarted = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in DeleteSlotButton widget.
  List<TrainingsBookedTempRow>? tempBookingsQueryDel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
