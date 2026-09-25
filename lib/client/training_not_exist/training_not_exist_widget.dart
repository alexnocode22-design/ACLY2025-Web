import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_main_draft_info/app_bar_main_draft_info_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'training_not_exist_model.dart';
export 'training_not_exist_model.dart';

class TrainingNotExistWidget extends StatefulWidget {
  const TrainingNotExistWidget({
    super.key,
    required this.trainingID,
  });

  final int? trainingID;

  static String routeName = 'TrainingNotExist';
  static String routePath = 'trainingNotExist';

  @override
  State<TrainingNotExistWidget> createState() => _TrainingNotExistWidgetState();
}

class _TrainingNotExistWidgetState extends State<TrainingNotExistWidget> {
  late TrainingNotExistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingNotExistModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      FFAppState().slotBoughtTemp = [];
      safeSetState(() {});
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
      _model.reviewExist = await ReviewsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'review_object_id',
          widget.trainingID,
        ),
      );
      if (_model.reviewExist!.length > 0) {
        _model.reviewExists = true;
        safeSetState(() {});
      }
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

    return FutureBuilder<List<CombinedTrainingsViewRow>>(
      future: CombinedTrainingsViewTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.trainingID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFFFF9F5),
            body: Center(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          );
        }
        List<CombinedTrainingsViewRow>
            trainingNotExistCombinedTrainingsViewRowList = snapshot.data!;

        final trainingNotExistCombinedTrainingsViewRow =
            trainingNotExistCombinedTrainingsViewRowList.isNotEmpty
                ? trainingNotExistCombinedTrainingsViewRowList.first
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
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.appBarMainDraftInfoModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AppBarMainDraftInfoWidget(),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 0.0, 0.0),
                      child: FutureBuilder<List<TrainingsBoughtRow>>(
                        future: TrainingsBoughtTable().querySingleRow(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user_id',
                                currentUserUid,
                              )
                              .eqOrNull(
                                'training_payed',
                                true,
                              )
                              .eqOrNull(
                                'training_id',
                                widget.trainingID,
                              )
                              .order('created_at'),
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
                          List<TrainingsBoughtRow>
                              columnTrainingsBoughtRowList = snapshot.data!;

                          final columnTrainingsBoughtRow =
                              columnTrainingsBoughtRowList.isNotEmpty
                                  ? columnTrainingsBoughtRowList.first
                                  : null;

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Тренировка:',
                                      textAlign: TextAlign.start,
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
                                            color: Color(0xFF2C2C2C),
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width >=
                                                    380.0
                                                ? 20.0
                                                : 18.0,
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        57.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        columnTrainingsBoughtRow?.trainingName,
                                        'Нет названия',
                                      ),
                                      textAlign: TextAlign.start,
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
                                                .tertiary,
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width >=
                                                    380.0
                                                ? 20.0
                                                : 18.0,
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
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'больше не существует',
                                      textAlign: TextAlign.start,
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
                                            color: Color(0xFF2C2C2C),
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width >=
                                                    380.0
                                                ? 20.0
                                                : 18.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 36.0, 16.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ].addToEnd(SizedBox(height: 150.0)),
                            ),
                          );
                        },
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
