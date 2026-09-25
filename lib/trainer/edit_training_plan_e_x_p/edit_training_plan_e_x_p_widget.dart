import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_edit_training/app_bar_edit_training_widget.dart';
import '/components_trainer/popup_training_plan_p_d_f_upload/popup_training_plan_p_d_f_upload_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_training_plan_e_x_p_model.dart';
export 'edit_training_plan_e_x_p_model.dart';

class EditTrainingPlanEXPWidget extends StatefulWidget {
  const EditTrainingPlanEXPWidget({
    super.key,
    required this.trainingplanID,
  });

  final int? trainingplanID;

  static String routeName = 'EditTrainingPlanEXP';
  static String routePath = 'editTrainingPlanEXP';

  @override
  State<EditTrainingPlanEXPWidget> createState() =>
      _EditTrainingPlanEXPWidgetState();
}

class _EditTrainingPlanEXPWidgetState extends State<EditTrainingPlanEXPWidget> {
  late EditTrainingPlanEXPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTrainingPlanEXPModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      _model.initOrResumeEditTrainingPlanRESULT =
          await actions.initOrResumeEditTrainingPlan(
        widget.trainingplanID!,
      );
      // tempId
      _model.tempId = _model.initOrResumeEditTrainingPlanRESULT!;
      safeSetState(() {});
      // draftPlanName
      safeSetState(() {
        _model.trainingNameFieldTextController?.text =
            FFAppState().draftPlanName;
      });
      // trainingPlanDescriptionField
      safeSetState(() {
        _model.trainingDescriptionFieldTextController?.text =
            FFAppState().draftPlanDescription;
      });
      // draftPlanPrice
      safeSetState(() {
        _model.slotPriceFieldTextController?.text = FFAppState().draftPlanPrice;
      });
      _model.refreshTempPlanPhotosINIT = await actions.refreshTempPlanPhotos(
        _model.tempId,
      );
      // tempPhotos = freshPhotos
      _model.freshPhotos =
          _model.refreshTempPlanPhotosINIT!.toList().cast<String>();
      _model.tempPhotos = _model.freshPhotos.toList().cast<String>();
      safeSetState(() {});
      await actions.startHeartbeat(
        _model.tempId,
      );
    });

    _model.trainingNameFieldFocusNode ??= FocusNode();

    _model.trainingDescriptionFieldFocusNode ??= FocusNode();

    _model.slotPriceFieldFocusNode ??= FocusNode();

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

    return FutureBuilder<List<TrainingPlanMarketRow>>(
      future: TrainingPlanMarketTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.trainingplanID,
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
        List<TrainingPlanMarketRow>
            editTrainingPlanEXPTrainingPlanMarketRowList = snapshot.data!;

        final editTrainingPlanEXPTrainingPlanMarketRow =
            editTrainingPlanEXPTrainingPlanMarketRowList.isNotEmpty
                ? editTrainingPlanEXPTrainingPlanMarketRowList.first
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
                    model: _model.appBarEditTrainingModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppBarEditTrainingWidget(
                      nameVariable: 'план тренировки',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 25.0, 0.0, 0.0),
                            child: Text(
                              'Обложка',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF090A0A),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          if (_model.tempPhotos.length > 0)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 20.0, 16.0, 0.0),
                              child: FutureBuilder<
                                  List<TrainingPlansMarketTempRow>>(
                                future: TrainingPlansMarketTempTable()
                                    .querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    _model.tempId,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Image.asset(
                                      'assets/images/logo.png',
                                    );
                                  }
                                  List<TrainingPlansMarketTempRow>
                                      trainingPlanEditContainerTrainingPlansMarketTempRowList =
                                      snapshot.data!;

                                  final trainingPlanEditContainerTrainingPlansMarketTempRow =
                                      trainingPlanEditContainerTrainingPlansMarketTempRowList
                                              .isNotEmpty
                                          ? trainingPlanEditContainerTrainingPlansMarketTempRowList
                                              .first
                                          : null;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() => _model
                                                .isDataUploading_uploadDataTPEDIT =
                                            true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                    originalFilename:
                                                        m.originalFilename,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isDataUploading_uploadDataTPEDIT =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile_uploadDataTPEDIT =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }

                                      // UploadedFileData_TPEDIT
                                      _model.replaceUploadedFile = _model
                                          .uploadedLocalFile_uploadDataTPEDIT;
                                      safeSetState(() {});
                                      if ((_model.uploadedLocalFile_uploadDataTPEDIT
                                                  .bytes?.isEmpty ??
                                              true)) {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      _model.photoSizeResultTPEDIT =
                                          await actions
                                              .checkImageFileSizeAction(
                                        _model.replaceUploadedFile!,
                                        1536,
                                      );
                                      _shouldSetState = true;
                                      if (_model.photoSizeResultTPEDIT!) {
                                        _model.uploadTempTrainingPlanPhotoEDIT =
                                            await actions
                                                .uploadTempTrainingPlanPhoto(
                                          _model.tempId,
                                          _model.replaceUploadedFile!,
                                        );
                                        _shouldSetState = true;
                                        // photoUploadResult
                                        _model.photoUploadResult = _model
                                            .uploadTempTrainingPlanPhotoEDIT!;
                                        safeSetState(() {});
                                        if (_model.photoUploadResult ==
                                            'MAX_REACHED') {
                                          // Максимум 5 фотографий
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Максимум 5 фотографий',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          if (_model.photoUploadResult == '') {
                                            // Ошибка загрузки фото
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Ошибка загрузки фото',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          } else {
                                            // refreshTempPlanPhotos
                                            _model.refreshTempPlanPhotosEDIT =
                                                await actions
                                                    .refreshTempPlanPhotos(
                                              _model.tempId,
                                            );
                                            _shouldSetState = true;
                                            // tempPhotos = freshPhotos
                                            _model.freshPhotos = _model
                                                .refreshTempPlanPhotosEDIT!
                                                .toList()
                                                .cast<String>();
                                            _model.tempPhotos = _model
                                                .freshPhotos
                                                .toList()
                                                .cast<String>();
                                            safeSetState(() {});
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        // Файл слишком большой. Максимум 1.5 МБ
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Файл слишком большой. Максимум 1.5 МБ',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 264.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFF9F5),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final trainingPlanTempPhoto =
                                              trainingPlanEditContainerTrainingPlansMarketTempRow
                                                      ?.trainingPlanPhoto
                                                      .toList() ??
                                                  [];

                                          return Container(
                                            width: double.infinity,
                                            height: 500.0,
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 40.0),
                                                  child: PageView.builder(
                                                    controller: _model
                                                            .pageViewEditUPLOADEDController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    trainingPlanTempPhoto
                                                                            .length -
                                                                        1))),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        trainingPlanTempPhoto
                                                            .length,
                                                    itemBuilder: (context,
                                                        trainingPlanTempPhotoIndex) {
                                                      final trainingPlanTempPhotoItem =
                                                          trainingPlanTempPhoto[
                                                              trainingPlanTempPhotoIndex];
                                                      return Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .network(
                                                                    trainingPlanTempPhotoItem,
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
                                                                        0.0,
                                                                        1.0),
                                                                children: [
                                                                  Opacity(
                                                                    opacity:
                                                                        0.75,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          45.0,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            343.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFF160E16),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Фотография плана тренировки',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  var _shouldSetState = false;
                                                                                  _model.selectedPhotoIndex = _model.pageViewEditUPLOADEDCurrentIndex;
                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Удалить фото?'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                child: Text('Отмена'),
                                                                                              ),
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                child: Text('Удалить'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ) ??
                                                                                      false;
                                                                                  if (confirmDialogResponse) {
                                                                                    await actions.deleteTempTrainingPlanPhoto(
                                                                                      _model.tempId,
                                                                                      _model.selectedPhotoIndex,
                                                                                    );
                                                                                    _model.refreshTempPlanPhotosDEL = await actions.refreshTempPlanPhotos(
                                                                                      _model.tempId,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    // freshPhotos
                                                                                    _model.freshPhotos = _model.refreshTempPlanPhotosDEL!.toList().cast<String>();
                                                                                    _model.tempPhotos = _model.freshPhotos.toList().cast<String>();
                                                                                    safeSetState(() {});
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  } else {
                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                    return;
                                                                                  }

                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: 33.0,
                                                                                  height: 33.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/trash.svg',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
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
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.96,
                                                                    -0.99),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  // selectedPhotoIndex
                                                                  _model.selectedPhotoIndex =
                                                                      _model
                                                                          .pageViewEditUPLOADEDCurrentIndex;
                                                                  safeSetState(
                                                                      () {});
                                                                  final selectedMedia =
                                                                      await selectMediaWithSourceBottomSheet(
                                                                    context:
                                                                        context,
                                                                    allowPhoto:
                                                                        true,
                                                                  );
                                                                  if (selectedMedia !=
                                                                          null &&
                                                                      selectedMedia.every((m) => validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                    safeSetState(() =>
                                                                        _model.isDataUploading_uploadDataTPEDITReplace =
                                                                            true);
                                                                    var selectedUploadedFiles =
                                                                        <FFUploadedFile>[];

                                                                    try {
                                                                      selectedUploadedFiles = selectedMedia
                                                                          .map((m) => FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                                blurHash: m.blurHash,
                                                                                originalFilename: m.originalFilename,
                                                                              ))
                                                                          .toList();
                                                                    } finally {
                                                                      _model.isDataUploading_uploadDataTPEDITReplace =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.uploadedLocalFile_uploadDataTPEDITReplace =
                                                                            selectedUploadedFiles.first;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  // replaceUploadedFile
                                                                  _model.replaceUploadedFile =
                                                                      _model
                                                                          .uploadedLocalFile_uploadDataTPEDITReplace;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.replacePhotoSizeTPEDIT =
                                                                      await actions
                                                                          .checkImageFileSizeAction(
                                                                    _model
                                                                        .replaceUploadedFile!,
                                                                    1536,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  _model.replacePhotoSizeResult =
                                                                      _model
                                                                          .replacePhotoSizeTPEDIT!;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (_model
                                                                      .replacePhotoSizeResult) {
                                                                    _model.replacePhotoUploadTPEDIT =
                                                                        await actions
                                                                            .replaceTempTrainingPlanPhoto(
                                                                      _model
                                                                          .tempId,
                                                                      _model
                                                                          .selectedPhotoIndex,
                                                                      _model
                                                                          .replaceUploadedFile!,
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    // photoUploadResult
                                                                    _model.replacePhotoUploadResult =
                                                                        _model
                                                                            .replacePhotoUploadTPEDIT!;
                                                                    safeSetState(
                                                                        () {});
                                                                    if (_model.replacePhotoUploadResult !=
                                                                            '') {
                                                                      _model.freshPhotosTPEDIT =
                                                                          await actions
                                                                              .refreshTempPlanPhotos(
                                                                        _model
                                                                            .tempId,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      // freshPhotos
                                                                      _model.freshPhotos = _model
                                                                          .freshPhotosTPEDIT!
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                      _model.tempPhotos = _model
                                                                          .freshPhotos
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      // Ошибка замены фото
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Ошибка замены фото',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                    }

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    // Файл слишком большой. Максимум 1.5 МБ
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Файл слишком большой. Максимум 1.5 МБ',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/Group_26.png',
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 16.0),
                                                    child: smooth_page_indicator
                                                        .SmoothPageIndicator(
                                                      controller: _model
                                                              .pageViewEditUPLOADEDController ??=
                                                          PageController(
                                                              initialPage: max(
                                                                  0,
                                                                  min(
                                                                      0,
                                                                      trainingPlanTempPhoto
                                                                              .length -
                                                                          1))),
                                                      count:
                                                          trainingPlanTempPhoto
                                                              .length,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) async {
                                                        await _model
                                                            .pageViewEditUPLOADEDController!
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
                                                        radius: 100.0,
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
                                  );
                                },
                              ),
                            ),
                          if (_model.tempPhotos.length < 1)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 20.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var _shouldSetState = false;
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(() => _model
                                            .isDataUploading_uploadData01tpEDIT =
                                        true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                                originalFilename:
                                                    m.originalFilename,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_uploadData01tpEDIT =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_uploadData01tpEDIT =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  _model.uploadedFile = _model
                                      .uploadedLocalFile_uploadData01tpEDIT;
                                  safeSetState(() {});

                                  _model.photoSizeResultCHECKtpEDIT =
                                      await actions.checkImageFileSizeAction(
                                    _model.uploadedFile!,
                                    1536,
                                  );
                                  _shouldSetState = true;
                                  _model.photoSizeResult =
                                      _model.photoSizeResultCHECKtpEDIT!;
                                  safeSetState(() {});
                                  if (_model.photoSizeResult) {
                                    _model.uploadTempTrainingPlanPhotoRESULTtpEDIT =
                                        await actions
                                            .uploadTempTrainingPlanPhoto(
                                      _model.tempId,
                                      _model.uploadedFile!,
                                    );
                                    _shouldSetState = true;
                                    // photoUploadResult
                                    _model.photoUploadResult = _model
                                        .uploadTempTrainingPlanPhotoRESULTtpEDIT!;
                                    safeSetState(() {});
                                    if (_model.photoUploadResult ==
                                        'MAX_REACHED') {
                                      // Максимум 5 фотографий
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Максимум 5 фотографий',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if (_model.photoUploadResult == '') {
                                        // Ошибка загрузки фото
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Ошибка загрузки фото',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      } else {
                                        // refreshTempPlanPhotos
                                        _model.refreshTempPlanPhotosRESULTtpEDIT =
                                            await actions.refreshTempPlanPhotos(
                                          _model.tempId,
                                        );
                                        _shouldSetState = true;
                                        // tempPhotos = freshPhotos
                                        _model.freshPhotos = _model
                                            .refreshTempPlanPhotosRESULTtpEDIT!
                                            .toList()
                                            .cast<String>();
                                        _model.tempPhotos = _model.freshPhotos
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  } else {
                                    // Файл слишком большой. Максимум 1.5 МБ
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Файл слишком большой. Максимум 1.5 МБ',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                child: Container(
                                  width: 343.0,
                                  height: 264.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Добавьте \nфото плана тренировки',
                                      textAlign: TextAlign.center,
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
                                            fontSize: 18.0,
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
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 31.0, 0.0, 0.0),
                            child: Text(
                              'Название плана тренировки',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF090A0A),
                                    fontSize: 16.0,
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
                                16.0, 9.0, 16.0, 0.0),
                            child: TextFormField(
                              controller:
                                  _model.trainingNameFieldTextController ??=
                                      TextEditingController(
                                text: valueOrDefault<String>(
                                  editTrainingPlanEXPTrainingPlanMarketRow
                                      ?.trainingPlanName,
                                  'Нет названия',
                                ),
                              ),
                              focusNode: _model.trainingNameFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await actions.saveTempTrainingPlansFields(
                                  _model.tempId,
                                  _model.trainingNameFieldTextController.text,
                                  _model.trainingDescriptionFieldTextController
                                      .text,
                                  _model.slotPriceFieldTextController.text,
                                );
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Ввести название',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF72777A),
                                      fontSize: 12.0,
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
                                    color: Color(0xFFE3E5E5),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              validator: _model
                                  .trainingNameFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 30.0, 0.0, 0.0),
                            child: Text(
                              'Описание плана тренировки',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF090A0A),
                                    fontSize: 16.0,
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
                                16.0, 8.0, 16.0, 0.0),
                            child: TextFormField(
                              controller: _model
                                      .trainingDescriptionFieldTextController ??=
                                  TextEditingController(
                                text: valueOrDefault<String>(
                                  editTrainingPlanEXPTrainingPlanMarketRow
                                      ?.trainingPlanDescription,
                                  'Нет описания',
                                ),
                              ),
                              focusNode:
                                  _model.trainingDescriptionFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await actions.saveTempTrainingPlansFields(
                                  _model.tempId,
                                  _model.trainingNameFieldTextController.text,
                                  _model.trainingDescriptionFieldTextController
                                      .text,
                                  _model.slotPriceFieldTextController.text,
                                );
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Краткое описание',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF72777A),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                alignLabelWithHint: true,
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
                                    color: Color(0xFFE3E5E5),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 4,
                              validator: _model
                                  .trainingDescriptionFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Стоимость',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF090A0A),
                                    fontSize: 16.0,
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
                                16.0, 9.0, 16.0, 0.0),
                            child: TextFormField(
                              controller:
                                  _model.slotPriceFieldTextController ??=
                                      TextEditingController(
                                text: valueOrDefault<String>(
                                  editTrainingPlanEXPTrainingPlanMarketRow
                                      ?.trainingPlanPrice
                                      ?.toString(),
                                  '0,0',
                                ),
                              ),
                              focusNode: _model.slotPriceFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await actions.saveTempTrainingPlansFields(
                                  _model.tempId,
                                  _model.trainingNameFieldTextController.text,
                                  _model.trainingDescriptionFieldTextController
                                      .text,
                                  _model.slotPriceFieldTextController.text,
                                );
                              },
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '1600',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF72777A),
                                      fontSize: 12.0,
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
                                    color: Color(0xFFE3E5E5),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
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
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              validator: _model
                                  .slotPriceFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child:
                                FutureBuilder<List<TrainingPlansMarketTempRow>>(
                              future:
                                  TrainingPlansMarketTempTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'id',
                                  _model.tempId,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TrainingPlansMarketTempRow>
                                    columnTrainingPlansMarketTempRowList =
                                    snapshot.data!;

                                final columnTrainingPlansMarketTempRow =
                                    columnTrainingPlansMarketTempRowList
                                            .isNotEmpty
                                        ? columnTrainingPlansMarketTempRowList
                                            .first
                                        : null;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 0.0, 0.0),
                                          child: Text(
                                            'План тренировок ( .PDF)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF090A0A),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        if (columnTrainingPlansMarketTempRow
                                                    ?.trainingPlanFile !=
                                                null &&
                                            columnTrainingPlansMarketTempRow
                                                    ?.trainingPlanFile !=
                                                '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 10.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.filePdf,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 24.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 9.0, 60.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
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
                                                        PopupTrainingPlanPDFUploadWidget(
                                                      tempId: _model.tempId,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                        .width >=
                                                    380.0
                                                ? 48.0
                                                : 42.0,
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
                                                Text(
                                                  (columnTrainingPlansMarketTempRow
                                                                      ?.trainingPlanFile !=
                                                                  null &&
                                                              columnTrainingPlansMarketTempRow
                                                                      ?.trainingPlanFile !=
                                                                  '') &&
                                                          (columnTrainingPlansMarketTempRow
                                                                  ?.trainingPlanFile !=
                                                              '')
                                                      ? 'Изменить план тренировок'
                                                      : 'Загрузить  план тренировок',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          if (_model.isPublishing == false)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    57.0, 26.0, 56.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    if (_model.tempPhotos.length < 1) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Загрузите хотя-бы одно фото',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if (_model.trainingNameFieldTextController
                                              .text ==
                                          '') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Введите название',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        if (_model.trainingDescriptionFieldTextController
                                                    .text ==
                                                '') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Введите описание',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          if (_model.slotPriceFieldTextController
                                                      .text ==
                                                  '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Введите стоимость',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            // isPublishing -TRUE
                                            _model.isPublishing = true;
                                            safeSetState(() {});
                                            _model.publishTrainingPlanEDIT =
                                                await actions
                                                    .publishTrainingPlan(
                                              _model.tempId,
                                              _model
                                                  .trainingNameFieldTextController
                                                  .text,
                                              _model
                                                  .trainingDescriptionFieldTextController
                                                  .text,
                                              _model
                                                  .slotPriceFieldTextController
                                                  .text,
                                            );
                                            _shouldSetState = true;
                                            _model.publishResult =
                                                _model.publishTrainingPlanEDIT!;
                                            safeSetState(() {});
                                            await actions.stopHeartbeat();
                                            if (_model.publishResult == true) {
                                              // isPublishing  - FALSE
                                              _model.isPublishing = false;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  CoachProductsWidget
                                                      .routeName);

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              // isPublishing  - FALSE
                                              _model.isPublishing = false;
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Ошибка публикации. Попробуйте снова',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          }
                                        }
                                      }
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).width >=
                                            380.0
                                        ? 48.0
                                        : 42.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF7B43CE),
                                          Color(0xFFFF740F)
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: AlignmentDirectional(0.69, -1.0),
                                        end: AlignmentDirectional(-0.69, 1.0),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Text(
                                              'Публикация →',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ].addToEnd(SizedBox(height: 100.0)),
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
                        model: _model.tapBarTrainerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TapBarTrainerWidget(),
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
