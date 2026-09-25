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
import 'edit_nutrition_plan_e_x_p_model.dart';
export 'edit_nutrition_plan_e_x_p_model.dart';

class EditNutritionPlanEXPWidget extends StatefulWidget {
  const EditNutritionPlanEXPWidget({
    super.key,
    required this.nutritionplanID,
  });

  final int? nutritionplanID;

  static String routeName = 'EditNutritionPlanEXP';
  static String routePath = 'editNutritionPlanEXP';

  @override
  State<EditNutritionPlanEXPWidget> createState() =>
      _EditNutritionPlanEXPWidgetState();
}

class _EditNutritionPlanEXPWidgetState
    extends State<EditNutritionPlanEXPWidget> {
  late EditNutritionPlanEXPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditNutritionPlanEXPModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tabIconColor = 0;
      safeSetState(() {});
      _model.initOrResumeEditNutritionPlanRESULT =
          await actions.initOrResumeEditNutritionPlan(
        widget.nutritionplanID!,
      );
      // tempId
      _model.tempId = _model.initOrResumeEditNutritionPlanRESULT;
      safeSetState(() {});
      safeSetState(() {
        _model.nutritionNameFieldTextController?.text =
            FFAppState().draftNutritionName;
      });
      safeSetState(() {
        _model.nutritionDescriptionFieldTextController?.text =
            FFAppState().draftNutritionDescription;
      });
      safeSetState(() {
        _model.priceFieldTextController?.text =
            FFAppState().draftNutritionPrice;
      });
      _model.refreshTempNutritionPlanPhotosINIT =
          await actions.refreshTempNutritionPhotos(
        _model.tempId!,
      );
      // tempPhotos = freshPhotos
      _model.freshPhotos =
          _model.refreshTempNutritionPlanPhotosINIT!.toList().cast<String>();
      _model.tempPhotos = _model.freshPhotos.toList().cast<String>();
      safeSetState(() {});
      await actions.startHeartbeat(
        _model.tempId!,
      );
    });

    _model.nutritionNameFieldFocusNode ??= FocusNode();

    _model.nutritionDescriptionFieldFocusNode ??= FocusNode();

    _model.priceFieldFocusNode ??= FocusNode();

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

    return FutureBuilder<List<NutritionPlanMarketRow>>(
      future: NutritionPlanMarketTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.nutritionplanID,
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
        List<NutritionPlanMarketRow>
            editNutritionPlanEXPNutritionPlanMarketRowList = snapshot.data!;

        final editNutritionPlanEXPNutritionPlanMarketRow =
            editNutritionPlanEXPNutritionPlanMarketRowList.isNotEmpty
                ? editNutritionPlanEXPNutritionPlanMarketRowList.first
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
                      nameVariable: 'план питания',
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
                                  List<NutritionPlansMarketTempRow>>(
                                future: NutritionPlansMarketTempTable()
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
                                  List<NutritionPlansMarketTempRow>
                                      nutritionPlanEditContainerNutritionPlansMarketTempRowList =
                                      snapshot.data!;

                                  final nutritionPlanEditContainerNutritionPlansMarketTempRow =
                                      nutritionPlanEditContainerNutritionPlansMarketTempRowList
                                              .isNotEmpty
                                          ? nutritionPlanEditContainerNutritionPlansMarketTempRowList
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
                                                .isDataUploading_uploadDataNPEDIT =
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
                                          _model.isDataUploading_uploadDataNPEDIT =
                                              false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFile_uploadDataNPEDIT =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          safeSetState(() {});
                                          return;
                                        }
                                      }

                                      // UploadedFileData_TPEDIT
                                      _model.replaceUploadedFile = _model
                                          .uploadedLocalFile_uploadDataNPEDIT;
                                      safeSetState(() {});
                                      if ((_model.uploadedLocalFile_uploadDataNPEDIT
                                                  .bytes?.isEmpty ??
                                              true)) {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      _model.photoSizeResultNPEDIT =
                                          await actions
                                              .checkImageFileSizeAction(
                                        _model.replaceUploadedFile!,
                                        1536,
                                      );
                                      _shouldSetState = true;
                                      if (_model.photoSizeResultNPEDIT!) {
                                        _model.uploadTempNutritionPlanPhotoEDIT =
                                            await actions
                                                .uploadTempNutritionPhoto(
                                          _model.tempId!,
                                          _model.replaceUploadedFile!,
                                        );
                                        _shouldSetState = true;
                                        // photoUploadResult
                                        _model.photoUploadResult = _model
                                            .uploadTempNutritionPlanPhotoEDIT!;
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
                                            _model.refreshTempNutritionPlanPhotosEDIT =
                                                await actions
                                                    .refreshTempPlanPhotos(
                                              _model.tempId!,
                                            );
                                            _shouldSetState = true;
                                            // tempPhotos = freshPhotos
                                            _model.freshPhotos = _model
                                                .refreshTempNutritionPlanPhotosEDIT!
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
                                          final nutritionPlanPhoto =
                                              nutritionPlanEditContainerNutritionPlansMarketTempRow
                                                      ?.nutritionPlanPhoto
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
                                                                    nutritionPlanPhoto
                                                                            .length -
                                                                        1))),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        nutritionPlanPhoto
                                                            .length,
                                                    itemBuilder: (context,
                                                        nutritionPlanPhotoIndex) {
                                                      final nutritionPlanPhotoItem =
                                                          nutritionPlanPhoto[
                                                              nutritionPlanPhotoIndex];
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
                                                                    nutritionPlanPhotoItem,
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
                                                                      width:
                                                                          343.0,
                                                                      height:
                                                                          45.0,
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
                                                                                'Фотография плана питания',
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
                                                                                    await actions.deleteTempNutritionPhoto(
                                                                                      _model.tempId!,
                                                                                      _model.selectedPhotoIndex,
                                                                                    );
                                                                                    _model.refreshTempNutritionPlanPhotosDEL = await actions.refreshTempNutritionPhotos(
                                                                                      _model.tempId!,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    // freshPhotos
                                                                                    _model.freshPhotos = _model.refreshTempNutritionPlanPhotosDEL!.toList().cast<String>();
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
                                                                    0.98,
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
                                                                        _model.isDataUploading_uploadDataNPEDITReplace =
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
                                                                      _model.isDataUploading_uploadDataNPEDITReplace =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.uploadedLocalFile_uploadDataNPEDITReplace =
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
                                                                          .uploadedLocalFile_uploadDataNPEDITReplace;
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.replacePhotoSizeNPEDIT =
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
                                                                          .replacePhotoSizeNPEDIT!;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (_model
                                                                      .replacePhotoSizeResult) {
                                                                    _model.replacePhotoUploadNPEDIT =
                                                                        await actions
                                                                            .replaceTempNutritionPhoto(
                                                                      _model
                                                                          .tempId!,
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
                                                                            .replacePhotoUploadNPEDIT!;
                                                                    safeSetState(
                                                                        () {});
                                                                    if (_model.replacePhotoUploadResult !=
                                                                            '') {
                                                                      _model.freshPhotosNPEDIT =
                                                                          await actions
                                                                              .refreshTempNutritionPhotos(
                                                                        _model
                                                                            .tempId!,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      // freshPhotos
                                                                      _model.freshPhotos = _model
                                                                          .freshPhotosNPEDIT!
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
                                                                      nutritionPlanPhoto
                                                                              .length -
                                                                          1))),
                                                      count: nutritionPlanPhoto
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
                                            .isDataUploading_uploadDataNP01EDIT =
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
                                      _model.isDataUploading_uploadDataNP01EDIT =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_uploadDataNP01EDIT =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  _model.uploadedFile = _model
                                      .uploadedLocalFile_uploadDataNP01EDIT;
                                  safeSetState(() {});
                                  if ((_model.uploadedLocalFile_uploadDataNP01EDIT
                                              .bytes?.isEmpty ??
                                          true)) {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  _model.photoSizeResultCHECKnpEDIT =
                                      await actions.checkImageFileSizeAction(
                                    _model.uploadedFile!,
                                    1536,
                                  );
                                  _shouldSetState = true;
                                  _model.photoSizeResult =
                                      _model.photoSizeResultCHECKnpEDIT!;
                                  safeSetState(() {});
                                  if (_model.photoSizeResult) {
                                    _model.uploadTempNutritionPlanPhotoRESULTnpEDIT =
                                        await actions.uploadTempNutritionPhoto(
                                      _model.tempId!,
                                      _model.uploadedFile!,
                                    );
                                    _shouldSetState = true;
                                    // photoUploadResult
                                    _model.photoUploadResult = _model
                                        .uploadTempNutritionPlanPhotoRESULTnpEDIT!;
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
                                        _model.refreshTempPlanPhotosRESULTnpEDIT =
                                            await actions
                                                .refreshTempNutritionPhotos(
                                          _model.tempId!,
                                        );
                                        _shouldSetState = true;
                                        // tempPhotos = freshPhotos
                                        _model.freshPhotos = _model
                                            .refreshTempPlanPhotosRESULTnpEDIT!
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
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Добавьте \nфото плана питания',
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
                              'Название плана питания',
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
                                  _model.nutritionNameFieldTextController ??=
                                      TextEditingController(
                                text: valueOrDefault<String>(
                                  editNutritionPlanEXPNutritionPlanMarketRow
                                      ?.nutritionPlanName,
                                  'Нет названия',
                                ),
                              ),
                              focusNode: _model.nutritionNameFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await actions.saveTempNutritionFields(
                                  _model.tempId!,
                                  _model.nutritionNameFieldTextController.text,
                                  _model.nutritionDescriptionFieldTextController
                                      .text,
                                  _model.priceFieldTextController.text,
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
                                  .nutritionNameFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 30.0, 0.0, 0.0),
                            child: Text(
                              'Описание плана питания',
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
                                      .nutritionDescriptionFieldTextController ??=
                                  TextEditingController(
                                text: valueOrDefault<String>(
                                  editNutritionPlanEXPNutritionPlanMarketRow
                                      ?.nutritionPlanDescription,
                                  'Нет описания',
                                ),
                              ),
                              focusNode:
                                  _model.nutritionDescriptionFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await actions.saveTempNutritionFields(
                                  _model.tempId!,
                                  _model.nutritionNameFieldTextController.text,
                                  _model.nutritionDescriptionFieldTextController
                                      .text,
                                  _model.priceFieldTextController.text,
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
                                  .nutritionDescriptionFieldTextControllerValidator
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
                              controller: _model.priceFieldTextController ??=
                                  TextEditingController(
                                text: valueOrDefault<String>(
                                  editNutritionPlanEXPNutritionPlanMarketRow
                                      ?.nutritionPlanPrice
                                      ?.toString(),
                                  '0,0',
                                ),
                              ),
                              focusNode: _model.priceFieldFocusNode,
                              onFieldSubmitted: (_) async {
                                await actions.saveTempNutritionFields(
                                  _model.tempId!,
                                  _model.nutritionNameFieldTextController.text,
                                  _model.nutritionDescriptionFieldTextController
                                      .text,
                                  _model.priceFieldTextController.text,
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
                                  .priceFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: FutureBuilder<
                                List<NutritionPlansMarketTempRow>>(
                              future: NutritionPlansMarketTempTable()
                                  .querySingleRow(
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
                                List<NutritionPlansMarketTempRow>
                                    columnNutritionPlansMarketTempRowList =
                                    snapshot.data!;

                                final columnNutritionPlansMarketTempRow =
                                    columnNutritionPlansMarketTempRowList
                                            .isNotEmpty
                                        ? columnNutritionPlansMarketTempRowList
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
                                            'План питания ( .PDF)',
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
                                        if (columnNutritionPlansMarketTempRow
                                                    ?.nutritionPlanFile !=
                                                null &&
                                            columnNutritionPlansMarketTempRow
                                                    ?.nutritionPlanFile !=
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
                                                      tempId: _model.tempId!,
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
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    (columnNutritionPlansMarketTempRow
                                                                        ?.nutritionPlanFile !=
                                                                    null &&
                                                                columnNutritionPlansMarketTempRow
                                                                        ?.nutritionPlanFile !=
                                                                    '') &&
                                                            (columnNutritionPlansMarketTempRow
                                                                    ?.nutritionPlanFile !=
                                                                '')
                                                        ? 'Изменить план питания'
                                                        : 'Загрузить план питания',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                      if (_model
                                              .nutritionNameFieldTextController
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
                                        if (_model.nutritionDescriptionFieldTextController
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
                                          if (_model.priceFieldTextController
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
                                            _model.publishNutritionPlanEDIT =
                                                await actions
                                                    .publishNutritionPlan(
                                              _model.tempId!,
                                              _model
                                                  .nutritionNameFieldTextController
                                                  .text,
                                              _model
                                                  .nutritionDescriptionFieldTextController
                                                  .text,
                                              _model.priceFieldTextController
                                                  .text,
                                            );
                                            _shouldSetState = true;
                                            _model.publishResult = _model
                                                .publishNutritionPlanEDIT!;
                                            safeSetState(() {});
                                            await actions.stopHeartbeat();
                                            if (_model.publishResult == true) {
                                              // isPublishing -FALSE
                                              _model.isPublishing = false;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  CoachProductsWidget
                                                      .routeName);

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              // isPublishing -FALSE
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
