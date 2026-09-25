import '/components_trainer/app_bar_coach_schedule/app_bar_coach_schedule_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coach_schedule_main_new_widget.dart' show CoachScheduleMainNewWidget;
import 'package:flutter/material.dart';

class CoachScheduleMainNewModel
    extends FlutterFlowModel<CoachScheduleMainNewWidget> {
  ///  Local state fields for this page.

  bool listViewRefreshTrigger = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - trainingSlotsBooked] action in CoachScheduleMainNew widget.
  List<DateTime>? bookedDates;
  // Model for AppBarCoachSchedule component.
  late AppBarCoachScheduleModel appBarCoachScheduleModel;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachScheduleModel =
        createModel(context, () => AppBarCoachScheduleModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachScheduleModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
