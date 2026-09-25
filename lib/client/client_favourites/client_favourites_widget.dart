import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_favourites_widget.dart';
import '/components_client/app_bar_user_favuorites/app_bar_user_favuorites_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_favourites_model.dart';
export 'client_favourites_model.dart';

class ClientFavouritesWidget extends StatefulWidget {
  const ClientFavouritesWidget({super.key});

  static String routeName = 'ClientFavourites';
  static String routePath = 'clientFavourites';

  @override
  State<ClientFavouritesWidget> createState() => _ClientFavouritesWidgetState();
}

class _ClientFavouritesWidgetState extends State<ClientFavouritesWidget> {
  late ClientFavouritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientFavouritesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 3;
      safeSetState(() {});
      _model.trainingFavouritesResult =
          await FavouriteTrainingsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.trainingFavourites = _model.trainingFavouritesResult!
          .toList()
          .cast<FavouriteTrainingsRow>();
      safeSetState(() {});
      // Action favourite_training_plans
      _model.trainingPlanFavouritesResult =
          await FavouriteTrainingPlansTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.trainingPlanFavourites = _model.trainingPlanFavouritesResult!
          .toList()
          .cast<FavouriteTrainingPlansRow>();
      safeSetState(() {});
      // Action favourite_nutritionplan
      _model.nutritionPlanFavouritesResult =
          await FavouriteNutritionplanTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.nutritionPlanFavourites = _model.nutritionPlanFavouritesResult!
          .toList()
          .cast<FavouriteNutritionplanRow>();
      safeSetState(() {});
      // Action favourite_digiptalroduct
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
                model: _model.appBarUserFavuoritesModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarUserFavuoritesWidget(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Тренировки',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: FutureBuilder<List<FavouriteTrainingsRow>>(
                                future: (_model.requestCompleter4 ??=
                                        Completer<List<FavouriteTrainingsRow>>()
                                          ..complete(FavouriteTrainingsTable()
                                              .queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                )
                                                .order('created_at'),
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<FavouriteTrainingsRow>
                                      trainingListViewFavouriteTrainingsRowList =
                                      snapshot.data!;

                                  if (trainingListViewFavouriteTrainingsRowList
                                      .isEmpty) {
                                    return NoFavouritesWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        trainingListViewFavouriteTrainingsRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, trainingListViewIndex) {
                                      final trainingListViewFavouriteTrainingsRow =
                                          trainingListViewFavouriteTrainingsRowList[
                                              trainingListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FutureBuilder<
                                            List<CombinedTrainingsViewRow>>(
                                          future: CombinedTrainingsViewTable()
                                              .querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              trainingListViewFavouriteTrainingsRow
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
                                                trainingContainerCombinedTrainingsViewRowList =
                                                snapshot.data!;

                                            final trainingContainerCombinedTrainingsViewRow =
                                                trainingContainerCombinedTrainingsViewRowList
                                                        .isNotEmpty
                                                    ? trainingContainerCombinedTrainingsViewRowList
                                                        .first
                                                    : null;

                                            return Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 343.0,
                                                maxHeight: 125.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2F4F5),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Visibility(
                                                visible:
                                                    trainingContainerCombinedTrainingsViewRow
                                                            ?.id !=
                                                        null,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
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
                                                          context.pushNamed(
                                                            MainInfoTrainingWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'trainingID':
                                                                  serializeParam(
                                                                trainingListViewFavouriteTrainingsRow
                                                                    .trainingId,
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            minWidth: 130.0,
                                                            minHeight: 110.0,
                                                            maxWidth: 150.0,
                                                            maxHeight: 110.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                trainingContainerCombinedTrainingsViewRow
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
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          56.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xCCFF740F),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Тренировки',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 8.0 : 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          "dd.MM.yyyy HH:mm",
                                                                          trainingListViewFavouriteTrainingsRow
                                                                              .createdAt,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '12.12.2024',
                                                                      ),
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
                                                                                Color(0xFF7B43CE),
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    trainingContainerCombinedTrainingsViewRow
                                                                        ?.trainingName,
                                                                    ' Нет названия',
                                                                  ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        45,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2C2C2C),
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 12.0
                                                                            : 10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxHeight: 65.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                24.0,
                                                                            height:
                                                                                24.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                trainingContainerCombinedTrainingsViewRow?.userPhoto,
                                                                                'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                              ),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              2.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Тренер',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF808080),
                                                                                      fontSize: 6.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  '${valueOrDefault<String>(
                                                                                    trainingContainerCombinedTrainingsViewRow?.userName,
                                                                                    'Нет имени',
                                                                                  )} ${valueOrDefault<String>(
                                                                                    trainingContainerCombinedTrainingsViewRow?.userSurname,
                                                                                    'Нет фамилии',
                                                                                  )}',
                                                                                  'Имя Фамилия',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF2C2C2C),
                                                                                      fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 10.0 : 8.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                overflow: TextOverflow.ellipsis,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if ((trainingContainerCombinedTrainingsViewRow?.id !=
                                                                              null) &&
                                                                          functions.isFavouriteInList(
                                                                              trainingContainerCombinedTrainingsViewRow!.id!,
                                                                              _model.trainingFavourites.toList()))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Удалить из избранного'),
                                                                                        content: Text(trainingContainerCombinedTrainingsViewRow.trainingName!),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('Нет'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('Да'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (!confirmDialogResponse) {
                                                                                return;
                                                                              }
                                                                              while (_model.countTrainFav < _model.trainingFavourites.length) {
                                                                                if (trainingContainerCombinedTrainingsViewRow.id == _model.trainingFavourites.elementAtOrNull(_model.countTrainFav)?.trainingId) {
                                                                                  _model.removeAtIndexFromTrainingFavourites(_model.countTrainFav);
                                                                                  safeSetState(() {});
                                                                                  await FavouriteTrainingsTable().delete(
                                                                                    matchingRows: (rows) => rows
                                                                                        .eqOrNull(
                                                                                          'training_id',
                                                                                          trainingContainerCombinedTrainingsViewRow.id,
                                                                                        )
                                                                                        .eqOrNull(
                                                                                          'user_id',
                                                                                          currentUserUid,
                                                                                        ),
                                                                                  );
                                                                                  _model.countTrainFav = 0;
                                                                                  safeSetState(() {});
                                                                                  safeSetState(() => _model.requestCompleter4 = null);
                                                                                  await _model.waitForRequestCompleted4();
                                                                                  break;
                                                                                } else {
                                                                                  _model.countTrainFav = _model.countTrainFav + 1;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              }
                                                                            },
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                              child: SvgPicture.asset(
                                                                                'assets/images/fav2.svg',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Планы тренировок',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: FutureBuilder<
                                  List<FavouriteTrainingPlansRow>>(
                                future: (_model.requestCompleter3 ??= Completer<
                                        List<FavouriteTrainingPlansRow>>()
                                      ..complete(FavouriteTrainingPlansTable()
                                          .queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'user_id',
                                              currentUserUid,
                                            )
                                            .order('created_at'),
                                      )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<FavouriteTrainingPlansRow>
                                      trainingPlanListViewFavouriteTrainingPlansRowList =
                                      snapshot.data!;

                                  if (trainingPlanListViewFavouriteTrainingPlansRowList
                                      .isEmpty) {
                                    return NoFavouritesWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        trainingPlanListViewFavouriteTrainingPlansRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, trainingPlanListViewIndex) {
                                      final trainingPlanListViewFavouriteTrainingPlansRow =
                                          trainingPlanListViewFavouriteTrainingPlansRowList[
                                              trainingPlanListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FutureBuilder<
                                            List<CombinedTrainingplansViewRow>>(
                                          future:
                                              CombinedTrainingplansViewTable()
                                                  .querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              trainingPlanListViewFavouriteTrainingPlansRow
                                                  .trainingplanId,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Image.asset(
                                                'assets/images/logo.png',
                                              );
                                            }
                                            List<CombinedTrainingplansViewRow>
                                                trainingPlanContainerCombinedTrainingplansViewRowList =
                                                snapshot.data!;

                                            final trainingPlanContainerCombinedTrainingplansViewRow =
                                                trainingPlanContainerCombinedTrainingplansViewRowList
                                                        .isNotEmpty
                                                    ? trainingPlanContainerCombinedTrainingplansViewRowList
                                                        .first
                                                    : null;

                                            return Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 343.0,
                                                maxHeight: 125.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2F4F5),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Visibility(
                                                visible:
                                                    trainingPlanContainerCombinedTrainingplansViewRow
                                                            ?.id !=
                                                        null,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
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
                                                          context.pushNamed(
                                                            MainInfoTrainingPlanWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'productID':
                                                                  serializeParam(
                                                                trainingPlanContainerCombinedTrainingplansViewRow
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                              'productName':
                                                                  serializeParam(
                                                                trainingPlanContainerCombinedTrainingplansViewRow
                                                                    ?.trainingPlanName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'productPrice':
                                                                  serializeParam(
                                                                trainingPlanContainerCombinedTrainingplansViewRow
                                                                    ?.trainingPlanPrice,
                                                                ParamType.int,
                                                              ),
                                                              'productType':
                                                                  serializeParam(
                                                                'План тренировки',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'productPhoto1':
                                                                  serializeParam(
                                                                trainingPlanContainerCombinedTrainingplansViewRow
                                                                    ?.trainingPlanPhoto1,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            minWidth: 130.0,
                                                            minHeight: 110.0,
                                                            maxWidth: 150.0,
                                                            maxHeight: 110.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                trainingPlanContainerCombinedTrainingplansViewRow
                                                                    ?.trainingPlanPhoto1,
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
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          80.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xCCFF740F),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'План тренировки',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 8.0 : 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          "dd.MM.yyyy HH:mm",
                                                                          trainingPlanListViewFavouriteTrainingPlansRow
                                                                              .createdAt,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '01.01.2025',
                                                                      ),
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
                                                                                Color(0xFF7B43CE),
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    trainingPlanContainerCombinedTrainingplansViewRow
                                                                        ?.trainingPlanName,
                                                                    ' Нет названия',
                                                                  ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        45,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2C2C2C),
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 12.0
                                                                            : 10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxHeight: 65.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Flexible(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              24.0,
                                                                          height:
                                                                              24.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              trainingPlanContainerCombinedTrainingplansViewRow?.userPhoto,
                                                                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Тренер',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF808080),
                                                                                    fontSize: 6.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                '${valueOrDefault<String>(
                                                                                  trainingPlanContainerCombinedTrainingplansViewRow?.userName,
                                                                                  'Нет имени',
                                                                                )} ${valueOrDefault<String>(
                                                                                  trainingPlanContainerCombinedTrainingplansViewRow?.userSurname,
                                                                                  'Нет фамилии',
                                                                                )}',
                                                                                'Нет имени',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF2C2C2C),
                                                                                    fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 10.0 : 8.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    if ((trainingPlanContainerCombinedTrainingplansViewRow?.id !=
                                                                            null) &&
                                                                        functions.isFavouriteTrainingPlanInList(
                                                                            trainingPlanContainerCombinedTrainingplansViewRow!.id!,
                                                                            _model.trainingPlanFavourites.toList()))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            5.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Удалить из избранного'),
                                                                                      content: Text(trainingPlanContainerCombinedTrainingplansViewRow.trainingPlanName!),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                          child: Text('Нет'),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                          child: Text('Да'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              while (_model.countTrainPlanFav < _model.trainingPlanFavourites.length) {
                                                                                if (trainingPlanContainerCombinedTrainingplansViewRow.id == _model.trainingPlanFavourites.elementAtOrNull(_model.countTrainPlanFav)?.trainingplanId) {
                                                                                  _model.removeAtIndexFromTrainingPlanFavourites(_model.countTrainPlanFav);
                                                                                  safeSetState(() {});
                                                                                  await FavouriteTrainingPlansTable().delete(
                                                                                    matchingRows: (rows) => rows
                                                                                        .eqOrNull(
                                                                                          'trainingplan_id',
                                                                                          trainingPlanContainerCombinedTrainingplansViewRow.id,
                                                                                        )
                                                                                        .eqOrNull(
                                                                                          'user_id',
                                                                                          currentUserUid,
                                                                                        ),
                                                                                  );
                                                                                  _model.countTrainPlanFav = 0;
                                                                                  safeSetState(() {});
                                                                                  safeSetState(() => _model.requestCompleter3 = null);
                                                                                  await _model.waitForRequestCompleted3();
                                                                                  break;
                                                                                } else {
                                                                                  _model.countTrainPlanFav = _model.countTrainPlanFav + 1;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              }
                                                                              return;
                                                                            } else {
                                                                              return;
                                                                            }
                                                                          },
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/images/fav2.svg',
                                                                              width: 30.0,
                                                                              height: 30.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
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
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Планы питания',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: FutureBuilder<
                                  List<FavouriteNutritionplanRow>>(
                                future: (_model.requestCompleter1 ??= Completer<
                                        List<FavouriteNutritionplanRow>>()
                                      ..complete(FavouriteNutritionplanTable()
                                          .queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'user_id',
                                              currentUserUid,
                                            )
                                            .order('created_at'),
                                      )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<FavouriteNutritionplanRow>
                                      nutritionPlanListViewFavouriteNutritionplanRowList =
                                      snapshot.data!;

                                  if (nutritionPlanListViewFavouriteNutritionplanRowList
                                      .isEmpty) {
                                    return NoFavouritesWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        nutritionPlanListViewFavouriteNutritionplanRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, nutritionPlanListViewIndex) {
                                      final nutritionPlanListViewFavouriteNutritionplanRow =
                                          nutritionPlanListViewFavouriteNutritionplanRowList[
                                              nutritionPlanListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FutureBuilder<
                                            List<
                                                CombinedNutritionplansViewRow>>(
                                          future:
                                              CombinedNutritionplansViewTable()
                                                  .querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              nutritionPlanListViewFavouriteNutritionplanRow
                                                  .nutritionplanId,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Image.asset(
                                                'assets/images/logo.png',
                                              );
                                            }
                                            List<CombinedNutritionplansViewRow>
                                                nutritionPlanContainerCombinedNutritionplansViewRowList =
                                                snapshot.data!;

                                            final nutritionPlanContainerCombinedNutritionplansViewRow =
                                                nutritionPlanContainerCombinedNutritionplansViewRowList
                                                        .isNotEmpty
                                                    ? nutritionPlanContainerCombinedNutritionplansViewRowList
                                                        .first
                                                    : null;

                                            return Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 343.0,
                                                maxHeight: 125.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2F4F5),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Visibility(
                                                visible:
                                                    nutritionPlanContainerCombinedNutritionplansViewRow
                                                            ?.id !=
                                                        null,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
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
                                                          context.pushNamed(
                                                            MainInfoNutritionPlanWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'productID':
                                                                  serializeParam(
                                                                nutritionPlanContainerCombinedNutritionplansViewRow
                                                                    ?.id,
                                                                ParamType.int,
                                                              ),
                                                              'productType':
                                                                  serializeParam(
                                                                'План питания',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'productName':
                                                                  serializeParam(
                                                                nutritionPlanContainerCombinedNutritionplansViewRow
                                                                    ?.nutritionPlanName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'productPrice':
                                                                  serializeParam(
                                                                nutritionPlanContainerCombinedNutritionplansViewRow
                                                                    ?.nutritionPlanPrice,
                                                                ParamType.int,
                                                              ),
                                                              'productPhoto1':
                                                                  serializeParam(
                                                                nutritionPlanContainerCombinedNutritionplansViewRow
                                                                    ?.nutritionPlanPhoto1,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            minWidth: 130.0,
                                                            minHeight: 110.0,
                                                            maxWidth: 150.0,
                                                            maxHeight: 110.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                nutritionPlanContainerCombinedNutritionplansViewRow
                                                                    ?.nutritionPlanPhoto1,
                                                                'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/nutritiop_plan1.jpg',
                                                              ),
                                                              fit: BoxFit.fill,
                                                              cacheWidth: 130,
                                                              cacheHeight: 100,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          66.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xCCFF740F),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'План питания',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 8.0 : 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          "dd.MM.yyyy HH:mm",
                                                                          nutritionPlanListViewFavouriteNutritionplanRow
                                                                              .createdAt,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '12.12.2024',
                                                                      ),
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
                                                                                Color(0xFF7B43CE),
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    nutritionPlanContainerCombinedNutritionplansViewRow
                                                                        ?.nutritionPlanName,
                                                                    ' Нет названия',
                                                                  ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        45,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2C2C2C),
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 12.0
                                                                            : 10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxHeight: 65.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Container(
                                                                                width: 24.0,
                                                                                height: 24.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    nutritionPlanContainerCombinedNutritionplansViewRow?.userPhoto,
                                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                                  ),
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Тренер',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF808080),
                                                                                          fontSize: 6.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      '${valueOrDefault<String>(
                                                                                        nutritionPlanContainerCombinedNutritionplansViewRow?.userName,
                                                                                        'Нет имени',
                                                                                      )} ${valueOrDefault<String>(
                                                                                        nutritionPlanContainerCombinedNutritionplansViewRow?.userSurname,
                                                                                        'Нет фамилии',
                                                                                      )}',
                                                                                      'Имя Фамилия',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF2C2C2C),
                                                                                          fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 10.0 : 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if ((nutritionPlanContainerCombinedNutritionplansViewRow?.id !=
                                                                              null) &&
                                                                          functions.isFavouriteNutritionPlanInList(
                                                                              nutritionPlanContainerCombinedNutritionplansViewRow!.id!,
                                                                              _model.nutritionPlanFavourites.toList()))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Удалить из избранного'),
                                                                                        content: Text(nutritionPlanContainerCombinedNutritionplansViewRow.nutritionPlanName!),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('Нет'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('Да'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (!confirmDialogResponse) {
                                                                                return;
                                                                              }
                                                                              while (_model.countNutrPlanFav < _model.nutritionPlanFavourites.length) {
                                                                                if (nutritionPlanContainerCombinedNutritionplansViewRow.id == _model.nutritionPlanFavourites.elementAtOrNull(_model.countNutrPlanFav)?.nutritionplanId) {
                                                                                  _model.removeAtIndexFromNutritionPlanFavourites(_model.countNutrPlanFav);
                                                                                  safeSetState(() {});
                                                                                  await FavouriteNutritionplanTable().delete(
                                                                                    matchingRows: (rows) => rows
                                                                                        .eqOrNull(
                                                                                          'nutritionplan_id',
                                                                                          nutritionPlanContainerCombinedNutritionplansViewRow.id,
                                                                                        )
                                                                                        .eqOrNull(
                                                                                          'user_id',
                                                                                          currentUserUid,
                                                                                        ),
                                                                                  );
                                                                                  _model.countNutrPlanFav = 0;
                                                                                  safeSetState(() {});
                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                  await _model.waitForRequestCompleted1();
                                                                                  break;
                                                                                } else {
                                                                                  _model.countNutrPlanFav = _model.countNutrPlanFav + 1;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              }
                                                                            },
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                              child: SvgPicture.asset(
                                                                                'assets/images/fav2.svg',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.cover,
                                                                                alignment: Alignment(0.0, 0.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Цифровые продукты',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 11.0, 0.0, 0.0),
                              child: FutureBuilder<
                                  List<FavouriteDigiptalroductRow>>(
                                future: (_model.requestCompleter2 ??= Completer<
                                        List<FavouriteDigiptalroductRow>>()
                                      ..complete(FavouriteDigiptalroductTable()
                                          .queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'user_id',
                                              currentUserUid,
                                            )
                                            .order('created_at'),
                                      )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<FavouriteDigiptalroductRow>
                                      digiProdListViewFavouriteDigiptalroductRowList =
                                      snapshot.data!;

                                  if (digiProdListViewFavouriteDigiptalroductRowList
                                      .isEmpty) {
                                    return NoFavouritesWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        digiProdListViewFavouriteDigiptalroductRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, digiProdListViewIndex) {
                                      final digiProdListViewFavouriteDigiptalroductRow =
                                          digiProdListViewFavouriteDigiptalroductRowList[
                                              digiProdListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FutureBuilder<
                                            List<
                                                CombinedDigitalproductViewRow>>(
                                          future:
                                              CombinedDigitalproductViewTable()
                                                  .querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              digiProdListViewFavouriteDigiptalroductRow
                                                  .digitalproductId,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Image.asset(
                                                'assets/images/logo.png',
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
                                                maxHeight: 120.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2F4F5),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Visibility(
                                                visible:
                                                    digiProdContainerCombinedDigitalproductViewRow
                                                            ?.id !=
                                                        null,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
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
                                                          context.pushNamed(
                                                            MainInfoDigitalProductWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'productID':
                                                                  serializeParam(
                                                                digiProdListViewFavouriteDigiptalroductRow
                                                                    .digitalproductId,
                                                                ParamType.int,
                                                              ),
                                                              'productName':
                                                                  serializeParam(
                                                                digiProdContainerCombinedDigitalproductViewRow
                                                                    ?.digitalProductName,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'productPrice':
                                                                  serializeParam(
                                                                digiProdContainerCombinedDigitalproductViewRow
                                                                    ?.digitalProductPrice,
                                                                ParamType.int,
                                                              ),
                                                              'productType':
                                                                  serializeParam(
                                                                'Цифровой продукт',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'productPhoto1':
                                                                  serializeParam(
                                                                digiProdContainerCombinedDigitalproductViewRow
                                                                    ?.digitalProductPhoto1,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            minWidth: 130.0,
                                                            minHeight: 110.0,
                                                            maxWidth: 150.0,
                                                            maxHeight: 110.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                digiProdContainerCombinedDigitalproductViewRow
                                                                    ?.digitalProductPhoto1,
                                                                'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/DigiProd1.jpg',
                                                              ),
                                                              fit: BoxFit.fill,
                                                              cacheWidth: 130,
                                                              cacheHeight: 100,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          80.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xCCFF740F),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Цифровой продукт',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 8.0 : 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          "dd.MM.yyyy HH:mm",
                                                                          digiProdListViewFavouriteDigiptalroductRow
                                                                              .createdAt,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        '12.12.2024',
                                                                      ),
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
                                                                                Color(0xFF7B43CE),
                                                                            fontSize:
                                                                                8.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    digiProdContainerCombinedDigitalproductViewRow
                                                                        ?.digitalProductName,
                                                                    ' Нет названия',
                                                                  ).maybeHandleOverflow(
                                                                    maxChars:
                                                                        45,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2C2C2C),
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 12.0
                                                                            : 10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Container(
                                                                                width: 24.0,
                                                                                height: 24.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    digiProdContainerCombinedDigitalproductViewRow?.userPhoto,
                                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                                  ),
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Тренер',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF808080),
                                                                                          fontSize: 6.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      '${valueOrDefault<String>(
                                                                                        digiProdContainerCombinedDigitalproductViewRow?.userName,
                                                                                        'Нет имени',
                                                                                      )} ${valueOrDefault<String>(
                                                                                        digiProdContainerCombinedDigitalproductViewRow?.userSurname,
                                                                                        'Нет фамилии',
                                                                                      )}',
                                                                                      'Имя Фамилия',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: Color(0xFF2C2C2C),
                                                                                          fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 10.0 : 8.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if ((digiProdContainerCombinedDigitalproductViewRow?.id !=
                                                                              null) &&
                                                                          functions.isFavouriteDigiProdInList(
                                                                              digiProdContainerCombinedDigitalproductViewRow!.id!,
                                                                              _model.digiProdFavourites.toList()))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                5.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Удалить из избранного'),
                                                                                          content: Text(digiProdContainerCombinedDigitalproductViewRow.digitalProductName!),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('Нет'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('Да'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (!confirmDialogResponse) {
                                                                                  return;
                                                                                }
                                                                                while (_model.countDigiProdFav < _model.digiProdFavourites.length) {
                                                                                  if (digiProdContainerCombinedDigitalproductViewRow.id == _model.digiProdFavourites.elementAtOrNull(_model.countDigiProdFav)?.digitalproductId) {
                                                                                    _model.removeAtIndexFromDigiProdFavourites(_model.countDigiProdFav);
                                                                                    safeSetState(() {});
                                                                                    await FavouriteDigiptalroductTable().delete(
                                                                                      matchingRows: (rows) => rows
                                                                                          .eqOrNull(
                                                                                            'digitalproduct_id',
                                                                                            digiProdContainerCombinedDigitalproductViewRow.id,
                                                                                          )
                                                                                          .eqOrNull(
                                                                                            'user_id',
                                                                                            currentUserUid,
                                                                                          ),
                                                                                    );
                                                                                    _model.countDigiProdFav = 0;
                                                                                    safeSetState(() {});
                                                                                    safeSetState(() => _model.requestCompleter2 = null);
                                                                                    await _model.waitForRequestCompleted2();
                                                                                    break;
                                                                                  } else {
                                                                                    _model.countDigiProdFav = _model.countDigiProdFav + 1;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/fav2.svg',
                                                                                  width: 30.0,
                                                                                  height: 30.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
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
    );
  }
}
