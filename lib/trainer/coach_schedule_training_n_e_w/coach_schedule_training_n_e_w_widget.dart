import '/auth/supabase_auth/auth_util.dart';
import '/components_trainer/app_bar_coach_schedule/app_bar_coach_schedule_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coach_schedule_training_n_e_w_model.dart';
export 'coach_schedule_training_n_e_w_model.dart';

/// Test Schedule Actions
class CoachScheduleTrainingNEWWidget extends StatefulWidget {
  const CoachScheduleTrainingNEWWidget({
    super.key,
    required this.trainerId,
    required this.trainingId,
  });

  final String? trainerId;
  final int? trainingId;

  static String routeName = 'CoachScheduleTrainingNEW';
  static String routePath = 'coachScheduleTrainingNEW';

  @override
  State<CoachScheduleTrainingNEWWidget> createState() =>
      _CoachScheduleTrainingNEWWidgetState();
}

class _CoachScheduleTrainingNEWWidgetState
    extends State<CoachScheduleTrainingNEWWidget> {
  late CoachScheduleTrainingNEWModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachScheduleTrainingNEWModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.appBarCoachScheduleModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarCoachScheduleWidget(),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      child: custom_widgets.ScheduleIntervalList(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.85,
                        trainerId: currentUserUid,
                        trainingId: widget.trainingId!,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Container(
                          width: 150.0,
                          height: 48.0,
                          constraints: BoxConstraints(
                            maxWidth: 180.0,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF7B43CE), Color(0xFFFF740F)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.69, -1.0),
                              end: AlignmentDirectional(-0.69, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Сохранить',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width >=
                                                    380.0
                                                ? 16.0
                                                : 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
