import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/no_reviews_widget.dart';
import '/components_client/dropdown_client/dropdown_client_widget.dart';
import '/components_client/pop_up_slot_selection/pop_up_slot_selection_widget.dart';
import '/components_client/pop_up_slot_selection_calendar/pop_up_slot_selection_calendar_widget.dart';
import '/components_client/pop_up_training_pokupka/pop_up_training_pokupka_widget.dart';
import '/components_client/tap_bar_client_main_train/tap_bar_client_main_train_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'main_info_training_model.dart';
export 'main_info_training_model.dart';

class MainInfoTrainingWidget extends StatefulWidget {
  const MainInfoTrainingWidget({
    super.key,
    required this.trainingID,
  });

  final int? trainingID;

  static String routeName = 'MainInfoTraining';
  static String routePath = 'mainInfoTraining';

  @override
  State<MainInfoTrainingWidget> createState() => _MainInfoTrainingWidgetState();
}

class _MainInfoTrainingWidgetState extends State<MainInfoTrainingWidget>
    with TickerProviderStateMixin {
  late MainInfoTrainingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainInfoTrainingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Clear TabColor
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      // Query CombinedTrainingsView row
      _model.trainingViewRowQuery =
          await CombinedTrainingsViewTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.trainingID,
        ),
      );
      // Result in → trainingViewRow
      _model.trainingViewRow = _model.trainingViewRowQuery?.firstOrNull;
      safeSetState(() {});
      // Photo Array Query
      _model.photoArrayQuery = await TrainingsMarketTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.trainingID,
        ),
      );
      _model.trainingPhotos = _model.photoArrayQuery!.firstOrNull!.trainingPhoto
          .toList()
          .cast<String>();
      safeSetState(() {});
      // Query Training Favorites
      _model.trainingsFavouritesResult =
          await FavouriteTrainingsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      // SetPage State " Training Favorites''
      _model.trainingFavourites = _model.trainingsFavouritesResult!
          .toList()
          .cast<FavouriteTrainingsRow>();
      safeSetState(() {});
      // Query Training Reviews
      _model.reviewExist = await ReviewsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'review_object_id',
          widget.trainingID,
        ),
      );
      if (_model.reviewExist!.length > 0) {
        // Update Page State "TrainingReviews"
        _model.reviewExists = true;
        safeSetState(() {});
      }
      // Generate Session ID
      _model.sessionID = await actions.generateSessionId();
      // Update generateSessionId
      _model.sessionId = _model.sessionID;
      _model.trainingDetails = widget.trainingID;
      safeSetState(() {});
      // Query for Available Slots
      _model.availableSlotsQuery = await TrainingSlotsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'training_id',
              widget.trainingID,
            )
            .eqOrNull(
              'is_available',
              true,
            )
            .gtOrNull(
              'slot_date',
              supaSerialize<DateTime>(getCurrentTimestamp),
            )
            .order('slot_date', ascending: true)
            .order('start_time', ascending: true),
      );
      // TrainingSlotsRaw Update
      _model.availableSlotsRaw =
          _model.availableSlotsQuery!.toList().cast<TrainingSlotsRow>();
      _model.availableSlotsGrouped =
          _model.availableSlotsQuery!.toList().cast<TrainingSlotsRow>();
      safeSetState(() {});
      // Format Slots For Calendar
      _model.availableSlotsFormattedOUTPUT =
          await actions.formatSlotsForCalendar(
        _model.availableSlotsRaw.toList(),
      );
      // Store in PageState 4
      _model.availableSlotsFormatted = _model.availableSlotsFormattedOUTPUT;
      safeSetState(() {});
      // Query TrainingsBookedTemp
      _model.tempBookingsQuery = await TrainingsBookedTempTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'training_id',
              widget.trainingID,
            )
            .eqOrNull(
              'session_id',
              _model.sessionId,
            ),
      );
      // Store in PageState 4
      _model.tempBookings =
          _model.tempBookingsQuery!.toList().cast<TrainingsBookedTempRow>();
      _model.totalSelected = _model.tempBookings.length;
      _model.selectedSlotsList =
          _model.tempBookings.toList().cast<TrainingsBookedTempRow>();
      safeSetState(() {});
      _model.filteredSlots = await actions.removeBookedSlotsFromAvailableList(
        _model.availableSlotsQuery!.toList(),
        _model.tempBookings.toList(),
      );
      // Store in PageState 7
      _model.availableSlotsGrouped =
          _model.filteredSlots!.toList().cast<TrainingSlotsRow>();
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(115.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF9F5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                          widget.trainingID,
                                        )
                                        .eqOrNull(
                                          'session_id',
                                          _model.sessionId,
                                        ),
                                  );
                                  context.safePop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 60.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.west,
                                          color: Color(0xFFFF740F),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FutureBuilder<List<UserProfileRow>>(
                                    future: UserProfileTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/logomicro.png',
                                          ),
                                        );
                                      }
                                      List<UserProfileRow>
                                          clientContainerUserProfileRowList =
                                          snapshot.data!;

                                      final clientContainerUserProfileRow =
                                          clientContainerUserProfileRowList
                                                  .isNotEmpty
                                              ? clientContainerUserProfileRowList
                                                  .first
                                              : null;

                                      return Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(300.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  // Delete Temp Bookings
                                                  await TrainingsBookedTempTable()
                                                      .delete(
                                                    matchingRows: (rows) => rows
                                                        .eqOrNull(
                                                          'user_id',
                                                          currentUserUid,
                                                        )
                                                        .eqOrNull(
                                                          'training_id',
                                                          widget.trainingID,
                                                        )
                                                        .eqOrNull(
                                                          'session_id',
                                                          _model.sessionId,
                                                        ),
                                                  );

                                                  context.pushNamed(
                                                    ClientChatsWidget.routeName,
                                                    queryParameters: {
                                                      'userID': serializeParam(
                                                        currentUserUid,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/messages.png',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        13.0, 0.0, 0.0, 0.0),
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
                                                    // Delete Temp Bookings
                                                    await TrainingsBookedTempTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows
                                                              .eqOrNull(
                                                                'user_id',
                                                                currentUserUid,
                                                              )
                                                              .eqOrNull(
                                                                'training_id',
                                                                widget
                                                                    .trainingID,
                                                              )
                                                              .eqOrNull(
                                                                'session_id',
                                                                _model
                                                                    .sessionId,
                                                              ),
                                                    );
                                                    await showAlignedDialog(
                                                      context: context,
                                                      isGlobal: false,
                                                      avoidOverflow: true,
                                                      targetAnchor:
                                                          AlignmentDirectional(
                                                                  1.0, 1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      followerAnchor:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      builder: (dialogContext) {
                                                        return Material(
                                                          color: Colors
                                                              .transparent,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                DropdownClientWidget(),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.menu,
                                                    color: Color(0xFF292D32),
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 0.0, 8.0, 0.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        // Delete Temp Bookings
                                                        await TrainingsBookedTempTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    currentUserUid,
                                                                  )
                                                                  .eqOrNull(
                                                                    'training_id',
                                                                    widget
                                                                        .trainingID,
                                                                  )
                                                                  .eqOrNull(
                                                                    'session_id',
                                                                    _model
                                                                        .sessionId,
                                                                  ),
                                                        );

                                                        context.pushNamed(
                                                            ClientProfileWidget
                                                                .routeName);
                                                      },
                                                      child: Container(
                                                        width: 32.0,
                                                        height: 32.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            clientContainerUserProfileRow
                                                                ?.userPhoto,
                                                            'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                            .unreadChatMessages ==
                                                        true)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.7),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .solidCircle,
                                                          color:
                                                              Color(0xFF12B76A),
                                                          size: 8.0,
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 87.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            _model.trainingViewRow?.trainingName,
                            'Нет названия',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFF2C2C2C),
                                fontSize:
                                    MediaQuery.sizeOf(context).width >= 380.0
                                        ? 20.0
                                        : 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                      if (_model.trainingPhotos.length > 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 0.0),
                          child: Container(
                            height: 264.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF9F5),
                            ),
                            child: Builder(
                              builder: (context) {
                                final trainingPtoto =
                                    _model.trainingPhotos.toList();

                                return Container(
                                  width: double.infinity,
                                  height: 500.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: PageView.builder(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          0,
                                                          trainingPtoto.length -
                                                              1))),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: trainingPtoto.length,
                                          itemBuilder:
                                              (context, trainingPtotoIndex) {
                                            final trainingPtotoItem =
                                                trainingPtoto[
                                                    trainingPtotoIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 343.0,
                                                height: 264.0,
                                                decoration: BoxDecoration(),
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 343.0,
                                                        height: 264.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                trainingPtotoItem,
                                                                'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/_training_shadow1.jpg',
                                                              ),
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          children: [
                                                            Opacity(
                                                              opacity: 0.75,
                                                              child: Container(
                                                                width: 343.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFF160E16),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            20.0),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            21.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text:
                                                                    'Тренировки',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          6.0,
                                                                          10.0,
                                                                          6.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xCCFF740F),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if ((valueOrDefault<
                                                                              String>(
                                                                            _model.trainingViewRow?.id.toString(),
                                                                            'Нет имени',
                                                                          ) !=
                                                                          '') &&
                                                                  functions.isFavouriteInList(
                                                                      _model
                                                                          .trainingViewRow!
                                                                          .id!,
                                                                      _model
                                                                          .trainingFavourites
                                                                          .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            10.0,
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
                                                                        while (_model.count <
                                                                            _model.trainingFavourites.length) {
                                                                          if (_model.trainingViewRow?.id ==
                                                                              _model.trainingFavourites.elementAtOrNull(_model.count)?.trainingId) {
                                                                            _model.removeAtIndexFromTrainingFavourites(_model.count);
                                                                            safeSetState(() {});
                                                                            await FavouriteTrainingsTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'training_id',
                                                                                    _model.trainingViewRow?.id,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  ),
                                                                            );
                                                                            _model.count =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            break;
                                                                          } else {
                                                                            _model.count =
                                                                                _model.count + 1;
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
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              30.0,
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
                                                              if ((valueOrDefault<
                                                                              String>(
                                                                            _model.trainingViewRow?.id.toString(),
                                                                            'Нет имени',
                                                                          ) !=
                                                                          '') &&
                                                                  !functions.isFavouriteInList(
                                                                      _model
                                                                          .trainingViewRow!
                                                                          .id!,
                                                                      _model
                                                                          .trainingFavourites
                                                                          .toList()))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            10.0,
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
                                                                          'training_id': _model
                                                                              .trainingViewRow
                                                                              ?.id,
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
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              30.0,
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 16.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(
                                                    initialPage: max(
                                                        0,
                                                        min(
                                                            0,
                                                            trainingPtoto
                                                                    .length -
                                                                1))),
                                            count: trainingPtoto.length,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              safeSetState(() {});
                                            },
                                            effect: smooth_page_indicator
                                                .SlideEffect(
                                              spacing: 6.0,
                                              radius: 100.0,
                                              dotWidth: 10.0,
                                              dotHeight: 10.0,
                                              dotColor: Color(0xFFD9D9D9),
                                              activeDotColor: Color(0xFFFF740F),
                                              paintStyle: PaintingStyle.fill,
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
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PopUpSlotSelectionCalendarWidget(
                                        trainingID: widget.trainingID!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Text(
                              'Стоимость: ${valueOrDefault<String>(
                                _model.trainingViewRow?.trainingPrice
                                    ?.toString(),
                                '0,0',
                              )} ₽',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF2C2C2C),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                360.0
                                            ? 20.0
                                            : 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                // 1.Pop-Up Slot Selection
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: PopUpSlotSelectionWidget(
                                          trainingId: valueOrDefault<int>(
                                            widget.trainingID,
                                            0,
                                          ),
                                          selectedSlots: _model.tempBookings,
                                          availableSlots:
                                              _model.availableSlotsFormatted,
                                          trainerId: _model
                                              .trainingViewRow!.trainerId!,
                                          sessionId: valueOrDefault<String>(
                                            _model.sessionId,
                                            '\'\'',
                                          ),
                                          trainingName: valueOrDefault<String>(
                                            _model
                                                .trainingViewRow?.trainingName,
                                            'Нет названия',
                                          ),
                                          trainingPhoto1:
                                              valueOrDefault<String>(
                                            _model.trainingViewRow
                                                ?.trainingPhoto1,
                                            'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/_training_shadow1.jpg',
                                          ),
                                          trainingPrice: valueOrDefault<int>(
                                            _model
                                                .trainingViewRow?.trainingPrice,
                                            0,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                // Query for Available Slots
                                _model.availableSlotsQuery1 =
                                    await TrainingSlotsTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'training_id',
                                        widget.trainingID,
                                      )
                                      .eqOrNull(
                                        'is_available',
                                        true,
                                      )
                                      .gtOrNull(
                                        'slot_date',
                                        supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                      )
                                      .order('slot_date', ascending: true)
                                      .order('start_time', ascending: true),
                                );
                                // TrainingSlotsRaw Update
                                _model.availableSlotsRaw = _model
                                    .availableSlotsQuery1!
                                    .toList()
                                    .cast<TrainingSlotsRow>();
                                _model.availableSlotsGrouped = _model
                                    .availableSlotsQuery1!
                                    .toList()
                                    .cast<TrainingSlotsRow>();
                                safeSetState(() {});
                                // Format Slots For Calendar
                                _model.availableSlotsFormattedOUT1 =
                                    await actions.formatSlotsForCalendar(
                                  _model.availableSlotsRaw.toList(),
                                );
                                // Store in PageState 4
                                _model.availableSlotsFormatted =
                                    _model.availableSlotsFormattedOUT1;
                                safeSetState(() {});
                                // Query TrainingsBookedTemp
                                _model.tempBookingsQuery1 =
                                    await TrainingsBookedTempTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      )
                                      .eqOrNull(
                                        'training_id',
                                        widget.trainingID,
                                      )
                                      .eqOrNull(
                                        'session_id',
                                        _model.sessionId,
                                      ),
                                );
                                // Store in PageState 4
                                _model.tempBookings = _model.tempBookingsQuery1!
                                    .toList()
                                    .cast<TrainingsBookedTempRow>();
                                _model.totalSelected = valueOrDefault<int>(
                                  _model.tempBookingsQuery1?.length,
                                  0,
                                );
                                _model.selectedSlotsList = _model.tempBookings
                                    .toList()
                                    .cast<TrainingsBookedTempRow>();
                                safeSetState(() {});
                                _model.filteredSlots1 = await actions
                                    .removeBookedSlotsFromAvailableList(
                                  _model.availableSlotsQuery!.toList(),
                                  _model.tempBookings.toList(),
                                );
                                // Store in PageState 7
                                _model.availableSlotsGrouped = _model
                                    .filteredSlots1!
                                    .toList()
                                    .cast<TrainingSlotsRow>();
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/calendar.svg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: GradientText(
                                      'Свободные слоты',
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
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      colors: [
                                        Color(0xFDFF740F),
                                        Color(0xFF7B43CE)
                                      ],
                                      gradientDirection: GradientDirection.ltr,
                                      gradientType: GradientType.linear,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 36.0, 16.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      ClientCoachFullProfileWidget.routeName,
                                      queryParameters: {
                                        'trainerID': serializeParam(
                                          _model.trainingViewRow?.trainerId,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 56.0,
                                        height: 56.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            _model.trainingViewRow?.userPhoto,
                                            'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.5, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Тренер',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF808080),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                '${valueOrDefault<String>(
                                                  _model.trainingViewRow
                                                      ?.userName,
                                                  'Нет имени',
                                                )} ${valueOrDefault<String>(
                                                  _model.trainingViewRow
                                                      ?.userSurname,
                                                  'Нет фамилии',
                                                )}',
                                                'Нет имени',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF2C2C2C),
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
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F4F8),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.descriptionReview = true;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 115.0,
                                                height: 28.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      _model.descriptionReview ==
                                                              true
                                                          ? Colors.white
                                                          : Color(0xFFF1F4F8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                  border: Border.all(
                                                    color:
                                                        _model.descriptionReview ==
                                                                true
                                                            ? Color(0xFFE0E3E7)
                                                            : Color(0xFFF1F4F8),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Описание',
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
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? Color(
                                                                      0xFF14181B)
                                                                  : Color(
                                                                      0xFF57636C),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
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
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.descriptionReview =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 115.0,
                                                height: 28.0,
                                                decoration: BoxDecoration(
                                                  color:
                                                      _model.descriptionReview ==
                                                              false
                                                          ? Colors.white
                                                          : Color(0xFFF1F4F8),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                  border: Border.all(
                                                    color:
                                                        _model.descriptionReview
                                                            ? Color(0xFFE0E3E7)
                                                            : Color(0xFFF1F4F8),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Отзывы',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .plusJakartaSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? Color(
                                                                      0xFF14181B)
                                                                  : Color(
                                                                      0xFF57636C),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation']!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (_model.descriptionReview == true) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          14.0, 12.0, 11.0, 12.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.trainingViewRow
                                              ?.trainingDescription,
                                          'Нет описания',
                                        ),
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
                                              color: Color(0xFF160E16),
                                              fontSize: 16.0,
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
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (_model.allReviews == false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    17.0, 16.0, 16.0, 25.0),
                                            child: FutureBuilder<
                                                List<ReviewViewRow>>(
                                              future: ReviewViewTable()
                                                  .querySingleRow(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'review_object_id',
                                                      widget.trainingID,
                                                    )
                                                    .eqOrNull(
                                                      'review_status',
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
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                11.0,
                                                                13.0,
                                                                16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (valueOrDefault<
                                                            bool>(
                                                          containerReviewViewRow
                                                                          ?.reviewText ==
                                                                      null ||
                                                                  containerReviewViewRow
                                                                          ?.reviewText ==
                                                                      ''
                                                              ? false
                                                              : true,
                                                          false,
                                                        ))
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                "d MMMM y",
                                                                containerReviewViewRow
                                                                    ?.createdAt,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              '.',
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
                                                                      10.0,
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
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .trainingViewRow
                                                                ?.trainingName,
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
                                                                fontSize: 12.0,
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
                                                              'Пока нет ни одного  отзыва',
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
                                                                      16.0,
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
                                                        if (valueOrDefault<
                                                            bool>(
                                                          containerReviewViewRow
                                                                          ?.reviewText ==
                                                                      null ||
                                                                  containerReviewViewRow
                                                                          ?.reviewText ==
                                                                      ''
                                                              ? false
                                                              : true,
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
                                                                      containerReviewViewRow
                                                                          ?.userPhoto,
                                                                      'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=',
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
                                                                      containerReviewViewRow
                                                                          ?.userName,
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
                                        if (_model.allReviews == true)
                                          FutureBuilder<List<ReviewViewRow>>(
                                            future: ReviewViewTable().queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'review_object_id',
                                                    widget.trainingID,
                                                  )
                                                  .eqOrNull(
                                                    'review_status',
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
                                              List<ReviewViewRow>
                                                  reviewListViewReviewViewRowList =
                                                  snapshot.data!;

                                              if (reviewListViewReviewViewRowList
                                                  .isEmpty) {
                                                return NoReviewsWidget();
                                              }

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    reviewListViewReviewViewRowList
                                                        .length,
                                                itemBuilder: (context,
                                                    reviewListViewIndex) {
                                                  final reviewListViewReviewViewRow =
                                                      reviewListViewReviewViewRowList[
                                                          reviewListViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                17.0,
                                                                16.0,
                                                                16.0,
                                                                25.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFF9F5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    11.0,
                                                                    13.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  "d MMMM y",
                                                                  reviewListViewReviewViewRow
                                                                      .createdAt,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                '.',
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
                                                                    fontSize:
                                                                        10.0,
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                _model
                                                                    .trainingViewRow
                                                                    ?.trainingName,
                                                                'Нет названия',
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
                                                                    color: Color(
                                                                        0xFF2C2C2C),
                                                                    fontSize:
                                                                        12.0,
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
                                                                  reviewListViewReviewViewRow
                                                                      .reviewText,
                                                                  'Пока нет ги одного отзыва.',
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
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF160E16),
                                                                      fontSize:
                                                                          16.0,
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
                                                                    height:
                                                                        35.0,
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
                                                                        reviewListViewReviewViewRow
                                                                            .userPhoto,
                                                                        'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=',
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
                                                                        reviewListViewReviewViewRow
                                                                            .userName,
                                                                        'Нет имени',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.readexPro(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                            if ((_model.allReviews == true) &&
                                                _model.reviewExists)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 29.0),
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
                                                    _model.allReviews = false;
                                                    safeSetState(() {});
                                                  },
                                                  child: GradientText(
                                                    'Скрыть ↑',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                            if ((_model.allReviews == false) &&
                                                _model.reviewExists)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 29.0),
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
                                                    _model.allReviews = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: GradientText(
                                                    'Смотреть все отзывы ↓',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_model.totalSelected! > 0)
                        Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 11.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 14.0),
                                        child: GradientText(
                                          'Выбрано слотов:  ${valueOrDefault<String>(
                                            _model.totalSelected?.toString(),
                                            '0',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF160E16),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          colors: [
                                            Color(0xFDFF740F),
                                            Color(0xFF7B43CE)
                                          ],
                                          gradientDirection:
                                              GradientDirection.ltr,
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
                                      final selectedSlotsListQuery =
                                          _model.tempBookings.toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            selectedSlotsListQuery.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 8.0),
                                        itemBuilder: (context,
                                            selectedSlotsListQueryIndex) {
                                          final selectedSlotsListQueryItem =
                                              selectedSlotsListQuery[
                                                  selectedSlotsListQueryIndex];
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
                                                      selectedSlotsListQueryItem
                                                          .slotStartDatetime,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    '01.01.2026',
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
                                                        fontSize: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width >=
                                                                380.0
                                                            ? 10.0
                                                            : 8.0,
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
                                              if (selectedSlotsListQueryItem
                                                      .slotStartDatetime !=
                                                  null)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Удалить слот:'),
                                                                    content: Text(
                                                                        dateTimeFormat(
                                                                      "HH:mm dd.MM.yyyy",
                                                                      selectedSlotsListQueryItem
                                                                          .slotStartDatetime!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Нет'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
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
                                                        await TrainingsBookedTempTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) => rows
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    currentUserUid,
                                                                  )
                                                                  .eqOrNull(
                                                                    'id',
                                                                    selectedSlotsListQueryItem
                                                                        .id,
                                                                  ),
                                                        );
                                                        // Query TrainingsBookedTemp
                                                        _model.tempBookingsQueryDel =
                                                            await TrainingsBookedTempTable()
                                                                .queryRows(
                                                          queryFn: (q) => q
                                                              .eqOrNull(
                                                                'user_id',
                                                                currentUserUid,
                                                              )
                                                              .eqOrNull(
                                                                'training_id',
                                                                widget
                                                                    .trainingID,
                                                              )
                                                              .eqOrNull(
                                                                'session_id',
                                                                _model
                                                                    .sessionId,
                                                              ),
                                                        );
                                                        _shouldSetState = true;
                                                        // Store in PageState 4
                                                        _model.tempBookings = _model
                                                            .tempBookingsQueryDel!
                                                            .toList()
                                                            .cast<
                                                                TrainingsBookedTempRow>();
                                                        _model.totalSelected =
                                                            _model
                                                                .tempBookingsQueryDel
                                                                ?.length;
                                                        _model.selectedSlotsList =
                                                            _model.tempBookings
                                                                .toList()
                                                                .cast<
                                                                    TrainingsBookedTempRow>();
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
                                                    text:
                                                        '${valueOrDefault<String>(
                                                      functions.utcToMoscowTime(
                                                          selectedSlotsListQueryItem
                                                              .slotStartDatetime),
                                                      '00:00',
                                                    )}   X',
                                                    options: FFButtonOptions(
                                                      width: 68.0,
                                                      height: 30.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF7B43CE),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFFFFF9F5),
                                                                fontSize:
                                                                    MediaQuery.sizeOf(context).width >=
                                                                            380.0
                                                                        ? 10.0
                                                                        : 8.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF7B43CE),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
                                                ),
                                              Text(
                                                '${selectedSlotsListQueryItem.slotDuration?.toString()} минут',
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
                                                      fontSize: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width >=
                                                              380.0
                                                          ? 10.0
                                                          : 8.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 14.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GradientText(
                                        'Итого:  ${valueOrDefault<String>(
                                          _model.totalSelected?.toString(),
                                          '0',
                                        )} X ${_model.trainingViewRow?.trainingPrice?.toString()} ₽',
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
                                        colors: [
                                          Color(0xFDFF740F),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 6.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GradientText(
                                        'К оплате:  ',
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
                                        colors: [
                                          Color(0xFDFF740F),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      ),
                                      GradientText(
                                        '${valueOrDefault<String>(
                                          (valueOrDefault<int>(
                                                    _model.trainingViewRow
                                                        ?.trainingPrice,
                                                    0,
                                                  ) *
                                                  valueOrDefault<int>(
                                                    _model.totalSelected,
                                                    0,
                                                  ))
                                              .toString(),
                                          '5000',
                                        )} ₽',
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
                                              fontSize: 16.0,
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
                                        colors: [
                                          Color(0xFF160E16),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 20.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        // Is there unpaid Slots for the Training?
                                        _model.trainingsSelected =
                                            await TrainingsBookedTempTable()
                                                .queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'user_id',
                                                currentUserUid,
                                              )
                                              .eqOrNull(
                                                'training_id',
                                                widget.trainingID,
                                              )
                                              .gtOrNull(
                                                'slot_start_datetime',
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                              ),
                                        );
                                        _shouldSetState = true;
                                        if (_model.trainingsSelected!.length >
                                            0) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      PopUpTrainingPokupkaWidget(
                                                    trainingId:
                                                        valueOrDefault<int>(
                                                      _model
                                                          .trainingViewRow?.id,
                                                      0,
                                                    ),
                                                    trainingName: _model
                                                        .trainingViewRow!
                                                        .trainingName!,
                                                    trainingPrice: _model
                                                        .trainingViewRow!
                                                        .trainingPrice!,
                                                    trainingPhoto1: _model
                                                        .trainingViewRow!
                                                        .trainingPhoto1!,
                                                    trainerId: _model
                                                        .trainingViewRow!
                                                        .trainerId!,
                                                    sessionId:
                                                        valueOrDefault<String>(
                                                      _model.sessionId,
                                                      '\'\'',
                                                    ),
                                                    slotCount:
                                                        valueOrDefault<int>(
                                                      _model.totalSelected,
                                                      0,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Выбор свободных слотов'),
                                                content: Text(
                                                    'Нужно выбрать хотя-бы один'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).width >=
                                                    380.0
                                                ? 48.0
                                                : 42.0,
                                        constraints: BoxConstraints(
                                          minWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          maxWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF7B43CE),
                                              Color(0xFFFF740F)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                0.69, -1.0),
                                            end: AlignmentDirectional(
                                                -0.69, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 15.0, 0.0),
                                              child: Text(
                                                'Купить тренировку → ',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width >=
                                                                  380.0
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
                    ].addToEnd(SizedBox(height: 150.0)),
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
                    model: _model.tapBarClientMainTrainModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TapBarClientMainTrainWidget(
                      trainingId: widget.trainingID!,
                      sessionId: valueOrDefault<String>(
                        _model.sessionId,
                        '\'\'',
                      ),
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
