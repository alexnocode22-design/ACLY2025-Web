import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach_chat/app_bar_coach_chat_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'coach_chats_widget.dart' show CoachChatsWidget;
import 'package:flutter/material.dart';

class CoachChatsModel extends FlutterFlowModel<CoachChatsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in CoachChats widget.
  List<ChatMessagesRow>? checkUnreadMessagesTrainerChats;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;
  // Model for AppBarCoachChat component.
  late AppBarCoachChatModel appBarCoachChatModel;

  @override
  void initState(BuildContext context) {
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
    appBarCoachChatModel = createModel(context, () => AppBarCoachChatModel());
  }

  @override
  void dispose() {
    tapBarTrainerModel.dispose();
    appBarCoachChatModel.dispose();
  }
}
