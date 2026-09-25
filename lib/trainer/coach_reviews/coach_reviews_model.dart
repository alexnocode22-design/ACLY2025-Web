import '/components/review_reply_widget.dart';
import '/components_trainer/app_bar_coach_reviews/app_bar_coach_reviews_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'coach_reviews_widget.dart' show CoachReviewsWidget;
import 'package:flutter/material.dart';

class CoachReviewsModel extends FlutterFlowModel<CoachReviewsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoachReviews component.
  late AppBarCoachReviewsModel appBarCoachReviewsModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for ReviewReply dynamic component.
  late FlutterFlowDynamicModels<ReviewReplyModel> reviewReplyModels;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachReviewsModel =
        createModel(context, () => AppBarCoachReviewsModel());
    reviewReplyModels = FlutterFlowDynamicModels(() => ReviewReplyModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachReviewsModel.dispose();
    reviewReplyModels.dispose();
    tapBarTrainerModel.dispose();
  }
}
