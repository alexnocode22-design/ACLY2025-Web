import '/components_client/app_bar_user_my_shablony_n_e_w/app_bar_user_my_shablony_n_e_w_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_shablony_play_widget.dart' show ClientShablonyPlayWidget;
import 'package:flutter/material.dart';

class ClientShablonyPlayModel
    extends FlutterFlowModel<ClientShablonyPlayWidget> {
  ///  Local state fields for this page.

  bool timerStarted = false;

  int currentApproach = 1;

  int currentExersize = 1;

  ///  State fields for stateful widgets in this page.

  // Model for AppBarUserMyShablonyNEW component.
  late AppBarUserMyShablonyNEWModel appBarUserMyShablonyNEWModel;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarUserMyShablonyNEWModel =
        createModel(context, () => AppBarUserMyShablonyNEWModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarUserMyShablonyNEWModel.dispose();
    tapBarClientModel.dispose();
  }
}
