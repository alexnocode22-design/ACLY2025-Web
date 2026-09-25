import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pop_up_slot_selection_calendar_model.dart';
export 'pop_up_slot_selection_calendar_model.dart';

class PopUpSlotSelectionCalendarWidget extends StatefulWidget {
  const PopUpSlotSelectionCalendarWidget({
    super.key,
    required this.trainingID,
  });

  final int? trainingID;

  @override
  State<PopUpSlotSelectionCalendarWidget> createState() =>
      _PopUpSlotSelectionCalendarWidgetState();
}

class _PopUpSlotSelectionCalendarWidgetState
    extends State<PopUpSlotSelectionCalendarWidget> {
  late PopUpSlotSelectionCalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpSlotSelectionCalendarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: FutureBuilder<List<TrainingsMarketRow>>(
        future: TrainingsMarketTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.trainingID,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            );
          }
          List<TrainingsMarketRow> containerTrainingsMarketRowList =
              snapshot.data!;

          final containerTrainingsMarketRow =
              containerTrainingsMarketRowList.isNotEmpty
                  ? containerTrainingsMarketRowList.first
                  : null;

          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 26.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 11.0, 0.0),
                    child: FlutterFlowCalendar(
                      color: Color(0xFFFF740F),
                      iconColor: Color(0xFFFF740F),
                      weekFormat: false,
                      weekStartsMonday: true,
                      initialDate: getCurrentTimestamp,
                      rowHeight: 50.0,
                      onChange: (DateTimeRange? newSelectedDate) async {
                        if (_model.calendarSelectedDay == newSelectedDate) {
                          return;
                        }
                        _model.calendarSelectedDay = newSelectedDate;
                        safeSetState(() => _model.requestCompleter1 = null);
                        await _model.waitForRequestCompleted1();
                        safeSetState(() => _model.requestCompleter2 = null);
                        await _model.waitForRequestCompleted2();
                        safeSetState(() {});
                      },
                      titleStyle: FlutterFlowTheme.of(context)
                          .headlineSmall
                          .override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .fontStyle,
                            ),
                            color: Color(0xFF344054),
                            fontSize: MediaQuery.sizeOf(context).width >= 380.0
                                ? 22.0
                                : 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                      dayOfWeekStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                                color: Color(0xFF6C7072),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                      dateStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      selectedDateStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      inactiveDateStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 22.0, 11.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF9F5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 17.0, 0.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                'Свободные слоты:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF160E16),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 59.0,
                              decoration: BoxDecoration(),
                              child: FutureBuilder<
                                  List<AvailableTrainingSlotsRow>>(
                                future: (_model.requestCompleter1 ??= Completer<
                                        List<AvailableTrainingSlotsRow>>()
                                      ..complete(AvailableTrainingSlotsTable()
                                          .queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'training_id',
                                              widget.trainingID,
                                            )
                                            .eqOrNull(
                                              'slot_date',
                                              supaSerialize<DateTime>(_model
                                                  .calendarSelectedDay?.start),
                                            )
                                            .gtOrNull(
                                              'slot_start_datetime',
                                              supaSerialize<DateTime>(functions
                                                  .currentTimeToMoscowTime()),
                                            )
                                            .order('slot_start_datetime',
                                                ascending: true),
                                      )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                      ),
                                    );
                                  }
                                  List<AvailableTrainingSlotsRow>
                                      freeSlotsListViewAvailableTrainingSlotsRowList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        freeSlotsListViewAvailableTrainingSlotsRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 8.0),
                                    itemBuilder:
                                        (context, freeSlotsListViewIndex) {
                                      final freeSlotsListViewAvailableTrainingSlotsRow =
                                          freeSlotsListViewAvailableTrainingSlotsRowList[
                                              freeSlotsListViewIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Подтвердите выбор:'),
                                                            content: Text(
                                                                dateTimeFormat(
                                                              "dd-MM-yyyy HH:mm",
                                                              functions
                                                                  .stringToTime(
                                                                      dateTimeFormat(
                                                                        "Hm",
                                                                        freeSlotsListViewAvailableTrainingSlotsRow
                                                                            .slotStartDatetime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      _model
                                                                          .calendarSelectedDay
                                                                          ?.start),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Отменить'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Подтвердить'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                // Create TrainingBought Row
                                                _model.trainingBoughtID =
                                                    await TrainingsBoughtTable()
                                                        .insert({
                                                  'training_id':
                                                      widget.trainingID,
                                                  'trainer_id':
                                                      freeSlotsListViewAvailableTrainingSlotsRow
                                                          .trainerId,
                                                  'training_price':
                                                      containerTrainingsMarketRow
                                                          ?.trainingPrice,
                                                  'user_id': currentUserUid,
                                                  'slot_start_datetime': supaSerialize<
                                                          DateTime>(
                                                      functions.stringToTime(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              freeSlotsListViewAvailableTrainingSlotsRow
                                                                  .slotStartDatetime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '00:00',
                                                          ),
                                                          _model
                                                              .calendarSelectedDay
                                                              ?.start)),
                                                  'slot_duration':
                                                      containerTrainingsMarketRow
                                                          ?.slotDuration,
                                                  'training_name':
                                                      containerTrainingsMarketRow
                                                          ?.trainingName,
                                                  'training_payed': false,
                                                  'training_quantity': 1,
                                                  'slot_id':
                                                      freeSlotsListViewAvailableTrainingSlotsRow
                                                          .slotId,
                                                  'slot_cancelled': false,
                                                  'training_photo1':
                                                      containerTrainingsMarketRow
                                                          ?.trainingPhoto1,
                                                });
                                                _shouldSetState = true;
                                                // Update Component State training Selected
                                                _model.addToTrainingsSelected(
                                                    _model
                                                        .trainingBoughtID!.id);
                                                safeSetState(() {});
                                                // Update App State slotBoughtTemp
                                                FFAppState()
                                                    .addToSlotBoughtTemp(
                                                        SlotboughtStruct(
                                                  slotId: _model
                                                      .trainingBoughtID?.slotId,
                                                  slotStartDatetime: _model
                                                      .trainingBoughtID
                                                      ?.slotStartDatetime,
                                                  trainingPrice: _model
                                                      .trainingBoughtID
                                                      ?.trainingPrice,
                                                  trainingBoughtID: _model
                                                      .trainingBoughtID?.id,
                                                ));
                                                safeSetState(() {});
                                                // Refresh FreeSlotsListView
                                                safeSetState(() => _model
                                                    .requestCompleter1 = null);
                                                await _model
                                                    .waitForRequestCompleted1();
                                                // Refresh SelectedListView
                                                safeSetState(() => _model
                                                    .requestCompleter2 = null);
                                                await _model
                                                    .waitForRequestCompleted2();
                                                // Query training_slots table
                                                _model.slotMonthAvailability =
                                                    await TrainingSlotsTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    _model.trainingBoughtID
                                                        ?.slotId,
                                                  ),
                                                );
                                                _shouldSetState = true;
                                                // Set monthAvailability
                                                _model.monthAvailability =
                                                    _model
                                                        .slotMonthAvailability!
                                                        .firstOrNull!
                                                        .monthAvailability!;
                                                _model.slotSelected = true;
                                                safeSetState(() {});
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            text: valueOrDefault<String>(
                                              dateTimeFormat(
                                                "Hm",
                                                freeSlotsListViewAvailableTrainingSlotsRow
                                                    .slotStartDatetime,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '00:00',
                                            ),
                                            options: FFButtonOptions(
                                              width: 68.0,
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFFFF9F5),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF7B43CE),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFF7B43CE),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Text(
                                                '${valueOrDefault<String>(
                                                  freeSlotsListViewAvailableTrainingSlotsRow
                                                      .slotDuration
                                                      ?.toString(),
                                                  '00',
                                                )} минут',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 10.0,
                                                      letterSpacing: 0.0,
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
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            if ((_model.trainingBoughtID != null) &&
                                (_model.slotSelected == true))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 14.0),
                                child: Text(
                                  'Выбрано:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF160E16),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            if (_model.trainingBoughtID != null)
                              Container(
                                width: 100.0,
                                height: 62.0,
                                decoration: BoxDecoration(),
                                child: FutureBuilder<List<TrainingsBoughtRow>>(
                                  future: (_model.requestCompleter2 ??=
                                          Completer<List<TrainingsBoughtRow>>()
                                            ..complete(TrainingsBoughtTable()
                                                .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'training_id',
                                                    widget.trainingID,
                                                  )
                                                  .eqOrNull(
                                                    'user_id',
                                                    currentUserUid,
                                                  )
                                                  .eqOrNull(
                                                    'training_payed',
                                                    false,
                                                  )
                                                  .order('slot_start_datetime',
                                                      ascending: true),
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/logo.png',
                                        ),
                                      );
                                    }
                                    List<TrainingsBoughtRow>
                                        selectedListViewTrainingsBoughtRowList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          selectedListViewTrainingsBoughtRowList
                                              .length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 8.0),
                                      itemBuilder:
                                          (context, selectedListViewIndex) {
                                        final selectedListViewTrainingsBoughtRow =
                                            selectedListViewTrainingsBoughtRowList[
                                                selectedListViewIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  dateTimeFormat(
                                                    "dd.MM.yyyy",
                                                    selectedListViewTrainingsBoughtRow
                                                        .slotStartDatetime,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  '01.10.2024',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                                      fontSize: 10.0,
                                                      letterSpacing: 0.0,
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
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Отменить выбор:'),
                                                                content: Text(
                                                                    dateTimeFormat(
                                                                  "dd-MM-yyyy HH:mm",
                                                                  functions
                                                                      .stringToTime(
                                                                          dateTimeFormat(
                                                                            "Hm",
                                                                            selectedListViewTrainingsBoughtRow.slotStartDatetime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          _model
                                                                              .calendarSelectedDay
                                                                              ?.start),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Нет'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Да'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    if (_model
                                                            .checkboxMonthValue ==
                                                        true) {
                                                      await actions
                                                          .deleteBulkBookedTrainingSlots(
                                                        _model.trainingsSelected
                                                            .toList(),
                                                      );
                                                      // Set Form Field Month to FALSE
                                                      safeSetState(() {
                                                        _model.checkboxMonthValue =
                                                            false;
                                                      });
                                                    }
                                                    // Delete Row(s) from the 'trainingsBought'
                                                    await TrainingsBoughtTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'id',
                                                        selectedListViewTrainingsBoughtRow
                                                            .id,
                                                      ),
                                                    );
                                                    _shouldSetState = true;
                                                    // Delete from trainingSelected
                                                    _model.removeFromTrainingsSelected(
                                                        _model.trainingBoughtID!
                                                            .id);
                                                    _model.slotSelected = false;
                                                    safeSetState(() {});
                                                    // Refresh Database Request FreeSlotsListView
                                                    safeSetState(() => _model
                                                            .requestCompleter1 =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted1();
                                                    // Refresh Database Request SelectedListView
                                                    safeSetState(() => _model
                                                            .requestCompleter2 =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted2();
                                                    // Query trainingsBought
                                                    _model.trainingsIsBought =
                                                        await TrainingsBoughtTable()
                                                            .queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'training_id',
                                                            widget.trainingID,
                                                          )
                                                          .eqOrNull(
                                                            'user_id',
                                                            currentUserUid,
                                                          ),
                                                    );
                                                    _shouldSetState = true;
                                                    if (_model.trainingsSelected
                                                            .length >
                                                        0) {
                                                      _model.slotSelected =
                                                          true;
                                                      safeSetState(() {});
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      _model.slotSelected =
                                                          false;
                                                      safeSetState(() {});
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: valueOrDefault<String>(
                                                  dateTimeFormat(
                                                    "Hm",
                                                    selectedListViewTrainingsBoughtRow
                                                        .slotStartDatetime,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  '00:00',
                                                ),
                                                options: FFButtonOptions(
                                                  width: 68.0,
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF7B43CE),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFFF9F5),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF7B43CE),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                            Text(
                                              '${valueOrDefault<String>(
                                                selectedListViewTrainingsBoughtRow
                                                    .slotDuration
                                                    ?.toString(),
                                                '00',
                                              )} минут',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
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
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      if (valueOrDefault<bool>(
                            _model.monthAvailability == true,
                            false,
                          ) &&
                          (_model.trainingBoughtID != null) &&
                          (_model.slotSelected == true))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 30.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: Color(0xFF292D32),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxMonthValue ??= false,
                                  onChanged: (newValue) async {
                                    safeSetState(() =>
                                        _model.checkboxMonthValue = newValue!);
                                    if (newValue!) {
                                      await actions.bulkBookTrainingSlots(
                                        _model.trainingsSelected.toList(),
                                      );
                                      safeSetState(() =>
                                          _model.requestCompleter2 = null);
                                      await _model.waitForRequestCompleted2();
                                    } else {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Отменить абонемент на месяц'),
                                                    content:
                                                        Text('Вы уверены?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Нет'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('Да'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await actions
                                            .deleteBulkBookedTrainingSlots(
                                          _model.trainingsSelected.toList(),
                                        );
                                        safeSetState(() =>
                                            _model.requestCompleter2 = null);
                                        await _model.waitForRequestCompleted2();
                                        return;
                                      } else {
                                        return;
                                      }
                                    }
                                  },
                                  side: (Color(0xFF292D32) != null)
                                      ? BorderSide(
                                          width: 2,
                                          color: Color(0xFF292D32),
                                        )
                                      : null,
                                  activeColor: Color(0xFF292D32),
                                  checkColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              Text(
                                'Купить абонемент на месяц ',
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
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1.0, 0.0, 0.0, 8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidQuestionCircle,
                                    color: Color(0xFF7B43CE),
                                    size: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 28.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Container(
                          height: MediaQuery.sizeOf(context).width >= 380.0
                              ? 48.0
                              : 42.0,
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
                                Text(
                                  'Сохранить → ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
