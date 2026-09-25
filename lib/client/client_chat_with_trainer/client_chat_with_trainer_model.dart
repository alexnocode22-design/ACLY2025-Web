import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_client_chat_with_trainer/app_bar_client_chat_with_trainer_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_chat_with_trainer_widget.dart' show ClientChatWithTrainerWidget;
import 'package:flutter/material.dart';

class ClientChatWithTrainerModel
    extends FlutterFlowModel<ClientChatWithTrainerWidget> {
  ///  Local state fields for this page.
  /// Trigger to refresh UI
  bool refreshTrigger = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ClientChatWithTrainer widget.
  List<UserProfileRow>? memberDataClient;
  // Stores action output result for [Backend Call - Query Rows] action in ClientChatWithTrainer widget.
  List<ChatMessagesRow>? chatWithTrainer1;
  // State field(s) for MessagesColumn widget.
  ScrollController? messagesColumnScrollController;
  // State field(s) for MessagesListView widget.
  ScrollController? messagesListViewScrollController;
  Stream<List<ChatMessagesRow>>? messagesListViewSupabaseStream;
  // State field(s) for ChatReplay widget.
  FocusNode? chatReplayFocusNode;
  TextEditingController? chatReplayTextController;
  String? Function(BuildContext, String?)? chatReplayTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in SendMessage widget.
  ChatMessagesRow? newMessageClient;
  // Stores action output result for [Backend Call - Query Rows] action in SendMessage widget.
  List<ChatMessagesRow>? chatWithTrainer2;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;
  // Model for AppBarClientChatWithTrainer component.
  late AppBarClientChatWithTrainerModel appBarClientChatWithTrainerModel;

  @override
  void initState(BuildContext context) {
    messagesColumnScrollController = ScrollController();
    messagesListViewScrollController = ScrollController();
    tapBarClientModel = createModel(context, () => TapBarClientModel());
    appBarClientChatWithTrainerModel =
        createModel(context, () => AppBarClientChatWithTrainerModel());
  }

  @override
  void dispose() {
    messagesColumnScrollController?.dispose();
    messagesListViewScrollController?.dispose();
    chatReplayFocusNode?.dispose();
    chatReplayTextController?.dispose();

    tapBarClientModel.dispose();
    appBarClientChatWithTrainerModel.dispose();
  }
}
