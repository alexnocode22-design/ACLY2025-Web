import '/components_trainer/app_bar_coach_schedule/app_bar_coach_schedule_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coach_schedule_training_n_e_w_widget.dart'
    show CoachScheduleTrainingNEWWidget;
import 'package:flutter/material.dart';

class CoachScheduleTrainingNEWModel
    extends FlutterFlowModel<CoachScheduleTrainingNEWWidget> {
  ///  Local state fields for this page.

  List<String> loadedIntervals = [];
  void addToLoadedIntervals(String item) => loadedIntervals.add(item);
  void removeFromLoadedIntervals(String item) => loadedIntervals.remove(item);
  void removeAtIndexFromLoadedIntervals(int index) =>
      loadedIntervals.removeAt(index);
  void insertAtIndexInLoadedIntervals(int index, String item) =>
      loadedIntervals.insert(index, item);
  void updateLoadedIntervalsAtIndex(int index, Function(String) updateFn) =>
      loadedIntervals[index] = updateFn(loadedIntervals[index]);

  String displayText = 'Nothing';

  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoachSchedule component.
  late AppBarCoachScheduleModel appBarCoachScheduleModel;

  @override
  void initState(BuildContext context) {
    appBarCoachScheduleModel =
        createModel(context, () => AppBarCoachScheduleModel());
  }

  @override
  void dispose() {
    appBarCoachScheduleModel.dispose();
  }
}
