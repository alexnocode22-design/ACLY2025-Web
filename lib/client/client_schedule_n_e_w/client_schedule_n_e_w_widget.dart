import '/components_client/app_bar_user_schedule/app_bar_user_schedule_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'client_schedule_n_e_w_model.dart';
export 'client_schedule_n_e_w_model.dart';

class ClientScheduleNEWWidget extends StatefulWidget {
  const ClientScheduleNEWWidget({super.key});

  static String routeName = 'ClientScheduleNEW';
  static String routePath = 'clientScheduleNEW';

  @override
  State<ClientScheduleNEWWidget> createState() =>
      _ClientScheduleNEWWidgetState();
}

class _ClientScheduleNEWWidgetState extends State<ClientScheduleNEWWidget> {
  late ClientScheduleNEWModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientScheduleNEWModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 4;
      safeSetState(() {});
      _model.bookedDatesClient = await actions.trainingSlotsBookedClient();
      _model.listViewRefreshTrigger = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFF9F5),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              children: [
                wrapWithModel(
                  model: _model.appBarUserScheduleModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppBarUserScheduleWidget(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 25.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 400.0,
                            child: custom_widgets.CalendarWidgetClient(
                              width: double.infinity,
                              height: 400.0,
                              bookedDates: _model.bookedDatesClient,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 500.0,
                            child: custom_widgets.CalendarBookingDisplayClient(
                              width: double.infinity,
                              height: 500.0,
                            ),
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 150.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.tapBarClientModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TapBarClientWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
