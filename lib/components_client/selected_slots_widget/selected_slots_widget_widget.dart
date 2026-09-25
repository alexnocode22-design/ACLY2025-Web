import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'selected_slots_widget_model.dart';
export 'selected_slots_widget_model.dart';

class SelectedSlotsWidgetWidget extends StatefulWidget {
  const SelectedSlotsWidgetWidget({
    super.key,
    required this.tempBookings,
    required this.totalSelected,
    required this.trainingPrice,
    required this.trainingId,
    required this.trainerId,
    required this.trainingName,
    required this.trainingPhoto1,
    required this.sessionId,
  });

  final List<TrainingsBookedTempRow>? tempBookings;
  final int? totalSelected;
  final int? trainingPrice;
  final int? trainingId;
  final String? trainerId;
  final String? trainingName;
  final String? trainingPhoto1;
  final String? sessionId;

  @override
  State<SelectedSlotsWidgetWidget> createState() =>
      _SelectedSlotsWidgetWidgetState();
}

class _SelectedSlotsWidgetWidgetState extends State<SelectedSlotsWidgetWidget> {
  late SelectedSlotsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedSlotsWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 11.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                  child: GradientText(
                    'Выбрано слотов:  ${widget.totalSelected.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Color(0xFF160E16),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    colors: [Color(0xFDFF740F), Color(0xFF7B43CE)],
                    gradientDirection: GradientDirection.ltr,
                    gradientType: GradientType.linear,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 62.0,
            decoration: BoxDecoration(),
            child: Builder(
              builder: (context) {
                final selectedSlotsListQuery = widget.tempBookings!.toList();

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedSlotsListQuery.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8.0),
                  itemBuilder: (context, selectedSlotsListQueryIndex) {
                    final selectedSlotsListQueryItem =
                        selectedSlotsListQuery[selectedSlotsListQueryIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Text(
                            valueOrDefault<String>(
                              dateTimeFormat(
                                "dd.MM.yyyy",
                                selectedSlotsListQueryItem.slotStartDatetime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '01.01.2026',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize:
                                      MediaQuery.sizeOf(context).width >= 380.0
                                          ? 10.0
                                          : 8.0,
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
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Удалить слот:'),
                                            content: Text(dateTimeFormat(
                                              "HH:mm dd.MM.yyyy",
                                              selectedSlotsListQueryItem
                                                  .slotStartDatetime!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Нет'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Да'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                await TrainingsBookedTempTable().delete(
                                  matchingRows: (rows) => rows
                                      .eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      )
                                      .eqOrNull(
                                        'id',
                                        selectedSlotsListQueryItem.id,
                                      ),
                                );
                                // Query TrainingsBookedTemp
                                _model.tempBookingsQueryDel =
                                    await TrainingsBookedTempTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      )
                                      .eqOrNull(
                                        'training_id',
                                        widget.trainingId,
                                      )
                                      .gtOrNull(
                                        'expires_at',
                                        supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                      ),
                                );
                                _shouldSetState = true;
                                // Store in PageState 4

                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: '${valueOrDefault<String>(
                              functions.utcToMoscowTime(
                                  selectedSlotsListQueryItem.slotStartDatetime),
                              '00:00',
                            )}   X',
                            options: FFButtonOptions(
                              width: 68.0,
                              height: 30.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 6.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF7B43CE),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFFFF9F5),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                380.0
                                            ? 10.0
                                            : 8.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFF7B43CE),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                        Text(
                          '${selectedSlotsListQueryItem.slotDuration?.toString()} минут',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                fontSize:
                                    MediaQuery.sizeOf(context).width >= 380.0
                                        ? 10.0
                                        : 8.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6.0, 14.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                GradientText(
                  'Итого:  ${widget.totalSelected?.toString()} X ${widget.trainingPrice?.toString()} ₽',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  colors: [Color(0xFDFF740F), Color(0xFF7B43CE)],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                GradientText(
                  'К оплате:  ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  colors: [Color(0xFDFF740F), Color(0xFF7B43CE)],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                ),
                GradientText(
                  '${valueOrDefault<String>(
                    ((widget.trainingPrice!) * (widget.totalSelected!))
                        .toString(),
                    '5000',
                  )} ₽',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  colors: [Color(0xFF160E16), Color(0xFF7B43CE)],
                  gradientDirection: GradientDirection.ltr,
                  gradientType: GradientType.linear,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
              child: Container(
                height: MediaQuery.sizeOf(context).width >= 380.0 ? 48.0 : 42.0,
                constraints: BoxConstraints(
                  minWidth: MediaQuery.sizeOf(context).width * 0.4,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.8,
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 15.0, 0.0),
                      child: Text(
                        'Купить тренировку → ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize:
                                  MediaQuery.sizeOf(context).width >= 380.0
                                      ? 16.0
                                      : 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
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
        ],
      ),
    );
  }
}
