import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tap_bar_client_web_model.dart';
export 'tap_bar_client_web_model.dart';

class TapBarClientWebWidget extends StatefulWidget {
  const TapBarClientWebWidget({super.key});

  @override
  State<TapBarClientWebWidget> createState() => _TapBarClientWebWidgetState();
}

class _TapBarClientWebWidgetState extends State<TapBarClientWebWidget> {
  late TapBarClientWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TapBarClientWebModel());

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
      width: 600.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              opaque: true,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: InkWell(
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
                  } else {
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
                  }
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: FFAppState().tabIconColor == 1 ? 2.0 : 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 120.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FFAppState().tabIconColor == 1
                          ? Color(0xFFF4E0D3)
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            color: FFAppState().tabIconColor == 1
                                ? Color(0xFFFF740F)
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 18.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 4.0),
                            child: Text(
                              'Главная',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                                            .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionMainHovered = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionMainHovered = false);
              }),
            ),
            MouseRegion(
              opaque: true,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
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
                child: Material(
                  color: Colors.transparent,
                  elevation: FFAppState().tabIconColor == 2 ? 2.0 : 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 170.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FFAppState().tabIconColor == 2
                          ? Color(0xFFF4E0D3)
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.klightningCharge,
                            color: FFAppState().tabIconColor == 2
                                ? Color(0xFFFF740F)
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 18.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 4.0),
                            child: Text(
                              'Мои тренировки',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                                            .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionTTHovered = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionTTHovered = false);
              }),
            ),
            MouseRegion(
              opaque: true,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
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
                child: Material(
                  color: Colors.transparent,
                  elevation: FFAppState().tabIconColor == 3 ? 2.0 : 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 130.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FFAppState().tabIconColor == 3
                          ? Color(0xFFF4E0D3)
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: FFAppState().tabIconColor == 3
                                ? Color(0xFFFF740F)
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 18.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 4.0),
                            child: Text(
                              'Избранное',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                                            .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionFavHovered = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionFavHovered = false);
              }),
            ),
            MouseRegion(
              opaque: true,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
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
                child: Material(
                  color: Colors.transparent,
                  elevation: FFAppState().tabIconColor == 4 ? 2.0 : 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 130.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FFAppState().tabIconColor == 4
                          ? Color(0xFFF4E0D3)
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: FFAppState().tabIconColor == 4
                                ? Color(0xFFFF740F)
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 18.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 4.0),
                            child: Text(
                              'Календарь',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
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
                                            .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionShedHovered = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionShedHovered = false);
              }),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ),
    );
  }
}
