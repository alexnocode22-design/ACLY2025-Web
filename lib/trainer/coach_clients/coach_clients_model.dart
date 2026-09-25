import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach_clients/app_bar_coach_clients_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'coach_clients_widget.dart' show CoachClientsWidget;
import 'package:flutter/material.dart';

class CoachClientsModel extends FlutterFlowModel<CoachClientsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoachClients component.
  late AppBarCoachClientsModel appBarCoachClientsModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ChatsRow>? chatExist1;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  ChatsRow? chatCreated1;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ChatsRow>? chatExist2;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  ChatsRow? chatCreated2;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ChatsRow>? chatExist33;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  ChatsRow? chatCreated33;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ChatsRow>? chatExist3;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  ChatsRow? chatCreated3;
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<ChatsRow>? chatExist4;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  ChatsRow? chatCreated4;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachClientsModel =
        createModel(context, () => AppBarCoachClientsModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachClientsModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
