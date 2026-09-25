import '/backend/supabase/supabase.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'bank_payment_page_plans_widget.dart' show BankPaymentPagePlansWidget;
import 'package:flutter/material.dart';

class BankPaymentPagePlansModel
    extends FlutterFlowModel<BankPaymentPagePlansWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  TrainingplanBoughtRow? trainingPlanBoughtID;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  NutritionplanBoughtRow? nutritionPlanBoughtID;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  DigiprodBoughtRow? digiProdBoughtID;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    tapBarTrainerModel.dispose();
  }
}
