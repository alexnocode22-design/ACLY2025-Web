import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach_chat_with_client/app_bar_coach_chat_with_client_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'coach_chat_with_client_widget.dart' show CoachChatWithClientWidget;
import 'package:flutter/material.dart';

class CoachChatWithClientModel
    extends FlutterFlowModel<CoachChatWithClientWidget> {
  ///  Local state fields for this page.
  /// Trigger to refresh UI
  bool refreshTrigger = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in CoachChatWithClient widget.
  List<UserProfileRow>? memberData;
  // Stores action output result for [Backend Call - Query Rows] action in CoachChatWithClient widget.
  List<ChatMessagesRow>? coachChatWithClient;
  // State field(s) for MessagesColumn widget.
  ScrollController? messagesColumnScrollController;
  // State field(s) for ChatWithClientListView widget.
  ScrollController? chatWithClientListViewScrollController;
  Stream<List<ChatMessagesRow>>? chatWithClientListViewSupabaseStream;
  // State field(s) for ChatReplay widget.
  FocusNode? chatReplayFocusNode;
  TextEditingController? chatReplayTextController;
  String? Function(BuildContext, String?)? chatReplayTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in SendMessage widget.
  ChatMessagesRow? newMessageTrainer;
  // Stores action output result for [Backend Call - Query Rows] action in SendMessage widget.
  List<ChatMessagesRow>? coachChatWithClient2;
  // Model for AppBarCoachChatWithClient component.
  late AppBarCoachChatWithClientModel appBarCoachChatWithClientModel;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    messagesColumnScrollController = ScrollController();
    chatWithClientListViewScrollController = ScrollController();
    appBarCoachChatWithClientModel =
        createModel(context, () => AppBarCoachChatWithClientModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    messagesColumnScrollController?.dispose();
    chatWithClientListViewScrollController?.dispose();
    chatReplayFocusNode?.dispose();
    chatReplayTextController?.dispose();

    appBarCoachChatWithClientModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
