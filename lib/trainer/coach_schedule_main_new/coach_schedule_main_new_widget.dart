import '/auth/supabase_auth/auth_util.dart';
import '/components_trainer/app_bar_coach_schedule/app_bar_coach_schedule_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'coach_schedule_main_new_model.dart';
export 'coach_schedule_main_new_model.dart';

class CoachScheduleMainNewWidget extends StatefulWidget {
  const CoachScheduleMainNewWidget({super.key});

  static String routeName = 'CoachScheduleMainNew';
  static String routePath = 'coachScheduleMainNew';

  @override
  State<CoachScheduleMainNewWidget> createState() =>
      _CoachScheduleMainNewWidgetState();
}

class _CoachScheduleMainNewWidgetState
    extends State<CoachScheduleMainNewWidget> {
  late CoachScheduleMainNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachScheduleMainNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 4;
      safeSetState(() {});
      _model.bookedDates = await actions.trainingSlotsBooked(
        currentUserUid,
        false,
        true,
      );
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
      child: PopScope(
        canPop: false,
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
                    model: _model.appBarCoachScheduleModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppBarCoachScheduleWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
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
                              child: custom_widgets.CalendarWidget(
                                width: double.infinity,
                                height: 400.0,
                                bookedDates: _model.bookedDates,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 500.0,
                              child: custom_widgets.CalendarBookingDisplay(
                                width: double.infinity,
                                height: 500.0,
                                tableName: 'trainingsBought',
                                dateFieldName: 'slot_date',
                                trainerField: 'trainer_id',
                                trainerValue: currentUserUid,
                                cancelledField: 'slot_cancelled',
                                payedField: 'training_payed',
                                trainingTypeField: 'training_name',
                                timeSlotField: 'slot_start_datetime',
                                userIdField: '',
                              ),
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 150.0)),
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.tapBarTrainerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TapBarTrainerWidget(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
