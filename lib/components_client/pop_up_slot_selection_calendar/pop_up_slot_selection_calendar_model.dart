import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'pop_up_slot_selection_calendar_widget.dart'
    show PopUpSlotSelectionCalendarWidget;
import 'package:flutter/material.dart';

class PopUpSlotSelectionCalendarModel
    extends FlutterFlowModel<PopUpSlotSelectionCalendarWidget> {
  ///  Local state fields for this component.

  List<int> trainingsSelected = [];
  void addToTrainingsSelected(int item) => trainingsSelected.add(item);
  void removeFromTrainingsSelected(int item) => trainingsSelected.remove(item);
  void removeAtIndexFromTrainingsSelected(int index) =>
      trainingsSelected.removeAt(index);
  void insertAtIndexInTrainingsSelected(int index, int item) =>
      trainingsSelected.insert(index, item);
  void updateTrainingsSelectedAtIndex(int index, Function(int) updateFn) =>
      trainingsSelected[index] = updateFn(trainingsSelected[index]);

  bool monthAvailability = true;

  bool slotSelected = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  Completer<List<AvailableTrainingSlotsRow>>? requestCompleter1;
  Completer<List<TrainingsBoughtRow>>? requestCompleter2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  TrainingsBoughtRow? trainingBoughtID;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<TrainingSlotsRow>? slotMonthAvailability;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<TrainingsBoughtRow>? deleteSlot;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<TrainingsBoughtRow>? trainingsIsBought;
  // State field(s) for CheckboxMonth widget.
  bool? checkboxMonthValue;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
