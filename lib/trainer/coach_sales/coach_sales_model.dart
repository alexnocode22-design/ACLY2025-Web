import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach_sales/app_bar_coach_sales_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'coach_sales_widget.dart' show CoachSalesWidget;
import 'package:flutter/material.dart';

class CoachSalesModel extends FlutterFlowModel<CoachSalesWidget> {
  ///  Local state fields for this page.

  int saleMonth = 5;

  int? saleYear = 2026;

  bool pageReady = false;

  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoachSales component.
  late AppBarCoachSalesModel appBarCoachSalesModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for MonthSelect widget.
  String? monthSelectValue;
  FormFieldController<String>? monthSelectValueController;
  // State field(s) for YearSelect widget.
  String? yearSelectValue;
  FormFieldController<String>? yearSelectValueController;
  // Stores action output result for [Backend Call - Query Rows] action in MessageToClient widget.
  List<ChatsRow>? chatExistSales;
  // Stores action output result for [Backend Call - Insert Row] action in MessageToClient widget.
  ChatsRow? chatCreatedSales;
  // Stores action output result for [Backend Call - Query Rows] action in MessageToClient widget.
  List<ChatsRow>? chatExistTrainings;
  // Stores action output result for [Backend Call - Insert Row] action in MessageToClient widget.
  ChatsRow? chatCreatedTrainings;
  // Stores action output result for [Backend Call - Query Rows] action in MessageToClient widget.
  List<ChatsRow>? chatExistsNutriPlan;
  // Stores action output result for [Backend Call - Insert Row] action in MessageToClient widget.
  ChatsRow? chatCreatedNutriPlan;
  // Stores action output result for [Backend Call - Query Rows] action in MessageToClient widget.
  List<ChatsRow>? chatExistTrainPlans;
  // Stores action output result for [Backend Call - Insert Row] action in MessageToClient widget.
  ChatsRow? chatCreatedTrainPlans;
  // Stores action output result for [Backend Call - Query Rows] action in MessageToClient widget.
  List<ChatsRow>? chatExistDigiprod;
  // Stores action output result for [Backend Call - Insert Row] action in MessageToClient widget.
  ChatsRow? chatCreatedDigiProd;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachSalesModel = createModel(context, () => AppBarCoachSalesModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachSalesModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
