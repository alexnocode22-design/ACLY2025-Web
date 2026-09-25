import '/components_trainer/app_bar_coach_reviews_replay/app_bar_coach_reviews_replay_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'coach_review_reply_widget.dart' show CoachReviewReplyWidget;
import 'package:flutter/material.dart';

class CoachReviewReplyModel extends FlutterFlowModel<CoachReviewReplyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoachReviewsReplay component.
  late AppBarCoachReviewsReplayModel appBarCoachReviewsReplayModel;
  // State field(s) for ReplyText widget.
  FocusNode? replyTextFocusNode;
  TextEditingController? replyTextTextController;
  String? Function(BuildContext, String?)? replyTextTextControllerValidator;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachReviewsReplayModel =
        createModel(context, () => AppBarCoachReviewsReplayModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachReviewsReplayModel.dispose();
    replyTextFocusNode?.dispose();
    replyTextTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
