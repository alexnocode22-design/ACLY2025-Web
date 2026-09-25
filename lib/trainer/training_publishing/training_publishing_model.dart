import '/components_trainer/app_bar_coach_training_publishing/app_bar_coach_training_publishing_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_publishing_widget.dart' show TrainingPublishingWidget;
import 'package:flutter/material.dart';

class TrainingPublishingModel
    extends FlutterFlowModel<TrainingPublishingWidget> {
  ///  Local state fields for this page.

  bool descriptionReview = true;

  bool isPublishing = false;

  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoachTrainingPublishing component.
  late AppBarCoachTrainingPublishingModel appBarCoachTrainingPublishingModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - publishTraining] action in PublishTraining widget.
  bool? publishResult;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachTrainingPublishingModel =
        createModel(context, () => AppBarCoachTrainingPublishingModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachTrainingPublishingModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
