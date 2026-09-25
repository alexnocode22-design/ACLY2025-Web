import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_user_my_shablony/app_bar_user_my_shablony_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_shablony_saved_widget.dart' show ClientShablonySavedWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ClientShablonySavedModel
    extends FlutterFlowModel<ClientShablonySavedWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ClientShablonySaved widget.
  List<TemplateBlockRow>? userTemplatesExists;
  Completer<List<TemplateBlockRow>>? requestCompleter;
  // Model for AppBarUserMyShablony component.
  late AppBarUserMyShablonyModel appBarUserMyShablonyModel;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarUserMyShablonyModel =
        createModel(context, () => AppBarUserMyShablonyModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarUserMyShablonyModel.dispose();
    tapBarClientModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
