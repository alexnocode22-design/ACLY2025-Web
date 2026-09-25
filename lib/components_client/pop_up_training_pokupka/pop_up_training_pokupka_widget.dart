import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'pop_up_training_pokupka_model.dart';
export 'pop_up_training_pokupka_model.dart';

class PopUpTrainingPokupkaWidget extends StatefulWidget {
  const PopUpTrainingPokupkaWidget({
    super.key,
    required this.trainingId,
    required this.trainingName,
    required this.trainingPrice,
    required this.trainingPhoto1,
    required this.trainerId,
    required this.sessionId,
    required this.slotCount,
  });

  final int? trainingId;
  final String? trainingName;
  final int? trainingPrice;
  final String? trainingPhoto1;
  final String? trainerId;
  final String? sessionId;
  final int? slotCount;

  @override
  State<PopUpTrainingPokupkaWidget> createState() =>
      _PopUpTrainingPokupkaWidgetState();
}

class _PopUpTrainingPokupkaWidgetState
    extends State<PopUpTrainingPokupkaWidget> {
  late PopUpTrainingPokupkaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpTrainingPokupkaModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Query TrainingsBookedTemp
      _model.tempBookingsQuery = await TrainingsBookedTempTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'session_id',
              widget.sessionId,
            ),
      );
      // Store in PageState
      _model.tempBookings =
          _model.tempBookingsQuery!.toList().cast<TrainingsBookedTempRow>();
      safeSetState(() {});
      if (_model.tempBookings.length == 0) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Сессия истекла.'),
              content: Text('Пожалуйста, выберите слоты заново.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.pushNamed(
          MainInfoTrainingWidget.routeName,
          queryParameters: {
            'trainingID': serializeParam(
              widget.trainingId,
              ParamType.int,
            ),
          }.withoutNulls,
        );

        return;
      } else {
        return;
      }
    });

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: 800.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: 343.0,
                      minHeight: 264.0,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          valueOrDefault<String>(
                            widget.trainingPhoto1,
                            'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/_training_shadow1.jpg',
                          ),
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.trainingName,
                      'Нет названия',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Color(0xFF2C2C2C),
                          fontSize: MediaQuery.sizeOf(context).width >= 360.0
                              ? 20.0
                              : 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 0.0, 6.0),
                        child: GradientText(
                          'Выбранные слоты: ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          colors: [Color(0xFFFF740F), Color(0xFF7B43CE)],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.5, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pop();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Group_26.png',
                            width: 26.0,
                            height: 26.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: FutureBuilder<List<TrainingsBookedTempRow>>(
                        future: TrainingsBookedTempTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'session_id',
                                widget.sessionId,
                              )
                              .order('slot_start_datetime', ascending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<TrainingsBookedTempRow>
                              listViewTrainingsBookedTempRowList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewTrainingsBookedTempRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewTrainingsBookedTempRow =
                                  listViewTrainingsBookedTempRowList[
                                      listViewIndex];
                              return Container(
                                width: 100.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${valueOrDefault<String>(
                                          dateTimeFormat(
                                            "dd.MM.yyyy",
                                            listViewTrainingsBookedTempRow
                                                .slotStartDatetime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          'dd.MM.yyyy HH:mm',
                                        )}  ${valueOrDefault<String>(
                                          functions.utcToMoscowTime(
                                              listViewTrainingsBookedTempRow
                                                  .slotStartDatetime),
                                          '00:00',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF7B43CE),
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '${valueOrDefault<String>(
                                            listViewTrainingsBookedTempRow
                                                .slotDuration
                                                ?.toString(),
                                            '00',
                                          )} минут',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 360.0,
                      child: Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GradientText(
                            'Количество слотов:  ',
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
                                          ? 16.0
                                          : 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            colors: [Color(0xFFFF740F), Color(0xFF7B43CE)],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.slotCount?.toString(),
                              '0',
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
                                  color: Color(0xFF7B43CE),
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
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 1.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GradientText(
                            'Цена за слот:  ',
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
                                          ? 16.0
                                          : 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            colors: [Color(0xFFFF740F), Color(0xFF7B43CE)],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                          Text(
                            '${valueOrDefault<String>(
                              widget.trainingPrice?.toString(),
                              '0',
                            )} ₽',
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
                                  color: Color(0xFF7B43CE),
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
                      ),
                    ),
                    SizedBox(
                      width: 360.0,
                      child: Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GradientText(
                            'Итого к оплате:  ',
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
                                          ? 16.0
                                          : 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            colors: [Color(0xFFFF740F), Color(0xFF7B43CE)],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                          Text(
                            '${valueOrDefault<String>(
                              ((widget.trainingPrice!) * (widget.slotCount!))
                                  .toString(),
                              '5000',
                            )} ₽',
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
                                  color: Color(0xFF7B43CE),
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
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: GradientText(
                    'Для оплаты тренировки\n вы будете перенаправлены на платежный шлюз банка',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: MediaQuery.sizeOf(context).width >= 360.0
                              ? 18.0
                              : 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    colors: [Color(0xFFFF740F), Color(0xFF7B43CE)],
                    gradientDirection: GradientDirection.ltr,
                    gradientType: GradientType.linear,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var _shouldSetState = false;
                        // Query TrainingsBookedTemp
                        _model.tempBookingsQuery2 =
                            await TrainingsBookedTempTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
                              )
                              .eqOrNull(
                                'session_id',
                                widget.sessionId,
                              ),
                        );
                        _shouldSetState = true;
                        // Store in PageState
                        _model.tempBookings = _model.tempBookingsQuery2!
                            .toList()
                            .cast<TrainingsBookedTempRow>();
                        safeSetState(() {});
                        if (_model.tempBookings.length == 0) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Сессия истекла.'),
                                content:
                                    Text('Пожалуйста, выберите слоты заново.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );

                          context.pushNamed(
                            MainInfoTrainingWidget.routeName,
                            queryParameters: {
                              'trainingID': serializeParam(
                                widget.trainingId,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          if (_shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          // Set Payment in Progress
                          _model.paymentInProgress = true;
                          safeSetState(() {});
                          // YouKassa
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Оплата в платёжном шлюзе банка '),
                                content: Text('(Заменим на реальную)'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          // FinalizeBookings Action
                          _model.bookingSuccessCopy =
                              await actions.finalizeBookings(
                            widget.sessionId!,
                          );
                          _shouldSetState = true;
                          if (_model.bookingSuccessCopy == null ||
                              _model.bookingSuccessCopy == '') {
                            _model.bookingFinalized = true;
                            safeSetState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Оплата прошла успешно!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            // NOTIFICATION
                            await NotificationsTable().insert({
                              'user_id': widget.trainerId,
                              'title': 'У вас купили тренировку.',
                              'body':
                                  '${widget.trainingName} ${widget.slotCount?.toString()} занятия',
                            });
                            _model.paymentInProgress = false;
                            safeSetState(() {});

                            context.goNamed(
                              BookingConfirmationPageWidget.routeName,
                              queryParameters: {
                                'sessionId': serializeParam(
                                  widget.sessionId,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Ошибка бронирования'),
                                  content: Text(_model.bookingSuccessCopy!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.goNamed(PaymentSupportPageWidget.routeName);

                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).width >= 380.0
                            ? 48.0
                            : 42.0,
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.sizeOf(context).width * 0.3,
                          maxWidth: MediaQuery.sizeOf(context).width * 0.6,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 16.0, 0.0),
                              child: Text(
                                'ОПЛАТИТЬ ${'${valueOrDefault<String>(
                                  ((widget.trainingPrice!) *
                                          (widget.slotCount!))
                                      .toString(),
                                  '5000',
                                )} ₽'}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  380.0
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
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Отменить оплату?'),
                                  content:
                                      Text('Выбранные слоты будут освобождены'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Нет, продолжить'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Да, отменить'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
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
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Оплата отменена.'),
                                content: Text('Слоты освобождены.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          Navigator.pop(context);

                          context.pushNamed(
                            MainInfoTrainingWidget.routeName,
                            queryParameters: {
                              'trainingID': serializeParam(
                                widget.trainingId,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          return;
                        } else {
                          return;
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).width >= 380.0
                            ? 48.0
                            : 42.0,
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.sizeOf(context).width * 0.2,
                          maxWidth: MediaQuery.sizeOf(context).width * 0.4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Отмена',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF757575),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                380.0
                                            ? 16.0
                                            : 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
