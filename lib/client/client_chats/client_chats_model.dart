import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_client_chat/app_bar_client_chat_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_chats_widget.dart' show ClientChatsWidget;
import 'package:flutter/material.dart';

class ClientChatsModel extends FlutterFlowModel<ClientChatsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ClientChats widget.
  List<ChatMessagesRow>? checkUnreadMessagesChats;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;
  // Model for AppBarClientChat component.
  late AppBarClientChatModel appBarClientChatModel;

  @override
  void initState(BuildContext context) {
    tapBarClientModel = createModel(context, () => TapBarClientModel());
    appBarClientChatModel = createModel(context, () => AppBarClientChatModel());
  }

  @override
  void dispose() {
    tapBarClientModel.dispose();
    appBarClientChatModel.dispose();
  }
}
