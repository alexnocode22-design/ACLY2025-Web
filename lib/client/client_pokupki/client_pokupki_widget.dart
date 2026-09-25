import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/nothing_bought_widget.dart';
import '/components_client/app_bar_user_pokupki/app_bar_user_pokupki_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_pokupki_model.dart';
export 'client_pokupki_model.dart';

class ClientPokupkiWidget extends StatefulWidget {
  const ClientPokupkiWidget({super.key});

  static String routeName = 'ClientPokupki';
  static String routePath = 'clientPokupki';

  @override
  State<ClientPokupkiWidget> createState() => _ClientPokupkiWidgetState();
}

class _ClientPokupkiWidgetState extends State<ClientPokupkiWidget> {
  late ClientPokupkiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientPokupkiModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      await TrainingsBoughtTable().delete(
        matchingRows: (rows) => rows
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'training_payed',
              false,
            ),
      );
      _model.trainingsFavouritesResult =
          await FavouriteTrainingsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.trainingFavourites = _model.trainingsFavouritesResult!
          .toList()
          .cast<FavouriteTrainingsRow>();
      safeSetState(() {});
      _model.trainingPlansFavouritesResult =
          await FavouriteTrainingPlansTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.trainingPlanFavourites = _model.trainingPlansFavouritesResult!
          .toList()
          .cast<FavouriteTrainingPlansRow>();
      safeSetState(() {});
      _model.nutritionPlansFavouritesResult =
          await FavouriteNutritionplanTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.nutritionPlanFavourites = _model.nutritionPlansFavouritesResult!
          .toList()
          .cast<FavouriteNutritionplanRow>();
      safeSetState(() {});
      _model.digiprodFavouritesResult =
          await FavouriteDigiptalroductTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.digiProdFavourites = _model.digiprodFavouritesResult!
          .toList()
          .cast<FavouriteDigiptalroductRow>();
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
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.appBarUserPokupkiModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarUserPokupkiWidget(),
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
                            30.0, 40.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Тренировки',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                380.0
                                            ? 20.0
                                            : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<TrainingsBoughtRow>>(
                        future: TrainingsBoughtTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
                              )
                              .eqOrNull(
                                'training_payed',
                                true,
                              )
                              .order('created_at'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Image.asset(
                              'assets/images/logo.png',
                            );
                          }
                          List<TrainingsBoughtRow>
                              trainingBoughtTrainingsBoughtRowList =
                              snapshot.data!;

                          if (trainingBoughtTrainingsBoughtRowList.isEmpty) {
                            return NothingBoughtWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                trainingBoughtTrainingsBoughtRowList.length,
                            itemBuilder: (context, trainingBoughtIndex) {
                              final trainingBoughtTrainingsBoughtRow =
                                  trainingBoughtTrainingsBoughtRowList[
                                      trainingBoughtIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 22.0, 16.0, 0.0),
                                child: FutureBuilder<
                                    List<CombinedTrainingsViewRow>>(
                                  future: CombinedTrainingsViewTable()
                                      .querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      trainingBoughtTrainingsBoughtRow
                                          .trainingId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Image.asset(
                                        'assets/images/logo.png',
                                      );
                                    }
                                    List<CombinedTrainingsViewRow>
                                        trainingBoughtContainerCombinedTrainingsViewRowList =
                                        snapshot.data!;

                                    final trainingBoughtContainerCombinedTrainingsViewRow =
                                        trainingBoughtContainerCombinedTrainingsViewRowList
                                                .isNotEmpty
                                            ? trainingBoughtContainerCombinedTrainingsViewRowList
                                                .first
                                            : null;

                                    return Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 343.0,
                                        maxHeight: 128.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F4F5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                // Training exist ?
                                                _model.trainingExistsQuery =
                                                    await TrainingsMarketTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'id',
                                                        trainingBoughtTrainingsBoughtRow
                                                            .trainingId,
                                                      )
                                                      .eqOrNull(
                                                        'trainer_id',
                                                        trainingBoughtTrainingsBoughtRow
                                                            .trainerId,
                                                      ),
                                                );
                                                _shouldSetState = true;
                                                // Trainer Active ?
                                                _model.trainerActive =
                                                    await TrainerProfileTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'trainer_id',
                                                    trainingBoughtTrainingsBoughtRow
                                                        .trainerId,
                                                  ),
                                                );
                                                _shouldSetState = true;
                                                if ((_model.trainingExistsQuery!
                                                            .length >
                                                        0) &&
                                                    (_model
                                                            .trainerActive
                                                            ?.firstOrNull
                                                            ?.trainerActive ==
                                                        true)) {
                                                  context.pushNamed(
                                                    MainInfoTrainingWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'trainingID':
                                                          serializeParam(
                                                        trainingBoughtTrainingsBoughtRow
                                                            .trainingId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else {
                                                  context.pushNamed(
                                                    TrainingNotExistWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'trainingID':
                                                          serializeParam(
                                                        trainingBoughtTrainingsBoughtRow
                                                            .trainingId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  minWidth: 130.0,
                                                  minHeight: 110.0,
                                                  maxWidth: 150.0,
                                                  maxHeight: 110.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        trainingBoughtContainerCombinedTrainingsViewRow
                                                            ?.trainingPhoto1,
                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/_training_shadow1.jpg',
                                                      ),
                                                      fit: BoxFit.fill,
                                                      cacheWidth: 130,
                                                      cacheHeight: 100,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 56.0,
                                                          height: 16.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xCCFF740F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Тренировки',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 7.0
                                                                          : 6.0,
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
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions.utczToMoscowTime(
                                                                trainingBoughtTrainingsBoughtRow
                                                                    .slotStartDatetime),
                                                            '01.01.2026 01:00',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF7B43CE),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 8.0
                                                                        : 6.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        trainingBoughtTrainingsBoughtRow
                                                            .trainingName,
                                                        'Нет названия',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 40,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF2C2C2C),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 14.0
                                                                        : 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    trainingBoughtContainerCombinedTrainingsViewRow
                                                                        ?.userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Тренер',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF808080),
                                                                            fontSize:
                                                                                6.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${valueOrDefault<String>(
                                                                            trainingBoughtContainerCombinedTrainingsViewRow?.userName,
                                                                            'Нет имени',
                                                                          )} ${valueOrDefault<String>(
                                                                            trainingBoughtContainerCombinedTrainingsViewRow?.userSurname,
                                                                            'Нет фамилии',
                                                                          )}',
                                                                          'Имя Фамилия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 380.0 ? 10.0 : 8.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (functions.isFavouriteInList(
                                                                  trainingBoughtTrainingsBoughtRow
                                                                      .trainingId!,
                                                                  _model
                                                                      .trainingFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        while (_model.count1 <
                                                                            _model.trainingFavourites.length) {
                                                                          if (trainingBoughtTrainingsBoughtRow.trainingId ==
                                                                              _model.trainingFavourites.elementAtOrNull(_model.count1)?.trainingId) {
                                                                            await FavouriteTrainingsTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'training_id',
                                                                                    trainingBoughtTrainingsBoughtRow.trainingId,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  ),
                                                                            );
                                                                            _model.removeAtIndexFromTrainingFavourites(_model.count1);
                                                                            safeSetState(() {});
                                                                            _model.count1 =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            break;
                                                                          } else {
                                                                            _model.count1 =
                                                                                _model.count1 + 1;
                                                                            safeSetState(() {});
                                                                          }
                                                                        }
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav2.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (!functions.isFavouriteInList(
                                                                  trainingBoughtTrainingsBoughtRow
                                                                      .trainingId!,
                                                                  _model
                                                                      .trainingFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.newFavoriteTrainingResult =
                                                                            await FavouriteTrainingsTable().insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'training_id':
                                                                              trainingBoughtTrainingsBoughtRow.trainingId,
                                                                        });
                                                                        _model.addToTrainingFavourites(
                                                                            _model.newFavoriteTrainingResult!);
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav1.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 40.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Планы тренировок',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                380.0
                                            ? 20.0
                                            : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<ClientTrainingplanboughtViewRow>>(
                        future: ClientTrainingplanboughtViewTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
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
                              trainingPlansBoughtClientTrainingplanboughtViewRowList =
                              snapshot.data!;

                          if (trainingPlansBoughtClientTrainingplanboughtViewRowList
                              .isEmpty) {
                            return NothingBoughtWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                trainingPlansBoughtClientTrainingplanboughtViewRowList
                                    .length,
                            itemBuilder: (context, trainingPlansBoughtIndex) {
                              final trainingPlansBoughtClientTrainingplanboughtViewRow =
                                  trainingPlansBoughtClientTrainingplanboughtViewRowList[
                                      trainingPlansBoughtIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 22.0, 16.0, 0.0),
                                child: FutureBuilder<
                                    List<CombinedTrainingplansViewRow>>(
                                  future: CombinedTrainingplansViewTable()
                                      .querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      trainingPlansBoughtClientTrainingplanboughtViewRow
                                          .trainingPlanId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CombinedTrainingplansViewRow>
                                        trainingPlansContainerCombinedTrainingplansViewRowList =
                                        snapshot.data!;

                                    final trainingPlansContainerCombinedTrainingplansViewRow =
                                        trainingPlansContainerCombinedTrainingplansViewRowList
                                                .isNotEmpty
                                            ? trainingPlansContainerCombinedTrainingplansViewRowList
                                                .first
                                            : null;

                                    return Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 343.0,
                                        maxHeight: 128.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F4F5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                _model.trainingPlanExists =
                                                    await TrainingPlanMarketTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'id',
                                                        trainingPlansBoughtClientTrainingplanboughtViewRow
                                                            .trainingPlanId,
                                                      )
                                                      .eqOrNull(
                                                        'trainer_id',
                                                        trainingPlansBoughtClientTrainingplanboughtViewRow
                                                            .trainerId,
                                                      ),
                                                );
                                                _shouldSetState = true;
                                                // Trainer Active ?
                                                _model.trainerTrainingPlanActive =
                                                    await TrainerProfileTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'trainer_id',
                                                    trainingPlansBoughtClientTrainingplanboughtViewRow
                                                        .trainerId,
                                                  ),
                                                );
                                                _shouldSetState = true;
                                                if ((_model.trainingPlanExists!
                                                            .length >
                                                        0) &&
                                                    (_model
                                                            .trainerTrainingPlanActive
                                                            ?.firstOrNull
                                                            ?.trainerActive ==
                                                        true)) {
                                                  context.pushNamed(
                                                    BoughtTtrainingPlanWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'trainingPlanID':
                                                          serializeParam(
                                                        trainingPlansBoughtClientTrainingplanboughtViewRow
                                                            .trainingPlanId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else {
                                                  context.pushNamed(
                                                    TrainingPlanNotExistWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'trainingPlanID':
                                                          serializeParam(
                                                        trainingPlansBoughtClientTrainingplanboughtViewRow
                                                            .trainingPlanId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  minWidth: 130.0,
                                                  minHeight: 110.0,
                                                  maxWidth: 150.0,
                                                  maxHeight: 110.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        trainingPlansBoughtClientTrainingplanboughtViewRow
                                                            .trainingPlanPhoto1,
                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/training_plan1.jpg',
                                                      ),
                                                      fit: BoxFit.fill,
                                                      cacheWidth: 130,
                                                      cacheHeight: 100,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 56.0,
                                                          height: 16.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xCCFF740F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Тренировки',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 7.0
                                                                          : 6.0,
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
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "dd.MM.yyyy HH:mm",
                                                              trainingPlansBoughtClientTrainingplanboughtViewRow
                                                                  .purchaseDate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '12.12.2024',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF7B43CE),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 8.0
                                                                        : 6.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        trainingPlansBoughtClientTrainingplanboughtViewRow
                                                            .trainingPlanName,
                                                        'Нет названия',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 40,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF2C2C2C),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 14.0
                                                                        : 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    trainingPlansContainerCombinedTrainingplansViewRow
                                                                        ?.userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Тренер',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF808080),
                                                                            fontSize:
                                                                                6.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${trainingPlansContainerCombinedTrainingplansViewRow?.userName} ${trainingPlansContainerCombinedTrainingplansViewRow?.userSurname}',
                                                                          'Имя Фамилия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 380.0 ? 10.0 : 8.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (functions.isFavouriteTrainingPlanInList(
                                                                  trainingPlansBoughtClientTrainingplanboughtViewRow
                                                                      .trainingPlanId!,
                                                                  _model
                                                                      .trainingPlanFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        while (_model.count2 <
                                                                            _model.trainingPlanFavourites.length) {
                                                                          if (trainingPlansBoughtClientTrainingplanboughtViewRow.trainingPlanId ==
                                                                              _model.trainingPlanFavourites.elementAtOrNull(_model.count2)?.trainingplanId) {
                                                                            await FavouriteTrainingPlansTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'trainingplan_id',
                                                                                    trainingPlansBoughtClientTrainingplanboughtViewRow.trainingPlanId,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  ),
                                                                            );
                                                                            _model.removeAtIndexFromTrainingPlanFavourites(_model.count2);
                                                                            safeSetState(() {});
                                                                            _model.count2 =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            break;
                                                                          } else {
                                                                            _model.count2 =
                                                                                _model.count2 + 1;
                                                                            safeSetState(() {});
                                                                          }
                                                                        }
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav2.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (!functions.isFavouriteTrainingPlanInList(
                                                                  trainingPlansBoughtClientTrainingplanboughtViewRow
                                                                      .trainingPlanId!,
                                                                  _model
                                                                      .trainingPlanFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.newFavoriteTrainingPlanResult =
                                                                            await FavouriteTrainingPlansTable().insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'trainingplan_id':
                                                                              trainingPlansBoughtClientTrainingplanboughtViewRow.trainingPlanId,
                                                                        });
                                                                        _model.addToTrainingPlanFavourites(
                                                                            _model.newFavoriteTrainingPlanResult!);
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav1.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 40.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Планы питания',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                380.0
                                            ? 20.0
                                            : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<ClientNutritionplanboughtViewRow>>(
                        future: ClientNutritionplanboughtViewTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
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
                              nutritionPlansBoughtClientNutritionplanboughtViewRowList =
                              snapshot.data!;

                          if (nutritionPlansBoughtClientNutritionplanboughtViewRowList
                              .isEmpty) {
                            return NothingBoughtWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                nutritionPlansBoughtClientNutritionplanboughtViewRowList
                                    .length,
                            itemBuilder: (context, nutritionPlansBoughtIndex) {
                              final nutritionPlansBoughtClientNutritionplanboughtViewRow =
                                  nutritionPlansBoughtClientNutritionplanboughtViewRowList[
                                      nutritionPlansBoughtIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 22.0, 16.0, 0.0),
                                child: FutureBuilder<
                                    List<CombinedNutritionplansViewRow>>(
                                  future: CombinedNutritionplansViewTable()
                                      .querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      nutritionPlansBoughtClientNutritionplanboughtViewRow
                                          .nutritionPlanId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CombinedNutritionplansViewRow>
                                        nutritionPlansContainerCombinedNutritionplansViewRowList =
                                        snapshot.data!;

                                    final nutritionPlansContainerCombinedNutritionplansViewRow =
                                        nutritionPlansContainerCombinedNutritionplansViewRowList
                                                .isNotEmpty
                                            ? nutritionPlansContainerCombinedNutritionplansViewRowList
                                                .first
                                            : null;

                                    return Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 343.0,
                                        maxHeight: 128.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F4F5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                _model.nutritionPlanExists =
                                                    await NutritionPlanMarketTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'id',
                                                        nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                            .nutritionPlanId,
                                                      )
                                                      .eqOrNull(
                                                        'trainer_id',
                                                        nutritionPlansContainerCombinedNutritionplansViewRow
                                                            ?.trainerId,
                                                      ),
                                                );
                                                _shouldSetState = true;
                                                // Trainer Active ?
                                                _model.trainerNutrPlanActive =
                                                    await TrainerProfileTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'trainer_id',
                                                    nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                        .trainerId,
                                                  ),
                                                );
                                                _shouldSetState = true;
                                                if ((_model.nutritionPlanExists!
                                                            .length >
                                                        0) &&
                                                    (_model
                                                            .trainerNutrPlanActive
                                                            ?.firstOrNull
                                                            ?.trainerActive ==
                                                        true)) {
                                                  context.pushNamed(
                                                    BoughtNutritionPlanWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'nutritionPlanID':
                                                          serializeParam(
                                                        nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                            .nutritionPlanId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else {
                                                  context.pushNamed(
                                                    NutritionPlanNotExistWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'nutritionPlanID':
                                                          serializeParam(
                                                        nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                            .nutritionPlanId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  minWidth: 130.0,
                                                  minHeight: 110.0,
                                                  maxWidth: 150.0,
                                                  maxHeight: 110.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                            .nutritionPlanPhoto1,
                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/nutritiop_plan-default.jpg',
                                                      ),
                                                      fit: BoxFit.fill,
                                                      cacheWidth: 130,
                                                      cacheHeight: 100,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 66.0,
                                                          height: 16.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xCCFF740F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Планы питания',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 7.0
                                                                          : 6.0,
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
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "dd.MM.yyyy HH:mm",
                                                              nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                                  .purchaseDate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '12.12.2024',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF7B43CE),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 8.0
                                                                        : 6.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                            .nutritionPlanName,
                                                        'Нет названия',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 40,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF2C2C2C),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 14.0
                                                                        : 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    nutritionPlansContainerCombinedNutritionplansViewRow
                                                                        ?.userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Тренер',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF808080),
                                                                            fontSize:
                                                                                6.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${nutritionPlansContainerCombinedNutritionplansViewRow?.userName} ${nutritionPlansContainerCombinedNutritionplansViewRow?.userSurname}',
                                                                          'Имя Фамилия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 380.0 ? 10.0 : 8.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (functions.isFavouriteNutritionPlanInList(
                                                                  nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                                      .nutritionPlanId!,
                                                                  _model
                                                                      .nutritionPlanFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        while (_model.count3 <
                                                                            _model.nutritionPlanFavourites.length) {
                                                                          if (nutritionPlansBoughtClientNutritionplanboughtViewRow.nutritionPlanId ==
                                                                              _model.nutritionPlanFavourites.elementAtOrNull(_model.count3)?.nutritionplanId) {
                                                                            _model.removeAtIndexFromNutritionPlanFavourites(_model.count3);
                                                                            safeSetState(() {});
                                                                            await FavouriteNutritionplanTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'nutritionplan_id',
                                                                                    nutritionPlansBoughtClientNutritionplanboughtViewRow.nutritionPlanId,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  ),
                                                                            );
                                                                            _model.count3 =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            break;
                                                                          } else {
                                                                            _model.count3 =
                                                                                _model.count3 + 1;
                                                                            safeSetState(() {});
                                                                          }
                                                                        }
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav2.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (!functions.isFavouriteNutritionPlanInList(
                                                                  nutritionPlansBoughtClientNutritionplanboughtViewRow
                                                                      .nutritionPlanId!,
                                                                  _model
                                                                      .nutritionPlanFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.newFavoriteNutritionPlangResult =
                                                                            await FavouriteNutritionplanTable().insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'nutritionplan_id':
                                                                              nutritionPlansBoughtClientNutritionplanboughtViewRow.nutritionPlanId,
                                                                        });
                                                                        _model.addToNutritionPlanFavourites(
                                                                            _model.newFavoriteNutritionPlangResult!);
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav1.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 40.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Цифровые продукты',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                380.0
                                            ? 20.0
                                            : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<List<ClientDigiprodboughtViewRow>>(
                        future: ClientDigiprodboughtViewTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
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
                              digiProdBoughtClientDigiprodboughtViewRowList =
                              snapshot.data!;

                          if (digiProdBoughtClientDigiprodboughtViewRowList
                              .isEmpty) {
                            return NothingBoughtWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                digiProdBoughtClientDigiprodboughtViewRowList
                                    .length,
                            itemBuilder: (context, digiProdBoughtIndex) {
                              final digiProdBoughtClientDigiprodboughtViewRow =
                                  digiProdBoughtClientDigiprodboughtViewRowList[
                                      digiProdBoughtIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 22.0, 16.0, 0.0),
                                child: FutureBuilder<
                                    List<CombinedDigitalproductViewRow>>(
                                  future: CombinedDigitalproductViewTable()
                                      .querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id',
                                      digiProdBoughtClientDigiprodboughtViewRow
                                          .digiprodId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CombinedDigitalproductViewRow>
                                        digiProdContainerCombinedDigitalproductViewRowList =
                                        snapshot.data!;

                                    final digiProdContainerCombinedDigitalproductViewRow =
                                        digiProdContainerCombinedDigitalproductViewRowList
                                                .isNotEmpty
                                            ? digiProdContainerCombinedDigitalproductViewRowList
                                                .first
                                            : null;

                                    return Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 343.0,
                                        maxHeight: 128.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F4F5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                // DigiProdExists ?
                                                _model.digiProdExists =
                                                    await DigitalProductMarketTable()
                                                        .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'id',
                                                        digiProdBoughtClientDigiprodboughtViewRow
                                                            .digiprodId,
                                                      )
                                                      .eqOrNull(
                                                        'trainer_id',
                                                        digiProdBoughtClientDigiprodboughtViewRow
                                                            .trainerId,
                                                      ),
                                                );
                                                _shouldSetState = true;
                                                // DigiProdTrainerActive ?
                                                _model.digiProdTrainerActive =
                                                    await TrainerProfileTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'trainer_id',
                                                    digiProdBoughtClientDigiprodboughtViewRow
                                                        .trainerId,
                                                  ),
                                                );
                                                _shouldSetState = true;
                                                if ((_model.digiProdExists!
                                                            .length >
                                                        0) &&
                                                    (_model
                                                            .digiProdTrainerActive
                                                            ?.firstOrNull
                                                            ?.trainerActive ==
                                                        true)) {
                                                  context.pushNamed(
                                                    BoughtDigitalProductWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'digiprodID':
                                                          serializeParam(
                                                        digiProdBoughtClientDigiprodboughtViewRow
                                                            .digiprodId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                } else {
                                                  context.pushNamed(
                                                    DigiprodNotExistWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'digiProdID':
                                                          serializeParam(
                                                        digiProdBoughtClientDigiprodboughtViewRow
                                                            .digiprodId,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              child: Container(
                                                constraints: BoxConstraints(
                                                  minWidth: 130.0,
                                                  minHeight: 110.0,
                                                  maxWidth: 150.0,
                                                  maxHeight: 110.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        digiProdBoughtClientDigiprodboughtViewRow
                                                            .digiprodPhoto1,
                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/DigiProd3.jpg',
                                                      ),
                                                      fit: BoxFit.fill,
                                                      cacheWidth: 130,
                                                      cacheHeight: 100,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 86.0,
                                                          height: 16.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xCCFF740F),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            'Цифровые продукты',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 7.0
                                                                          : 6.0,
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
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "dd.MM.yyyy HH:mm",
                                                              digiProdBoughtClientDigiprodboughtViewRow
                                                                  .purchaseDate,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '12.12.2024',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF7B43CE),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 8.0
                                                                        : 6.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                2.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        digiProdBoughtClientDigiprodboughtViewRow
                                                            .digiprodName,
                                                        'Нет названия',
                                                      ).maybeHandleOverflow(
                                                        maxChars: 40,
                                                        replacement: '…',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF2C2C2C),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 14.0
                                                                        : 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 24.0,
                                                                height: 24.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    digiProdContainerCombinedDigitalproductViewRow
                                                                        ?.userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Тренер',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF808080),
                                                                            fontSize:
                                                                                6.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${digiProdContainerCombinedDigitalproductViewRow?.userName} ${digiProdContainerCombinedDigitalproductViewRow?.userSurname}',
                                                                          'Имя Фамилия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 380.0 ? 10.0 : 8.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (functions.isFavouriteDigiProdInList(
                                                                  digiProdBoughtClientDigiprodboughtViewRow
                                                                      .digiprodId!,
                                                                  _model
                                                                      .digiProdFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        while (_model.count4 <
                                                                            _model.digiProdFavourites.length) {
                                                                          if (digiProdBoughtClientDigiprodboughtViewRow.digiprodId ==
                                                                              _model.digiProdFavourites.elementAtOrNull(_model.count4)?.digitalproductId) {
                                                                            _model.removeAtIndexFromDigiProdFavourites(_model.count4);
                                                                            safeSetState(() {});
                                                                            await FavouriteDigiptalroductTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'digitalproduct_id',
                                                                                    digiProdBoughtClientDigiprodboughtViewRow.digiprodId,
                                                                                  ),
                                                                            );
                                                                            _model.count4 =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            break;
                                                                          } else {
                                                                            _model.count4 =
                                                                                _model.count4 + 1;
                                                                            safeSetState(() {});
                                                                          }
                                                                        }
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav2.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (!functions.isFavouriteDigiProdInList(
                                                                  digiProdBoughtClientDigiprodboughtViewRow
                                                                      .digiprodId!,
                                                                  _model
                                                                      .digiProdFavourites
                                                                      .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.newDigiProdResult =
                                                                            await FavouriteDigiptalroductTable().insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'digitalproduct_id':
                                                                              digiProdBoughtClientDigiprodboughtViewRow.digiprodId,
                                                                        });
                                                                        _model.addToDigiProdFavourites(
                                                                            _model.newDigiProdResult!);
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/fav1.svg',
                                                                          width: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          height: MediaQuery.sizeOf(context).width >= 360.0
                                                                              ? 30.0
                                                                              : 25.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          alignment: Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                        ),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
                  model: _model.tapBarClientModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TapBarClientWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
