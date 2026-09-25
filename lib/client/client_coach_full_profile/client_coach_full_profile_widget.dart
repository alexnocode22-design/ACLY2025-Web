import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_reviews_widget.dart';
import '/components/no_trainings_widget.dart';
import '/components_client/app_bar_main_draft_full_profile/app_bar_main_draft_full_profile_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'client_coach_full_profile_model.dart';
export 'client_coach_full_profile_model.dart';

class ClientCoachFullProfileWidget extends StatefulWidget {
  const ClientCoachFullProfileWidget({
    super.key,
    required this.trainerID,
  });

  final String? trainerID;

  static String routeName = 'ClientCoachFullProfile';
  static String routePath = 'clientCoachFullProfile';

  @override
  State<ClientCoachFullProfileWidget> createState() =>
      _ClientCoachFullProfileWidgetState();
}

class _ClientCoachFullProfileWidgetState
    extends State<ClientCoachFullProfileWidget> {
  late ClientCoachFullProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientCoachFullProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      // QueryTrainings
      _model.queryTrainingsResult = await TrainingsMarketTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'trainer_id',
          widget.trainerID,
        ),
      );
      _model.nolReviews =
          _model.queryTrainingsResult!.length > 0 ? true : false;
      safeSetState(() {});
      _model.trainingFavouritesResult =
          await FavouriteTrainingsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.trainingsFavourites = _model.trainingFavouritesResult!
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
      _model.trainingPlansFavourites = _model.trainingPlanFavouritesResult!
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
      _model.nutritionPlansFavourites = _model.nutritionPlanFavouritesResult!
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

    return FutureBuilder<List<CombinedUserTrainerViewRow>>(
      future: CombinedUserTrainerViewTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'trainer_id',
          widget.trainerID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFFFF9F5),
            body: Image.asset(
              'assets/images/logo.png',
            ),
          );
        }
        List<CombinedUserTrainerViewRow>
            clientCoachFullProfileCombinedUserTrainerViewRowList =
            snapshot.data!;

        final clientCoachFullProfileCombinedUserTrainerViewRow =
            clientCoachFullProfileCombinedUserTrainerViewRowList.isNotEmpty
                ? clientCoachFullProfileCombinedUserTrainerViewRowList.first
                : null;

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
                    model: _model.appBarMainDraftFullProfileModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppBarMainDraftFullProfileWidget(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 17.0, 16.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 200.0,
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<
                                          List<CombinedTrainingsViewRow>>(
                                        future: CombinedTrainingsViewTable()
                                            .queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'trainer_id',
                                                widget.trainerID,
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
                                          List<CombinedTrainingsViewRow>
                                              pageViewCombinedTrainingsViewRowList =
                                              snapshot.data!;

                                          return Container(
                                            width: double.infinity,
                                            child: Stack(
                                              children: [
                                                PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  pageViewCombinedTrainingsViewRowList
                                                                          .length -
                                                                      1))),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      pageViewCombinedTrainingsViewRowList
                                                          .length,
                                                  itemBuilder:
                                                      (context, pageViewIndex) {
                                                    final pageViewCombinedTrainingsViewRow =
                                                        pageViewCombinedTrainingsViewRowList[
                                                            pageViewIndex];
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          pageViewCombinedTrainingsViewRow
                                                              .trainingPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/shadow_training.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 9.0),
                                                    child: smooth_page_indicator
                                                        .SmoothPageIndicator(
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: max(
                                                                  0,
                                                                  min(
                                                                      0,
                                                                      pageViewCombinedTrainingsViewRowList
                                                                              .length -
                                                                          1))),
                                                      count:
                                                          pageViewCombinedTrainingsViewRowList
                                                              .length,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) async {
                                                        await _model
                                                            .pageViewController!
                                                            .animateToPage(
                                                          i,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve: Curves.ease,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      effect:
                                                          smooth_page_indicator
                                                              .SlideEffect(
                                                        spacing: 6.0,
                                                        radius: 16.0,
                                                        dotWidth: 10.0,
                                                        dotHeight: 10.0,
                                                        dotColor:
                                                            Color(0xFFD9D9D9),
                                                        activeDotColor:
                                                            Color(0xFFFF740F),
                                                        paintStyle:
                                                            PaintingStyle.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 19.0, 20.0, 12.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                clientCoachFullProfileCombinedUserTrainerViewRow
                                                                    ?.userPhoto,
                                                                'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                                  .unreadChatMessages ==
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          80.0,
                                                                          80.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons.circle,
                                                                color: Color(
                                                                    0xFF1B8E11),
                                                                size: 12.0,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .solidStar,
                                                            color: Color(
                                                                0xFF7B43CE),
                                                            size: 12.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                clientCoachFullProfileCombinedUserTrainerViewRow
                                                                    ?.trainerRating
                                                                    ?.toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 12.0
                                                                        : 10.0,
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          '${clientCoachFullProfileCombinedUserTrainerViewRow?.userName} ${clientCoachFullProfileCombinedUserTrainerViewRow?.userSurname}',
                                                          'Не указано',
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
                                                                      0xFF090A0A),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 16.0
                                                                          : 14.0,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidCheckCircle,
                                                          color:
                                                              Color(0xFF0097F1),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        clientCoachFullProfileCombinedUserTrainerViewRow
                                                            ?.trainerSpecs,
                                                        'Не указана',
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
                                                                    0xFF72777A),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 14.0
                                                                        : 12.0,
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
                                                ],
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  41.0, 31.0, 0.0, 0.0),
                              child: Text(
                                'О тренере',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF475467),
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  380.0
                                              ? 16.0
                                              : 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  41.0, 13.0, 23.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  clientCoachFullProfileCombinedUserTrainerViewRow
                                      ?.trainerDescription,
                                  'Нет описания',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF475467),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      50.0, 31.0, 50.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.chatWithTrainerExist =
                                          await ChatsTable().queryRows(
                                        queryFn: (q) => q
                                            .containsOrNull(
                                              'chat_members',
                                              '{${clientCoachFullProfileCombinedUserTrainerViewRow?.userId}}',
                                            )
                                            .containsOrNull(
                                              'chat_members',
                                              '{${currentUserUid}}',
                                            ),
                                      );
                                      if (_model.chatWithTrainerExist!.length >
                                          0) {
                                        FFAppState().chatUserName =
                                            clientCoachFullProfileCombinedUserTrainerViewRow!
                                                .userName!;
                                        safeSetState(() {});

                                        context.pushNamed(
                                          ClientChatWithTrainerWidget.routeName,
                                          queryParameters: {
                                            'chatID': serializeParam(
                                              _model.chatWithTrainerExist
                                                  ?.firstOrNull?.id,
                                              ParamType.int,
                                            ),
                                            'chatMembers': serializeParam(
                                              _model.chatWithTrainerExist
                                                  ?.firstOrNull?.chatMembers,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.chatWithTrainerCreated =
                                            await ChatsTable().insert({
                                          'chat_members': (String user,
                                                  String trainer) {
                                            return [user] + [trainer];
                                          }(
                                              currentUserUid,
                                              clientCoachFullProfileCombinedUserTrainerViewRow!
                                                  .userId!),
                                        });

                                        context.pushNamed(
                                          ClientChatWithTrainerWidget.routeName,
                                          queryParameters: {
                                            'chatID': serializeParam(
                                              _model.chatWithTrainerCreated?.id,
                                              ParamType.int,
                                            ),
                                            'chatMembers': serializeParam(
                                              _model.chatWithTrainerCreated
                                                  ?.chatMembers,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF7B43CE),
                                            Color(0xFFFF740F)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.69, -1.0),
                                          end: AlignmentDirectional(-0.69, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/messages-2.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Сообщение тренеру',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width >=
                                                              380.0
                                                          ? 16.0
                                                          : 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                            if (valueOrDefault<bool>(
                              clientCoachFullProfileCombinedUserTrainerViewRow
                                          ?.trainerVideo !=
                                      null &&
                                  clientCoachFullProfileCombinedUserTrainerViewRow
                                          ?.trainerVideo !=
                                      '',
                              false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    41.0, 41.0, 0.0, 2.0),
                                child: Text(
                                  'Видеовизитка',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF475467),
                                        fontSize:
                                            MediaQuery.sizeOf(context).width >=
                                                    380.0
                                                ? 16.0
                                                : 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            if (valueOrDefault<bool>(
                              clientCoachFullProfileCombinedUserTrainerViewRow
                                          ?.trainerVideo !=
                                      null &&
                                  clientCoachFullProfileCombinedUserTrainerViewRow
                                          ?.trainerVideo !=
                                      '',
                              false,
                            ))
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.27,
                                  child: custom_widgets.AclyVideoPlayer(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.27,
                                    videoUrl: valueOrDefault<String>(
                                      clientCoachFullProfileCombinedUserTrainerViewRow
                                          ?.trainerVideo,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/VideoVisitCard.mp4',
                                    ),
                                    videoType: 'network',
                                    autoPlay: false,
                                    showControls: true,
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
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
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  380.0
                                              ? 20.0
                                              : 18.0,
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
                                  List<CombinedTrainingsViewFixRow>>(
                                future:
                                    CombinedTrainingsViewFixTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'trainer_id',
                                    widget.trainerID,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<CombinedTrainingsViewFixRow>
                                      trainingsListViewCombinedTrainingsViewFixRowList =
                                      snapshot.data!;

                                  if (trainingsListViewCombinedTrainingsViewFixRowList
                                      .isEmpty) {
                                    return NoTrainingsWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        trainingsListViewCombinedTrainingsViewFixRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, trainingsListViewIndex) {
                                      final trainingsListViewCombinedTrainingsViewFixRow =
                                          trainingsListViewCombinedTrainingsViewFixRowList[
                                              trainingsListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 343.0,
                                            maxHeight: 125.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F4F5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
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
                                                          trainingsListViewCombinedTrainingsViewFixRow
                                                              .id,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: 150.0,
                                                      minHeight: 110.0,
                                                      maxWidth: 150.0,
                                                      maxHeight: 110.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          trainingsListViewCombinedTrainingsViewFixRow
                                                              .trainingPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/shadow_training.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                          5.0,
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
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Тренировки',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 8.0
                                                                            : 6.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
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
                                                                      4.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              trainingsListViewCombinedTrainingsViewFixRow
                                                                  .trainingName,
                                                              'Нет названия',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 45,
                                                              replacement: '…',
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
                                                                      0xFF2C2C2C),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 12.0
                                                                          : 10.0,
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
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
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          trainingsListViewCombinedTrainingsViewFixRow
                                                                              .userPhoto,
                                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
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
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF808080),
                                                                              fontSize: 8.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${trainingsListViewCombinedTrainingsViewFixRow.userName} ${trainingsListViewCombinedTrainingsViewFixRow.userSurname}',
                                                                          'Не указано',
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
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
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
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (functions.isFavouriteInList(
                                                                          trainingsListViewCombinedTrainingsViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .trainingsFavourites
                                                                              .toList()))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                while (_model.count1 < _model.trainingsFavourites.length) {
                                                                                  if (trainingsListViewCombinedTrainingsViewFixRow.id == _model.trainingsFavourites.elementAtOrNull(_model.count1)?.trainingId) {
                                                                                    _model.removeAtIndexFromTrainingsFavourites(_model.count1);
                                                                                    safeSetState(() {});
                                                                                    await FavouriteTrainingsTable().delete(
                                                                                      matchingRows: (rows) => rows
                                                                                          .eqOrNull(
                                                                                            'training_id',
                                                                                            trainingsListViewCombinedTrainingsViewFixRow.id,
                                                                                          )
                                                                                          .eqOrNull(
                                                                                            'user_id',
                                                                                            currentUserUid,
                                                                                          ),
                                                                                    );
                                                                                    _model.count1 = 0;
                                                                                    safeSetState(() {});
                                                                                    break;
                                                                                  } else {
                                                                                    _model.count1 = _model.count1 + 1;
                                                                                    safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: ClipRRect(
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
                                                                        ),
                                                                      if (!functions.isFavouriteInList(
                                                                          trainingsListViewCombinedTrainingsViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .trainingsFavourites
                                                                              .toList()))
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
                                                                                _model.newFavoriteTrainingResult = await FavouriteTrainingsTable().insert({
                                                                                  'user_id': currentUserUid,
                                                                                  'training_id': trainingsListViewCombinedTrainingsViewFixRow.id,
                                                                                });
                                                                                _model.addToTrainingsFavourites(_model.newFavoriteTrainingResult!);

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/fav1.svg',
                                                                                  width: 30.0,
                                                                                  height: 30.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
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
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
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
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  380.0
                                              ? 20.0
                                              : 18.0,
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
                                  List<CombinedTrainingplansViewFixRow>>(
                                future: CombinedTrainingplansViewFixTable()
                                    .queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'trainer_id',
                                    widget.trainerID,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<CombinedTrainingplansViewFixRow>
                                      trainingPlansListViewCombinedTrainingplansViewFixRowList =
                                      snapshot.data!;

                                  if (trainingPlansListViewCombinedTrainingplansViewFixRowList
                                      .isEmpty) {
                                    return NoTrainingsWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        trainingPlansListViewCombinedTrainingplansViewFixRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, trainingPlansListViewIndex) {
                                      final trainingPlansListViewCombinedTrainingplansViewFixRow =
                                          trainingPlansListViewCombinedTrainingplansViewFixRowList[
                                              trainingPlansListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 343.0,
                                            maxHeight: 125.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F4F5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
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
                                                          trainingPlansListViewCombinedTrainingplansViewFixRow
                                                              .id,
                                                          ParamType.int,
                                                        ),
                                                        'productName':
                                                            serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            trainingPlansListViewCombinedTrainingplansViewFixRow
                                                                .trainingPlanName,
                                                            'Нет названия',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'productPrice':
                                                            serializeParam(
                                                          valueOrDefault<int>(
                                                            trainingPlansListViewCombinedTrainingplansViewFixRow
                                                                .trainingPlanPrice,
                                                            0,
                                                          ),
                                                          ParamType.int,
                                                        ),
                                                        'productType':
                                                            serializeParam(
                                                          'План тренировки',
                                                          ParamType.String,
                                                        ),
                                                        'productPhoto1':
                                                            serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            trainingPlansListViewCombinedTrainingplansViewFixRow
                                                                .trainingPlanPhoto1,
                                                            'Нет фото',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: 150.0,
                                                      minHeight: 110.0,
                                                      maxWidth: 150.0,
                                                      maxHeight: 110.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          trainingPlansListViewCombinedTrainingplansViewFixRow
                                                              .trainingPlanPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/training_plan1.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 80.0,
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
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'План тренировки',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 8.0
                                                                            : 6.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
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
                                                                      4.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              trainingPlansListViewCombinedTrainingplansViewFixRow
                                                                  .trainingPlanName,
                                                              'Нет названия',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 45,
                                                              replacement: '…',
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
                                                                      0xFF2C2C2C),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 12.0
                                                                          : 10.0,
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        trainingPlansListViewCombinedTrainingplansViewFixRow
                                                                            .userPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Тренер',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF808080),
                                                                                fontSize: 8.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${trainingPlansListViewCombinedTrainingplansViewFixRow.userName} ${trainingPlansListViewCombinedTrainingplansViewFixRow.userSurname}',
                                                                          'Не указано',
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
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
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
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (functions.isFavouriteTrainingPlanInList(
                                                                          trainingPlansListViewCombinedTrainingplansViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .trainingPlansFavourites
                                                                              .toList()))
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
                                                                                while (_model.count2 < _model.trainingPlansFavourites.length) {
                                                                                  if (trainingPlansListViewCombinedTrainingplansViewFixRow.id == _model.trainingPlansFavourites.elementAtOrNull(_model.count2)?.trainingplanId) {
                                                                                    _model.removeAtIndexFromTrainingPlansFavourites(_model.count2);
                                                                                    safeSetState(() {});
                                                                                    await FavouriteTrainingPlansTable().delete(
                                                                                      matchingRows: (rows) => rows
                                                                                          .eqOrNull(
                                                                                            'trainingplan_id',
                                                                                            trainingPlansListViewCombinedTrainingplansViewFixRow.id,
                                                                                          )
                                                                                          .eqOrNull(
                                                                                            'user_id',
                                                                                            currentUserUid,
                                                                                          ),
                                                                                    );
                                                                                    _model.count2 = 0;
                                                                                    safeSetState(() {});
                                                                                    return;
                                                                                  } else {
                                                                                    _model.count2 = _model.count2 + 1;
                                                                                    safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: ClipRRect(
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
                                                                        ),
                                                                      if (!functions.isFavouriteTrainingPlanInList(
                                                                          trainingPlansListViewCombinedTrainingplansViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .trainingPlansFavourites
                                                                              .toList()))
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
                                                                                _model.newFavoriteTrainingPlanResult = await FavouriteTrainingPlansTable().insert({
                                                                                  'user_id': currentUserUid,
                                                                                  'trainingplan_id': trainingPlansListViewCombinedTrainingplansViewFixRow.id,
                                                                                });
                                                                                _model.addToTrainingPlansFavourites(_model.newFavoriteTrainingPlanResult!);
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/fav1.svg',
                                                                                  width: 30.0,
                                                                                  height: 30.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
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
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
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
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  380.0
                                              ? 20.0
                                              : 18.0,
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
                                  List<CombinedNutritionplansViewFixRow>>(
                                future: CombinedNutritionplansViewFixTable()
                                    .queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'trainer_id',
                                    widget.trainerID,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<CombinedNutritionplansViewFixRow>
                                      nutritionPlansListViewCombinedNutritionplansViewFixRowList =
                                      snapshot.data!;

                                  if (nutritionPlansListViewCombinedNutritionplansViewFixRowList
                                      .isEmpty) {
                                    return NoTrainingsWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        nutritionPlansListViewCombinedNutritionplansViewFixRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, nutritionPlansListViewIndex) {
                                      final nutritionPlansListViewCombinedNutritionplansViewFixRow =
                                          nutritionPlansListViewCombinedNutritionplansViewFixRowList[
                                              nutritionPlansListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 343.0,
                                            maxHeight: 125.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F4F5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
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
                                                          nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                              .id,
                                                          ParamType.int,
                                                        ),
                                                        'productType':
                                                            serializeParam(
                                                          'План питания',
                                                          ParamType.String,
                                                        ),
                                                        'productName':
                                                            serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                                .nutritionPlanName,
                                                            'Нет названия',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'productPrice':
                                                            serializeParam(
                                                          valueOrDefault<int>(
                                                            nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                                .nutritionPlanPrice,
                                                            0,
                                                          ),
                                                          ParamType.int,
                                                        ),
                                                        'productPhoto1':
                                                            serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                                .nutritionPlanPhoto1,
                                                            'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/nutritiop_plan-defaul1t.jpg',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: 150.0,
                                                      minHeight: 110.0,
                                                      maxWidth: 150.0,
                                                      maxHeight: 110.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                              .nutritionPlanPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/nutritiop_plan1.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                          5.0,
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
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'План питания',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                360.0
                                                                            ? 8.0
                                                                            : 6.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
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
                                                                      4.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                                  .nutritionPlanName,
                                                              'Нет названия',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 45,
                                                              replacement: '…',
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
                                                                      0xFF2C2C2C),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 12.0
                                                                          : 10.0,
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
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                                            .userPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Тренер',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF808080),
                                                                                fontSize: 8.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${nutritionPlansListViewCombinedNutritionplansViewFixRow.userName} ${nutritionPlansListViewCombinedNutritionplansViewFixRow.userSurname}',
                                                                          'Не указано',
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
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
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
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (functions.isFavouriteNutritionPlanInList(
                                                                          nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .nutritionPlansFavourites
                                                                              .toList()))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                6.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                while (_model.count3 < _model.nutritionPlansFavourites.length) {
                                                                                  if (nutritionPlansListViewCombinedNutritionplansViewFixRow.id == _model.nutritionPlansFavourites.elementAtOrNull(_model.count3)?.nutritionplanId) {
                                                                                    _model.removeAtIndexFromNutritionPlansFavourites(_model.count3);
                                                                                    safeSetState(() {});
                                                                                    await FavouriteNutritionplanTable().delete(
                                                                                      matchingRows: (rows) => rows
                                                                                          .eqOrNull(
                                                                                            'nutritionplan_id',
                                                                                            nutritionPlansListViewCombinedNutritionplansViewFixRow.id,
                                                                                          )
                                                                                          .eqOrNull(
                                                                                            'user_id',
                                                                                            currentUserUid,
                                                                                          ),
                                                                                    );
                                                                                    _model.count3 = 0;
                                                                                    safeSetState(() {});
                                                                                    break;
                                                                                  } else {
                                                                                    _model.count3 = _model.count3 + 1;
                                                                                    safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: ClipRRect(
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
                                                                        ),
                                                                      if (!functions.isFavouriteNutritionPlanInList(
                                                                          nutritionPlansListViewCombinedNutritionplansViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .nutritionPlansFavourites
                                                                              .toList()))
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
                                                                                _model.newFavoriteNutritionPlanResult = await FavouriteNutritionplanTable().insert({
                                                                                  'user_id': currentUserUid,
                                                                                  'nutritionplan_id': nutritionPlansListViewCombinedNutritionplansViewFixRow.id,
                                                                                });
                                                                                _model.addToNutritionPlansFavourites(_model.newFavoriteNutritionPlanResult!);
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/fav1.svg',
                                                                                  width: 30.0,
                                                                                  height: 30.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
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
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 40.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
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
                                          fontSize: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  380.0
                                              ? 20.0
                                              : 18.0,
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
                                  List<CombinedDigitalproductViewFixRow>>(
                                future: CombinedDigitalproductViewFixTable()
                                    .queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'trainer_id',
                                    widget.trainerID,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<CombinedDigitalproductViewFixRow>
                                      digiProdListViewCombinedDigitalproductViewFixRowList =
                                      snapshot.data!;

                                  if (digiProdListViewCombinedDigitalproductViewFixRowList
                                      .isEmpty) {
                                    return NoTrainingsWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        digiProdListViewCombinedDigitalproductViewFixRowList
                                            .length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 12.0),
                                    itemBuilder:
                                        (context, digiProdListViewIndex) {
                                      final digiProdListViewCombinedDigitalproductViewFixRow =
                                          digiProdListViewCombinedDigitalproductViewFixRowList[
                                              digiProdListViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: 343.0,
                                            maxHeight: 125.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F4F5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
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
                                                          digiProdListViewCombinedDigitalproductViewFixRow
                                                              .id,
                                                          ParamType.int,
                                                        ),
                                                        'productName':
                                                            serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            digiProdListViewCombinedDigitalproductViewFixRow
                                                                .digitalProductName,
                                                            'Нет названия',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                        'productPrice':
                                                            serializeParam(
                                                          valueOrDefault<int>(
                                                            digiProdListViewCombinedDigitalproductViewFixRow
                                                                .digitalProductPrice,
                                                            0,
                                                          ),
                                                          ParamType.int,
                                                        ),
                                                        'productType':
                                                            serializeParam(
                                                          'Цифровой продукт',
                                                          ParamType.String,
                                                        ),
                                                        'productPhoto1':
                                                            serializeParam(
                                                          valueOrDefault<
                                                              String>(
                                                            digiProdListViewCombinedDigitalproductViewFixRow
                                                                .digitalProductPhoto1,
                                                            'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/DigiProd3.jpg',
                                                          ),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: 150.0,
                                                      minHeight: 110.0,
                                                      maxWidth: 150.0,
                                                      maxHeight: 110.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          digiProdListViewCombinedDigitalproductViewFixRow
                                                              .digitalProductPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/DigiProd1.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
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
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 80.0,
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
                                                              'Цифровой продукт',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                                    fontSize: MediaQuery.sizeOf(context).width >=
                                                                            360.0
                                                                        ? 8.0
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
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          digiProdListViewCombinedDigitalproductViewFixRow
                                                              .digitalProductName,
                                                          'Нет названия',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 45,
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
                                                                          ? 12.0
                                                                          : 10.0,
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Container(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        digiProdListViewCombinedDigitalproductViewFixRow
                                                                            .userPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          2.0,
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
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Тренер',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF808080),
                                                                                fontSize: 8.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          '${digiProdListViewCombinedDigitalproductViewFixRow.userName} ${digiProdListViewCombinedDigitalproductViewFixRow.userSurname}',
                                                                          'Не указано',
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
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
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
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (functions.isFavouriteDigiProdInList(
                                                                          digiProdListViewCombinedDigitalproductViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .digiProdFavourites
                                                                              .toList()))
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
                                                                                while (_model.count4 < _model.digiProdFavourites.length) {
                                                                                  if (digiProdListViewCombinedDigitalproductViewFixRow.id == _model.digiProdFavourites.elementAtOrNull(_model.count4)?.digitalproductId) {
                                                                                    _model.removeAtIndexFromDigiProdFavourites(_model.count4);
                                                                                    safeSetState(() {});
                                                                                    await FavouriteDigiptalroductTable().delete(
                                                                                      matchingRows: (rows) => rows
                                                                                          .eqOrNull(
                                                                                            'digitalproduct_id',
                                                                                            digiProdListViewCombinedDigitalproductViewFixRow.id,
                                                                                          )
                                                                                          .eqOrNull(
                                                                                            'user_id',
                                                                                            currentUserUid,
                                                                                          ),
                                                                                    );
                                                                                    _model.count4 = 0;
                                                                                    safeSetState(() {});
                                                                                    break;
                                                                                  } else {
                                                                                    _model.count4 = _model.count4 + 1;
                                                                                    safeSetState(() {});
                                                                                    return;
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: ClipRRect(
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
                                                                        ),
                                                                      if (!functions.isFavouriteDigiProdInList(
                                                                          digiProdListViewCombinedDigitalproductViewFixRow
                                                                              .id!,
                                                                          _model
                                                                              .digiProdFavourites
                                                                              .toList()))
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
                                                                                _model.newFavoriteDigiProdResult = await FavouriteDigiptalroductTable().insert({
                                                                                  'user_id': currentUserUid,
                                                                                  'digitalproduct_id': digiProdListViewCombinedDigitalproductViewFixRow.id,
                                                                                });
                                                                                _model.addToDigiProdFavourites(_model.newFavoriteDigiProdResult!);
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/fav1.svg',
                                                                                  width: 30.0,
                                                                                  height: 30.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
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
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 26.0, 0.0, 26.0),
                                      child: Text(
                                        'Отзывы о продуктах',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width >=
                                                          380.0
                                                      ? 24.0
                                                      : 22.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    if (_model.allReviews == true)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  17.0, 0.0, 16.0, 12.0),
                                          child: FutureBuilder<
                                              List<ReviewViewRow>>(
                                            future: ReviewViewTable()
                                                .querySingleRow(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'trainer_id',
                                                    widget.trainerID,
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
                                              List<ReviewViewRow>
                                                  containerReviewViewRowList =
                                                  snapshot.data!;

                                              final containerReviewViewRow =
                                                  containerReviewViewRowList
                                                          .isNotEmpty
                                                      ? containerReviewViewRowList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFF9F5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 11.0,
                                                          13.0, 16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (!valueOrDefault<bool>(
                                                        true,
                                                        false,
                                                      ))
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "d MMMM y",
                                                              clientCoachFullProfileCombinedUserTrainerViewRow
                                                                  ?.createdAt,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '01 января 2024',
                                                          ),
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
                                                                color: Color(
                                                                    0xFF525252),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 10.0
                                                                        : 8.0,
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
                                                      if (!valueOrDefault<bool>(
                                                        true,
                                                        false,
                                                      ))
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerReviewViewRow
                                                                ?.reviewObjectName,
                                                            'Нет названия',
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
                                                                    0xFF2C2C2C),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 12.0
                                                                        : 10.0,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            containerReviewViewRow
                                                                ?.reviewText,
                                                            'Пока нет ни одного отзыва',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                                color: Color(
                                                                    0xFF160E16),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 16.0
                                                                        : 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!valueOrDefault<bool>(
                                                        true,
                                                        false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 35.0,
                                                                height: 35.0,
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
                                                                    containerReviewViewRow
                                                                        ?.userPhoto,
                                                                    'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=',
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
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    containerReviewViewRow
                                                                        ?.userName,
                                                                    'Нет имени',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .readexPro(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2C2C2C),
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                380.0
                                                                            ? 14.0
                                                                            : 12.0,
                                                                        letterSpacing:
                                                                            0.0,
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
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (_model.allReviews == false)
                                      FutureBuilder<List<ReviewViewRow>>(
                                        future: ReviewViewTable().queryRows(
                                          queryFn: (q) => q.eqOrNull(
                                            'trainer_id',
                                            widget.trainerID,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Image.asset(
                                              'assets/images/logo.png',
                                            );
                                          }
                                          List<ReviewViewRow>
                                              listViewReviewViewRowList =
                                              snapshot.data!;

                                          if (listViewReviewViewRowList
                                              .isEmpty) {
                                            return NoReviewsWidget();
                                          }

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listViewReviewViewRowList
                                                .length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 12.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewReviewViewRow =
                                                  listViewReviewViewRowList[
                                                      listViewIndex];
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          17.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFF9F5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  13.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        11.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  "dMMMMy",
                                                                  listViewReviewViewRow
                                                                      .createdAt,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                '01 января 2024',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                                        0xFF525252),
                                                                    fontSize: MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 10.0
                                                                        : 8.0,
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
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewReviewViewRow
                                                                  .reviewObjectName,
                                                              'Нет названия',
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
                                                                      0xFF2C2C2C),
                                                                  fontSize:
                                                                      MediaQuery.sizeOf(context).width >=
                                                                              380.0
                                                                          ? 12.0
                                                                          : 10.0,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewReviewViewRow
                                                                    .reviewText,
                                                                'Нет отзыва',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                                    color: Color(
                                                                        0xFF160E16),
                                                                    fontSize: MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 16.0
                                                                        : 14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewReviewViewRow
                                                                          .userPhoto,
                                                                      'https://toolset.com/wp-content/uploads/2018/06/909657-profile_pic.png',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewReviewViewRow
                                                                          .userName,
                                                                      'Нет имени',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF2C2C2C),
                                                                          fontSize: MediaQuery.sizeOf(context).width >= 380.0
                                                                              ? 14.0
                                                                              : 12.0,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if ((_model.allReviews == false) &&
                                            _model.nolReviews)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 29.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.allReviews = true;
                                                safeSetState(() {});
                                              },
                                              child: GradientText(
                                                'Скрыть ↑',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width >=
                                                                  360.0
                                                              ? 16.0
                                                              : 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                colors: [
                                                  Color(0xFDFF740F),
                                                  Color(0xFF7B43CE)
                                                ],
                                                gradientDirection:
                                                    GradientDirection.ltr,
                                                gradientType:
                                                    GradientType.linear,
                                              ),
                                            ),
                                          ),
                                        if ((_model.allReviews == true) &&
                                            !_model.nolReviews)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 29.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.allReviews = false;
                                                safeSetState(() {});
                                              },
                                              child: GradientText(
                                                'Смотреть все отзывы ↓',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width >=
                                                                  360.0
                                                              ? 16.0
                                                              : 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                colors: [
                                                  Color(0xFDFF740F),
                                                  Color(0xFF7B43CE)
                                                ],
                                                gradientDirection:
                                                    GradientDirection.ltr,
                                                gradientType:
                                                    GradientType.linear,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 150.0)),
                        ),
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
      },
    );
  }
}
