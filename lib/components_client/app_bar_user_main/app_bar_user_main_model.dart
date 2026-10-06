import '/components_client/tap_bar_client_web/tap_bar_client_web_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'app_bar_user_main_widget.dart' show AppBarUserMainWidget;
import 'package:flutter/material.dart';

class AppBarUserMainModel extends FlutterFlowModel<AppBarUserMainWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TapBarClientWeb component.
  late TapBarClientWebModel tapBarClientWebModel;

  @override
  void initState(BuildContext context) {
    tapBarClientWebModel = createModel(context, () => TapBarClientWebModel());
  }

  @override
  void dispose() {
    tapBarClientWebModel.dispose();
  }
}
