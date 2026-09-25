import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach_clients/app_bar_coach_clients_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coach_clients_model.dart';
export 'coach_clients_model.dart';

class CoachClientsWidget extends StatefulWidget {
  const CoachClientsWidget({super.key});

  static String routeName = 'CoachClients';
  static String routePath = 'coachClients';

  @override
  State<CoachClientsWidget> createState() => _CoachClientsWidgetState();
}

class _CoachClientsWidgetState extends State<CoachClientsWidget> {
  late CoachClientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachClientsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
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
            child: Stack(
              children: [
                wrapWithModel(
                  model: _model.appBarCoachClientsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppBarCoachClientsWidget(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Все клиенты'),
                                ChipData('Онлайн тренировки'),
                                ChipData('Планы питания'),
                                ChipData('Планы тренировок'),
                                ChipData('Цифровые продукты')
                              ],
                              onChanged: (val) => safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFFFAC70),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF090A0A),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor: Color(0xFF15161E),
                                iconSize: 18.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 6.0),
                                elevation: 0.0,
                                borderWidth: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFF2F4F5),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF090A0A),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor: Color(0xFF606A85),
                                iconSize: 18.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 6.0, 12.0, 6.0),
                                elevation: 0.0,
                                borderWidth: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 6.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['Все клиенты'],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ),
                        if (_model.choiceChipsValue == 'Все клиенты')
                          FutureBuilder<List<ClientAllproductsViewRow>>(
                            future: ClientAllproductsViewTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'user_active',
                                    true,
                                  )
                                  .order('purchase_date'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Image.asset(
                                  'assets/images/logo.png',
                                );
                              }
                              List<ClientAllproductsViewRow>
                                  allClientsListViewClientAllproductsViewRowList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    allClientsListViewClientAllproductsViewRowList
                                        .length,
                                itemBuilder:
                                    (context, allClientsListViewIndex) {
                                  final allClientsListViewClientAllproductsViewRow =
                                      allClientsListViewClientAllproductsViewRowList[
                                          allClientsListViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 38.0, 16.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7F1FF),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 5.0, 34.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 35.0,
                                                  height: 35.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      allClientsListViewClientAllproductsViewRow
                                                          .userPhoto,
                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 18.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      allClientsListViewClientAllproductsViewRow
                                                          .userName,
                                                      'Нет имени',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      allClientsListViewClientAllproductsViewRow
                                                          .productName,
                                                      'Нет названия',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 7.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/receipt-item.svg',
                                                            width: 8.0,
                                                            height: 8.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${dateTimeFormat(
                                                          "dd.MM.yyyy ",
                                                          allClientsListViewClientAllproductsViewRow
                                                              .purchaseDate,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}${valueOrDefault<String>(
                                                          functions.utcToMoscowTime(
                                                              allClientsListViewClientAllproductsViewRow
                                                                  .purchaseDate),
                                                          '10:10',
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF292D32),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 18.0, 13.0, 18.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .chatUserName =
                                                          allClientsListViewClientAllproductsViewRow
                                                              .userName!;
                                                      safeSetState(() {});
                                                      _model.chatExist1 =
                                                          await ChatsTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${allClientsListViewClientAllproductsViewRow.userId}}',
                                                            )
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${currentUserUid}}',
                                                            ),
                                                      );
                                                      if (_model.chatExist1!
                                                              .length >
                                                          0) {
                                                        FFAppState()
                                                                .chatUserName =
                                                            allClientsListViewClientAllproductsViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist1
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist1
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        _model.chatCreated1 =
                                                            await ChatsTable()
                                                                .insert({
                                                          'chat_members': (String
                                                                      user,
                                                                  String trainer) {
                                                            return [user] +
                                                                [trainer];
                                                          }(
                                                              allClientsListViewClientAllproductsViewRow
                                                                  .userId!,
                                                              currentUserUid),
                                                        });
                                                        FFAppState()
                                                                .chatUserName =
                                                            allClientsListViewClientAllproductsViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatCreated1
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist1
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Button-Message-Notext.svg',
                                                        width: 48.0,
                                                        height: 48.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        if (_model.choiceChipsValue == 'Онлайн тренировки')
                          FutureBuilder<List<ClientTrainingsboughtViewRow>>(
                            future: ClientTrainingsboughtViewTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'trainer_id',
                                    currentUserUid,
                                  )
                                  .eqOrNull(
                                    'user_active',
                                    true,
                                  )
                                  .order('purchase_date'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Image.asset(
                                  'assets/images/logo.png',
                                );
                              }
                              List<ClientTrainingsboughtViewRow>
                                  trainingsClientListViewClientTrainingsboughtViewRowList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    trainingsClientListViewClientTrainingsboughtViewRowList
                                        .length,
                                itemBuilder:
                                    (context, trainingsClientListViewIndex) {
                                  final trainingsClientListViewClientTrainingsboughtViewRow =
                                      trainingsClientListViewClientTrainingsboughtViewRowList[
                                          trainingsClientListViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 38.0, 16.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7F1FF),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 5.0, 34.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 35.0,
                                                  height: 35.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      trainingsClientListViewClientTrainingsboughtViewRow
                                                          .userPhoto,
                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 18.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      trainingsClientListViewClientTrainingsboughtViewRow
                                                          .userName,
                                                      'Нет имени',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      trainingsClientListViewClientTrainingsboughtViewRow
                                                          .trainingName,
                                                      'Нет названия',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 7.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/receipt-item.svg',
                                                            width: 8.0,
                                                            height: 8.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd.MM.yyyy HH:mm",
                                                            trainingsClientListViewClientTrainingsboughtViewRow
                                                                .purchaseDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '01.10.2024',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF292D32),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 18.0, 13.0, 18.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .chatUserName =
                                                          trainingsClientListViewClientTrainingsboughtViewRow
                                                              .userName!;
                                                      safeSetState(() {});
                                                      _model.chatExist2 =
                                                          await ChatsTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${trainingsClientListViewClientTrainingsboughtViewRow.userId}}',
                                                            )
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${currentUserUid}}',
                                                            ),
                                                      );
                                                      if (_model.chatExist2!
                                                              .length >
                                                          0) {
                                                        FFAppState()
                                                                .chatUserName =
                                                            trainingsClientListViewClientTrainingsboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist2
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist2
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        _model.chatCreated2 =
                                                            await ChatsTable()
                                                                .insert({
                                                          'chat_members': (String
                                                                      user,
                                                                  String trainer) {
                                                            return [user] +
                                                                [trainer];
                                                          }(
                                                              trainingsClientListViewClientTrainingsboughtViewRow
                                                                  .userId!,
                                                              currentUserUid),
                                                        });
                                                        FFAppState()
                                                                .chatUserName =
                                                            trainingsClientListViewClientTrainingsboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatCreated2
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist2
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Button-Message-Notext.svg',
                                                        width: 48.0,
                                                        height: 48.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        if (_model.choiceChipsValue == 'Планы тренировок')
                          FutureBuilder<List<ClientTrainingplanboughtViewRow>>(
                            future:
                                ClientTrainingplanboughtViewTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'trainer_id',
                                    currentUserUid,
                                  )
                                  .eqOrNull(
                                    'user_active',
                                    true,
                                  )
                                  .order('purchase_date'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Image.asset(
                                  'assets/images/logo.png',
                                );
                              }
                              List<ClientTrainingplanboughtViewRow>
                                  trainingPlanClientListViewClientTrainingplanboughtViewRowList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    trainingPlanClientListViewClientTrainingplanboughtViewRowList
                                        .length,
                                itemBuilder:
                                    (context, trainingPlanClientListViewIndex) {
                                  final trainingPlanClientListViewClientTrainingplanboughtViewRow =
                                      trainingPlanClientListViewClientTrainingplanboughtViewRowList[
                                          trainingPlanClientListViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 38.0, 16.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7F1FF),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 5.0, 34.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 35.0,
                                                  height: 35.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                          .userPhoto,
                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 18.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                          .userName,
                                                      'Нет имени',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                          .trainingPlanName,
                                                      'Нет названия',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 7.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/receipt-item.svg',
                                                            width: 8.0,
                                                            height: 8.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd.MM.yyyy HH:mm",
                                                            trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                                .purchaseDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '01.10.2024',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF292D32),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 18.0, 13.0, 18.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .chatUserName =
                                                          trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                              .userName!;
                                                      safeSetState(() {});
                                                      _model.chatExist33 =
                                                          await ChatsTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${trainingPlanClientListViewClientTrainingplanboughtViewRow.userId}}',
                                                            )
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${currentUserUid}}',
                                                            ),
                                                      );
                                                      if (_model.chatExist33!
                                                              .length >
                                                          0) {
                                                        FFAppState()
                                                                .chatUserName =
                                                            trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist33
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist33
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        _model.chatCreated33 =
                                                            await ChatsTable()
                                                                .insert({
                                                          'chat_members': (String
                                                                      user,
                                                                  String trainer) {
                                                            return [user] +
                                                                [trainer];
                                                          }(
                                                              trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                                  .userId!,
                                                              currentUserUid),
                                                        });
                                                        FFAppState()
                                                                .chatUserName =
                                                            trainingPlanClientListViewClientTrainingplanboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatCreated33
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist33
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Button-Message-Notext.svg',
                                                        width: 48.0,
                                                        height: 48.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        if (_model.choiceChipsValue == 'Планы питания')
                          FutureBuilder<List<ClientNutritionplanboughtViewRow>>(
                            future:
                                ClientNutritionplanboughtViewTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'trainer_id',
                                    currentUserUid,
                                  )
                                  .eqOrNull(
                                    'user_active',
                                    true,
                                  )
                                  .order('purchase_date'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Image.asset(
                                  'assets/images/logo.png',
                                );
                              }
                              List<ClientNutritionplanboughtViewRow>
                                  nutritionClientListViewClientNutritionplanboughtViewRowList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    nutritionClientListViewClientNutritionplanboughtViewRowList
                                        .length,
                                itemBuilder:
                                    (context, nutritionClientListViewIndex) {
                                  final nutritionClientListViewClientNutritionplanboughtViewRow =
                                      nutritionClientListViewClientNutritionplanboughtViewRowList[
                                          nutritionClientListViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 38.0, 16.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7F1FF),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 5.0, 34.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 35.0,
                                                  height: 35.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      nutritionClientListViewClientNutritionplanboughtViewRow
                                                          .userPhoto,
                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 18.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      nutritionClientListViewClientNutritionplanboughtViewRow
                                                          .userName,
                                                      'Нет имени',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      nutritionClientListViewClientNutritionplanboughtViewRow
                                                          .nutritionPlanName,
                                                      'Нет названия',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 7.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/receipt-item.svg',
                                                            width: 8.0,
                                                            height: 8.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd.MM.yyyy HH:mm",
                                                            nutritionClientListViewClientNutritionplanboughtViewRow
                                                                .purchaseDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '01.10.2024',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF292D32),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 18.0, 13.0, 18.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .chatUserName =
                                                          nutritionClientListViewClientNutritionplanboughtViewRow
                                                              .userName!;
                                                      safeSetState(() {});
                                                      _model.chatExist3 =
                                                          await ChatsTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${nutritionClientListViewClientNutritionplanboughtViewRow.userId}}',
                                                            )
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${currentUserUid}}',
                                                            ),
                                                      );
                                                      if (_model.chatExist3!
                                                              .length >
                                                          0) {
                                                        FFAppState()
                                                                .chatUserName =
                                                            nutritionClientListViewClientNutritionplanboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist3
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist3
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        _model.chatCreated3 =
                                                            await ChatsTable()
                                                                .insert({
                                                          'chat_members': (String
                                                                      user,
                                                                  String trainer) {
                                                            return [user] +
                                                                [trainer];
                                                          }(
                                                              nutritionClientListViewClientNutritionplanboughtViewRow
                                                                  .userId!,
                                                              currentUserUid),
                                                        });
                                                        FFAppState()
                                                                .chatUserName =
                                                            nutritionClientListViewClientNutritionplanboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatCreated3
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist3
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Button-Message-Notext.svg',
                                                        width: 48.0,
                                                        height: 48.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        if (_model.choiceChipsValue == 'Цифровые продукты')
                          FutureBuilder<List<ClientDigiprodboughtViewRow>>(
                            future: ClientDigiprodboughtViewTable().queryRows(
                              queryFn: (q) => q
                                  .eqOrNull(
                                    'trainer_id',
                                    currentUserUid,
                                  )
                                  .eqOrNull(
                                    'user_active',
                                    true,
                                  )
                                  .order('purchase_date'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Image.asset(
                                  'assets/images/logo.png',
                                );
                              }
                              List<ClientDigiprodboughtViewRow>
                                  digiprodClientListViewClientDigiprodboughtViewRowList =
                                  snapshot.data!;

                              if (digiprodClientListViewClientDigiprodboughtViewRowList
                                  .isEmpty) {
                                return Image.asset(
                                  'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank_avatar.jpg',
                                );
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    digiprodClientListViewClientDigiprodboughtViewRowList
                                        .length,
                                itemBuilder:
                                    (context, digiprodClientListViewIndex) {
                                  final digiprodClientListViewClientDigiprodboughtViewRow =
                                      digiprodClientListViewClientDigiprodboughtViewRowList[
                                          digiprodClientListViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 38.0, 16.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7F1FF),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 5.0, 34.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 35.0,
                                                  height: 35.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      digiprodClientListViewClientDigiprodboughtViewRow
                                                          .userPhoto,
                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 18.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      digiprodClientListViewClientDigiprodboughtViewRow
                                                          .userName,
                                                      'Нет имени',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      digiprodClientListViewClientDigiprodboughtViewRow
                                                          .digiprodName,
                                                      'Нет названия',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 7.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/receipt-item.svg',
                                                            width: 8.0,
                                                            height: 8.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd.MM.yyyy HH:mm",
                                                            digiprodClientListViewClientDigiprodboughtViewRow
                                                                .purchaseDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '01.10.2024',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF292D32),
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 18.0, 13.0, 18.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .chatUserName =
                                                          digiprodClientListViewClientDigiprodboughtViewRow
                                                              .userName!;
                                                      safeSetState(() {});
                                                      _model.chatExist4 =
                                                          await ChatsTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${digiprodClientListViewClientDigiprodboughtViewRow.userId}}',
                                                            )
                                                            .containsOrNull(
                                                              'chat_members',
                                                              '{${currentUserUid}}',
                                                            ),
                                                      );
                                                      if (_model.chatExist4!
                                                              .length >
                                                          0) {
                                                        FFAppState()
                                                                .chatUserName =
                                                            digiprodClientListViewClientDigiprodboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist4
                                                                  ?.firstOrNull
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist4
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        _model.chatCreated4 =
                                                            await ChatsTable()
                                                                .insert({
                                                          'chat_members': (String
                                                                      user,
                                                                  String trainer) {
                                                            return [user] +
                                                                [trainer];
                                                          }(
                                                              digiprodClientListViewClientDigiprodboughtViewRow
                                                                  .userId!,
                                                              currentUserUid),
                                                        });
                                                        FFAppState()
                                                                .chatUserName =
                                                            digiprodClientListViewClientDigiprodboughtViewRow
                                                                .userName!;

                                                        context.pushNamed(
                                                          CoachChatWithClientWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'chatID':
                                                                serializeParam(
                                                              _model
                                                                  .chatCreated4
                                                                  ?.id,
                                                              ParamType.int,
                                                            ),
                                                            'chatMembers':
                                                                serializeParam(
                                                              _model
                                                                  .chatExist4
                                                                  ?.firstOrNull
                                                                  ?.chatMembers,
                                                              ParamType.String,
                                                              isList: true,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Button-Message-Notext.svg',
                                                        width: 48.0,
                                                        height: 48.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                      ].addToEnd(SizedBox(height: 150.0)),
                    ),
                  ),
                ),
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
    );
  }
}
