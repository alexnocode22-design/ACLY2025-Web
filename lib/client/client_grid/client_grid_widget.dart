import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_user_main/app_bar_user_main_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'client_grid_model.dart';
export 'client_grid_model.dart';

class ClientGridWidget extends StatefulWidget {
  const ClientGridWidget({
    super.key,
    required this.page,
  });

  final String? page;

  static String routeName = 'ClientGrid';
  static String routePath = 'clientGrid';

  @override
  State<ClientGridWidget> createState() => _ClientGridWidgetState();
}

class _ClientGridWidgetState extends State<ClientGridWidget> {
  late ClientGridModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientGridModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      // Action favourite_trainings
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

    _model.searchProductsTextController ??= TextEditingController();
    _model.searchProductsFocusNode ??= FocusNode();

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
                model: _model.appBarUserMainModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarUserMainWidget(),
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
                            16.0, 19.0, 16.0, 0.0),
                        child: TextFormField(
                          controller: _model.searchProductsTextController,
                          focusNode: _model.searchProductsFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchProductsTextController',
                            Duration(milliseconds: 2000),
                            () async {
                              _model.isSearching = true;
                              _model.term =
                                  _model.searchProductsTextController.text;
                              safeSetState(() {});
                              safeSetState(
                                  () => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                              _model.isSearching = false;
                              safeSetState(() {});
                            },
                          ),
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F4F5),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF090A0A),
                            ),
                            suffixIcon: _model.searchProductsTextController!
                                    .text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.searchProductsTextController
                                          ?.clear();
                                      _model.isSearching = true;
                                      _model.term = _model
                                          .searchProductsTextController.text;
                                      safeSetState(() {});
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                      _model.isSearching = false;
                                      safeSetState(() {});
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF090A0A),
                                      size: 25.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
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
                          validator: _model
                              .searchProductsTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 22.0, 0.0, 0.0),
                          child: FlutterFlowChoiceChips(
                            options: [
                              ChipData('Тренировки'),
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
                              [widget.page!],
                            ),
                            wrapped: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF2EA),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Новые тренеры',
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
                                            color: Color(0xFF090A0A),
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width >=
                                                    360.0
                                                ? 16.0
                                                : 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
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
                                          context.pushNamed(
                                              ClientCoachesWidget.routeName);
                                        },
                                        child: Container(
                                          width: 106.0,
                                          height: 24.0,
                                          constraints: BoxConstraints(
                                            minWidth: 64.0,
                                            minHeight: 24.0,
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
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    'Все тренеры →',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width >=
                                                                  360.0
                                                              ? 12.0
                                                              : 10.0,
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
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF2EA),
                        ),
                        child: FutureBuilder<List<CombinedUserTrainerViewRow>>(
                          future: CombinedUserTrainerViewTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'trainer_active',
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
                            List<CombinedUserTrainerViewRow>
                                newTrainersListViewCombinedUserTrainerViewRowList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  newTrainersListViewCombinedUserTrainerViewRowList
                                      .length,
                              itemBuilder: (context, newTrainersListViewIndex) {
                                final newTrainersListViewCombinedUserTrainerViewRow =
                                    newTrainersListViewCombinedUserTrainerViewRowList[
                                        newTrainersListViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 0.0, 12.0),
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
                                            newTrainersListViewCombinedUserTrainerViewRow
                                                .trainerId,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 243.0,
                                        maxHeight: 64.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 6.0, 0.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        newTrainersListViewCombinedUserTrainerViewRow
                                                            .userPhoto,
                                                        'https://media.istockphoto.com/id/1495088043/vector/user-profile-icon-avatar-or-person-icon-profile-picture-portrait-symbol-default-portrait.jpg?s=612x612&w=0&k=20&c=dhV2p1JwmloBTOaGAtaA3AW1KSnjsdMt7-U_3EZElZ0=',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          '${newTrainersListViewCombinedUserTrainerViewRow.userName} ${newTrainersListViewCombinedUserTrainerViewRow.userSurname}',
                                                          'Имя Фамилия',
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
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        newTrainersListViewCombinedUserTrainerViewRow
                                                            .trainerSpecs,
                                                        'Специализация',
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
                                                                        ? 12.0
                                                                        : 10.0,
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
                      ),
                      if (_model.choiceChipsValue == 'Тренировки')
                        FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(
                                        AclyTablesGroup.trainingSearchCall.call(
                                      term: _model.term,
                                      limit: _model.limit,
                                    )))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Image.asset(
                                'assets/images/logo.png',
                              );
                            }
                            final searchResultTrainingsListViewTrainingSearchResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final searchTrainings =
                                    (searchResultTrainingsListViewTrainingSearchResponse
                                                    .jsonBody
                                                    .toList()
                                                    .map<TrainingsDataStruct?>(
                                                        TrainingsDataStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<
                                                    TrainingsDataStruct?>)
                                            .withoutNulls
                                            .where((e) =>
                                                (e.trainingPublish == true) &&
                                                (e.trainingStatus == true) &&
                                                (e.trainerActive == true))
                                            .toList()
                                            .toList() ??
                                        [];

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: searchTrainings.length,
                                  itemBuilder: (context, searchTrainingsIndex) {
                                    final searchTrainingsItem =
                                        searchTrainings[searchTrainingsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.0, 16.0, 0.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    MainInfoTrainingWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'trainingID':
                                                          serializeParam(
                                                        searchTrainingsItem.id,
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
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          searchTrainingsItem
                                                              .trainingPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/shadow_training.jpg',
                                                        ),
                                                        fit: BoxFit.fitHeight,
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
                                                        10.0, 0.0, 0.0, 2.0),
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
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: 'Тренировки',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 105.0,
                                                              height: 20.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xCCFF740F),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                380.0
                                                                            ? 6.0
                                                                            : 5.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
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
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          searchTrainingsItem
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
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
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
                                                                  width: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
                                                                  height: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
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
                                                                      searchTrainingsItem
                                                                          .userPhoto,
                                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank_avatar.jpg',
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
                                                                              fontSize: 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                              searchTrainingsItem.userName,
                                                                              'Нет имени',
                                                                            )} ${valueOrDefault<String>(
                                                                              searchTrainingsItem.userSurname,
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
                                                                                fontSize: MediaQuery.sizeOf(context).width >= 360.0 ? 10.0 : 8.0,
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
                                                    Row(
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
                                                                  searchTrainingsItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                          if (searchTrainingsItem.id ==
                                                                              _model.trainingFavourites.elementAtOrNull(_model.count1)?.trainingId) {
                                                                            _model.removeAtIndexFromTrainingFavourites(_model.count1);
                                                                            safeSetState(() {});
                                                                            await FavouriteTrainingsTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'training_id',
                                                                                    searchTrainingsItem.id,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  ),
                                                                            );
                                                                            _model.count1 =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            return;
                                                                          } else {
                                                                            _model.count1 =
                                                                                _model.count1 + 1;
                                                                            safeSetState(() {});
                                                                            return;
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
                                                                  searchTrainingsItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                              searchTrainingsItem.id,
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
                                                  ],
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
                            );
                          },
                        ),
                      if (_model.choiceChipsValue == 'Планы питания')
                        FutureBuilder<ApiCallResponse>(
                          future: AclyTablesGroup.nutritionPlansSearchCall.call(
                            term: _model.searchProductsTextController.text,
                            limit: _model.limit,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Image.asset(
                                'assets/images/logo.png',
                              );
                            }
                            final searchResultNutritionPlansListViewNutritionPlansSearchResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final searchNutrition =
                                    (searchResultNutritionPlansListViewNutritionPlansSearchResponse
                                                    .jsonBody
                                                    .toList()
                                                    .map<NutritionDataStruct?>(
                                                        NutritionDataStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<
                                                    NutritionDataStruct?>)
                                            .withoutNulls
                                            .where((e) =>
                                                (e.nutritionPlanStatus ==
                                                    true) &&
                                                (e.nutritionPlanPublish ==
                                                    true) &&
                                                (e.trainerActive == true))
                                            .toList()
                                            .toList() ??
                                        [];

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: searchNutrition.length,
                                  itemBuilder: (context, searchNutritionIndex) {
                                    final searchNutritionItem =
                                        searchNutrition[searchNutritionIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.0, 16.0, 0.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    MainInfoNutritionPlanWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'productID':
                                                          serializeParam(
                                                        searchNutritionItem.id,
                                                        ParamType.int,
                                                      ),
                                                      'productType':
                                                          serializeParam(
                                                        'План питания',
                                                        ParamType.String,
                                                      ),
                                                      'productName':
                                                          serializeParam(
                                                        searchNutritionItem
                                                            .nutritionPlanName,
                                                        ParamType.String,
                                                      ),
                                                      'productPrice':
                                                          serializeParam(
                                                        searchNutritionItem
                                                            .nutritionPlanPrice,
                                                        ParamType.int,
                                                      ),
                                                      'productPhoto1':
                                                          serializeParam(
                                                        searchNutritionItem
                                                            .nutritionPlanPhoto1,
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
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          searchNutritionItem
                                                              .nutritionPlanPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/nutritiop_plan-default.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
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
                                                        10.0, 0.0, 0.0, 2.0),
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
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text:
                                                                'Планы питания',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 139.0,
                                                              height: 20.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xCCFF740F),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                380.0
                                                                            ? 6.0
                                                                            : 5.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
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
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          searchNutritionItem
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
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
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
                                                                  width: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
                                                                  height: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
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
                                                                      searchNutritionItem
                                                                          .userPhoto,
                                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank_avatar.jpg',
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
                                                                              fontSize: 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                              searchNutritionItem.userName,
                                                                              'Нет имени',
                                                                            )} ${valueOrDefault<String>(
                                                                              searchNutritionItem.userSurname,
                                                                              'Нет фамилия',
                                                                            )}',
                                                                            'Нет имени',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                    Row(
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
                                                              if (functions.isFavouriteNutritionPlanInList(
                                                                  searchNutritionItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                            _model.nutritionPlanFavourites.length) {
                                                                          if (searchNutritionItem.id ==
                                                                              _model.nutritionPlanFavourites.elementAtOrNull(_model.count4)?.nutritionplanId) {
                                                                            _model.removeAtIndexFromNutritionPlanFavourites(_model.count4);
                                                                            safeSetState(() {});
                                                                            await FavouriteNutritionplanTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'nutritionplan_id',
                                                                                    searchNutritionItem.id,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
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
                                                              if (!functions.isFavouriteNutritionPlanInList(
                                                                  searchNutritionItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                        _model.newFavouriteNutritionPlanResult =
                                                                            await FavouriteNutritionplanTable().insert({
                                                                          'nutritionplan_id':
                                                                              searchNutritionItem.id,
                                                                          'user_id':
                                                                              currentUserUid,
                                                                        });
                                                                        _model.addToNutritionPlanFavourites(
                                                                            _model.newFavouriteNutritionPlanResult!);
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
                                                  ],
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
                            );
                          },
                        ),
                      if (_model.choiceChipsValue == 'Планы тренировок')
                        FutureBuilder<ApiCallResponse>(
                          future: AclyTablesGroup.trainingPlansSearchCall.call(
                            term: _model.term,
                            limit: _model.limit,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Image.asset(
                                'assets/images/logo.png',
                              );
                            }
                            final searchResultTrainingsPlansListViewTrainingPlansSearchResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final trainingPlans =
                                    (searchResultTrainingsPlansListViewTrainingPlansSearchResponse
                                                    .jsonBody
                                                    .toList()
                                                    .map<TrainingPlansDataStruct?>(
                                                        TrainingPlansDataStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<
                                                    TrainingPlansDataStruct?>)
                                            .withoutNulls
                                            .toList() ??
                                        [];

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: trainingPlans.length,
                                  itemBuilder: (context, trainingPlansIndex) {
                                    final trainingPlansItem =
                                        trainingPlans[trainingPlansIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.0, 16.0, 0.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    MainInfoTrainingPlanWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'productID':
                                                          serializeParam(
                                                        trainingPlansItem.id,
                                                        ParamType.int,
                                                      ),
                                                      'productType':
                                                          serializeParam(
                                                        'План тренировки',
                                                        ParamType.String,
                                                      ),
                                                      'productName':
                                                          serializeParam(
                                                        trainingPlansItem
                                                            .trainingPlanName,
                                                        ParamType.String,
                                                      ),
                                                      'productPrice':
                                                          serializeParam(
                                                        valueOrDefault<int>(
                                                          trainingPlansItem
                                                              .trainingPlanPrice,
                                                          0,
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                      'productPhoto1':
                                                          serializeParam(
                                                        trainingPlansItem
                                                            .trainingPlanPhoto1,
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
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          trainingPlansItem
                                                              .trainingPlanPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/training_plan1.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
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
                                                        10.0, 0.0, 0.0, 2.0),
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
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text:
                                                                'Планы тренировок',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 156.0,
                                                              height: 20.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xCCFF740F),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                380.0
                                                                            ? 6.0
                                                                            : 5.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
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
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          trainingPlansItem
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
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
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
                                                                  width: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
                                                                  height: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
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
                                                                      trainingPlansItem
                                                                          .userPhoto,
                                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank_avatar.jpg',
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
                                                                              fontSize: 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                              trainingPlansItem.userName,
                                                                              'Нет имени',
                                                                            )} ${valueOrDefault<String>(
                                                                              trainingPlansItem.userSurname,
                                                                              'Нет фамилии',
                                                                            )}',
                                                                            'Нет имени',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                    Row(
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
                                                                  trainingPlansItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                          if (trainingPlansItem.id ==
                                                                              _model.trainingPlanFavourites.elementAtOrNull(_model.count2)?.trainingplanId) {
                                                                            _model.removeAtIndexFromTrainingPlanFavourites(_model.count2);
                                                                            safeSetState(() {});
                                                                            await FavouriteTrainingPlansTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'trainingplan_id',
                                                                                    trainingPlansItem.id,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  ),
                                                                            );
                                                                            _model.count2 =
                                                                                0;
                                                                            safeSetState(() {});
                                                                            return;
                                                                          } else {
                                                                            _model.count2 =
                                                                                _model.count2 + 1;
                                                                            safeSetState(() {});
                                                                            return;
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
                                                                  trainingPlansItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                        _model.newFavouriteTrainingPlanResult =
                                                                            await FavouriteTrainingPlansTable().insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'trainingplan_id':
                                                                              trainingPlansItem.id,
                                                                        });
                                                                        _model.addToTrainingPlanFavourites(
                                                                            _model.newFavouriteTrainingPlanResult!);
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
                                                  ],
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
                            );
                          },
                        ),
                      if (_model.choiceChipsValue == 'Цифровые продукты')
                        FutureBuilder<ApiCallResponse>(
                          future: AclyTablesGroup.digiProdSearchCall.call(
                            term: _model.searchProductsTextController.text,
                            limit: _model.limit,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Image.asset(
                                'assets/images/logo.png',
                              );
                            }
                            final searchResultDigiProdListViewDigiProdSearchResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final digiProd =
                                    (searchResultDigiProdListViewDigiProdSearchResponse
                                                    .jsonBody
                                                    .toList()
                                                    .map<DigiprodDataStruct?>(
                                                        DigiprodDataStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<
                                                    DigiprodDataStruct?>)
                                            .withoutNulls
                                            .where((e) =>
                                                (e.digitalProductStatus ==
                                                    true) &&
                                                (e.digitalProductPublish ==
                                                    true) &&
                                                (e.trainerActive == true))
                                            .toList()
                                            .toList() ??
                                        [];

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: digiProd.length,
                                  itemBuilder: (context, digiProdIndex) {
                                    final digiProdItem =
                                        digiProd[digiProdIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.0, 16.0, 0.0),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    MainInfoDigitalProductWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'productID':
                                                          serializeParam(
                                                        digiProdItem.id,
                                                        ParamType.int,
                                                      ),
                                                      'productType':
                                                          serializeParam(
                                                        'Цифровой продукт',
                                                        ParamType.String,
                                                      ),
                                                      'productName':
                                                          serializeParam(
                                                        digiProdItem
                                                            .digitalProductName,
                                                        ParamType.String,
                                                      ),
                                                      'productPrice':
                                                          serializeParam(
                                                        digiProdItem
                                                            .digitalProductPrice,
                                                        ParamType.int,
                                                      ),
                                                      'productPhoto1':
                                                          serializeParam(
                                                        digiProdItem
                                                            .digitalProductPhoto1,
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
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          digiProdItem
                                                              .digitalProductPhoto1,
                                                          'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/DigiProd1.jpg',
                                                        ),
                                                        fit: BoxFit.fill,
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
                                                        10.0, 0.0, 0.0, 2.0),
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
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text:
                                                                'Цифровые продукты',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 156.0,
                                                              height: 20.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xCCFF740F),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                                        fontSize: MediaQuery.sizeOf(context).width >=
                                                                                380.0
                                                                            ? 6.0
                                                                            : 5.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 0.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
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
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          digiProdItem
                                                              .digitalProductName,
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
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    6.0,
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
                                                                  width: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
                                                                  height: MediaQuery.sizeOf(context)
                                                                              .width >=
                                                                          360.0
                                                                      ? 24.0
                                                                      : 22.0,
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
                                                                      digiProdItem
                                                                          .userPhoto,
                                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank_avatar.jpg',
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
                                                                              fontSize: 6.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                              digiProdItem.userName,
                                                                              'Нет имени',
                                                                            )} ${valueOrDefault<String>(
                                                                              digiProdItem.userSurname,
                                                                              'Нет фамилии',
                                                                            )}',
                                                                            'Нет имени',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                    Row(
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
                                                              if (functions.isFavouriteDigiProdInList(
                                                                  digiProdItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                            _model.digiProdFavourites.length) {
                                                                          if (digiProdItem.id ==
                                                                              _model.digiProdFavourites.elementAtOrNull(_model.count3)?.digitalproductId) {
                                                                            _model.removeAtIndexFromDigiProdFavourites(_model.count3);
                                                                            safeSetState(() {});
                                                                            await FavouriteDigiptalroductTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'digitalproduct_id',
                                                                                    digiProdItem.id,
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
                                                                            return;
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
                                                                  digiProdItem
                                                                      .id,
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
                                                                            4.0),
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
                                                                        _model.newFavouriteDigiProdResult =
                                                                            await FavouriteDigiptalroductTable().insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'digitalproduct_id':
                                                                              digiProdItem.id,
                                                                        });
                                                                        _model.addToDigiProdFavourites(
                                                                            _model.newFavouriteDigiProdResult!);
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
                                                  ],
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
                            );
                          },
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
