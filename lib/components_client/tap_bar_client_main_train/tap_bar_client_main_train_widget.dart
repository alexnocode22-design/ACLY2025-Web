import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tap_bar_client_main_train_model.dart';
export 'tap_bar_client_main_train_model.dart';

class TapBarClientMainTrainWidget extends StatefulWidget {
  const TapBarClientMainTrainWidget({
    super.key,
    required this.trainingId,
    required this.sessionId,
  });

  final int? trainingId;
  final String? sessionId;

  @override
  State<TapBarClientMainTrainWidget> createState() =>
      _TapBarClientMainTrainWidgetState();
}

class _TapBarClientMainTrainWidgetState
    extends State<TapBarClientMainTrainWidget> {
  late TapBarClientMainTrainModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TapBarClientMainTrainModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 343.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: Color(0xFF0E0817),
        borderRadius: BorderRadius.circular(300.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().userRole.contains('Trainer') == true) {
                  context.pushNamed(
                    CoachOfficeWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  return;
                } else {
                  // Delete Temp Bookings
                  await TrainingsBookedTempTable().delete(
                    matchingRows: (rows) => rows
                        .eqOrNull(
                          'user_id',
                          currentUserUid,
                        )
                        .eqOrNull(
                          'training_id',
                          widget.trainingId,
                        )
                        .eqOrNull(
                          'session_id',
                          widget.sessionId,
                        ),
                  );

                  context.pushNamed(
                    ClientMainWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  return;
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: FFAppState().tabIconColor == 1
                        ? Color(0xFFFF740F)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  Text(
                    'Главная',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FFAppState().tabIconColor == 1
                              ? Color(0xFFFF740F)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                // Delete Temp Bookings
                await TrainingsBookedTempTable().delete(
                  matchingRows: (rows) => rows
                      .eqOrNull(
                        'user_id',
                        currentUserUid,
                      )
                      .eqOrNull(
                        'training_id',
                        widget.trainingId,
                      )
                      .eqOrNull(
                        'session_id',
                        widget.sessionId,
                      ),
                );

                context.pushNamed(
                  ClientShablonySavedWidget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FFIcons.klightningCharge,
                    color: FFAppState().tabIconColor == 2
                        ? Color(0xFFFF740F)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  Text(
                    'Мои тренировки',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FFAppState().tabIconColor == 2
                              ? Color(0xFFFF740F)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                // Delete Temp Bookings
                await TrainingsBookedTempTable().delete(
                  matchingRows: (rows) => rows
                      .eqOrNull(
                        'user_id',
                        currentUserUid,
                      )
                      .eqOrNull(
                        'training_id',
                        widget.trainingId,
                      )
                      .eqOrNull(
                        'session_id',
                        widget.sessionId,
                      ),
                );

                context.pushNamed(
                  ClientFavouritesWidget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border_outlined,
                    color: FFAppState().tabIconColor == 3
                        ? Color(0xFFFF740F)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  Text(
                    'Избранное',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FFAppState().tabIconColor == 3
                              ? Color(0xFFFF740F)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                // Delete Temp Bookings
                await TrainingsBookedTempTable().delete(
                  matchingRows: (rows) => rows
                      .eqOrNull(
                        'user_id',
                        currentUserUid,
                      )
                      .eqOrNull(
                        'training_id',
                        widget.trainingId,
                      )
                      .eqOrNull(
                        'session_id',
                        widget.sessionId,
                      ),
                );

                context.pushNamed(
                  ClientScheduleNEWWidget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: FFAppState().tabIconColor == 4
                        ? Color(0xFFFF740F)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  Text(
                    'Календарь',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FFAppState().tabIconColor == 4
                              ? Color(0xFFFF740F)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          fontSize: 8.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
