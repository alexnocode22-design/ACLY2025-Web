import '/components_trainer/app_bar_coach_products/app_bar_coach_products_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'coach_products_widget.dart' show CoachProductsWidget;
import 'package:flutter/material.dart';

class CoachProductsModel extends FlutterFlowModel<CoachProductsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoachProducts component.
  late AppBarCoachProductsModel appBarCoachProductsModel;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachProductsModel =
        createModel(context, () => AppBarCoachProductsModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachProductsModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
