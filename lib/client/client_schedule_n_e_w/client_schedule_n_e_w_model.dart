import '/components_client/app_bar_user_schedule/app_bar_user_schedule_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_schedule_n_e_w_widget.dart' show ClientScheduleNEWWidget;
import 'package:flutter/material.dart';

class ClientScheduleNEWModel extends FlutterFlowModel<ClientScheduleNEWWidget> {
  ///  Local state fields for this page.

  bool listViewRefreshTrigger = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - trainingSlotsBookedClient] action in ClientScheduleNEW widget.
  List<DateTime>? bookedDatesClient;
  // Model for AppBarUserSchedule component.
  late AppBarUserScheduleModel appBarUserScheduleModel;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarUserScheduleModel =
        createModel(context, () => AppBarUserScheduleModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarUserScheduleModel.dispose();
    tapBarClientModel.dispose();
  }
}
