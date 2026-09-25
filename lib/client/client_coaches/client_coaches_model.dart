import '/backend/api_requests/api_calls.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/components_trainer/app_bar_coaches/app_bar_coaches_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_coaches_widget.dart' show ClientCoachesWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ClientCoachesModel extends FlutterFlowModel<ClientCoachesWidget> {
  ///  Local state fields for this page.

  List<dynamic> apiResult = [];
  void addToApiResult(dynamic item) => apiResult.add(item);
  void removeFromApiResult(dynamic item) => apiResult.remove(item);
  void removeAtIndexFromApiResult(int index) => apiResult.removeAt(index);
  void insertAtIndexInApiResult(int index, dynamic item) =>
      apiResult.insert(index, item);
  void updateApiResultAtIndex(int index, Function(dynamic) updateFn) =>
      apiResult[index] = updateFn(apiResult[index]);

  bool isSearching = false;

  int limit = 100;

  String? term;

  ///  State fields for stateful widgets in this page.

  // Model for AppBarCoaches component.
  late AppBarCoachesModel appBarCoachesModel;
  // State field(s) for SearchString widget.
  FocusNode? searchStringFocusNode;
  TextEditingController? searchStringTextController;
  String? Function(BuildContext, String?)? searchStringTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarCoachesModel = createModel(context, () => AppBarCoachesModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarCoachesModel.dispose();
    searchStringFocusNode?.dispose();
    searchStringTextController?.dispose();

    tapBarClientModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
