import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach_office/app_bar_coach_office_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'coach_office_widget.dart' show CoachOfficeWidget;
import 'package:flutter/material.dart';

class CoachOfficeModel extends FlutterFlowModel<CoachOfficeWidget> {
  ///  Local state fields for this page.

  bool isNewImgUploaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in CoachOffice widget.
  List<TrainerProfileRow>? trainerProfile;
  // Stores action output result for [Backend Call - Query Rows] action in CoachOffice widget.
  List<ChatMessagesRow>? checkUnreadMessagesTrainer;
  // Model for AppBarCoachOffice component.
  late AppBarCoachOfficeModel appBarCoachOfficeModel;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachOfficeModel =
        createModel(context, () => AppBarCoachOfficeModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachOfficeModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
