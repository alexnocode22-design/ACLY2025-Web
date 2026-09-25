import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'popup_nutrition_plan_p_d_f_upload_model.dart';
export 'popup_nutrition_plan_p_d_f_upload_model.dart';

class PopupNutritionPlanPDFUploadWidget extends StatefulWidget {
  const PopupNutritionPlanPDFUploadWidget({
    super.key,
    required this.tempId,
  });

  final int? tempId;

  @override
  State<PopupNutritionPlanPDFUploadWidget> createState() =>
      _PopupNutritionPlanPDFUploadWidgetState();
}

class _PopupNutritionPlanPDFUploadWidgetState
    extends State<PopupNutritionPlanPDFUploadWidget> {
  late PopupNutritionPlanPDFUploadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupNutritionPlanPDFUploadModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NutritionPlansMarketTempRow>>(
      future: NutritionPlansMarketTempTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull(
              'trainer_id',
              currentUserUid,
            )
            .eqOrNull(
              'id',
              widget.tempId,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Image.asset(
            'assets/images/logosmall.png',
          );
        }
        List<NutritionPlansMarketTempRow>
            containerNutritionPlansMarketTempRowList = snapshot.data!;

        final containerNutritionPlansMarketTempRow =
            containerNutritionPlansMarketTempRowList.isNotEmpty
                ? containerNutritionPlansMarketTempRowList.first
                : null;

        return Container(
          width: double.infinity,
          height: 243.0,
          decoration: BoxDecoration(
            color: Color(0xFFFFF9F5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 118.0,
                          height: 124.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              width: 1.0,
                            ),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // Upload New Photo
                              final selectedFiles = await selectFiles(
                                storageFolderPath:
                                    '${currentUserUid}/${widget.tempId?.toString()}',
                                allowedExtensions: ['pdf'],
                                multiFile: false,
                              );
                              if (selectedFiles != null) {
                                safeSetState(() =>
                                    _model.isDataUploading_uploadNutritionPlan =
                                        true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedFiles
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();

                                  downloadUrls =
                                      await uploadSupabaseStorageFiles(
                                    bucketName: 'acly-nutritionplans-temp',
                                    selectedFiles: selectedFiles,
                                  );
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading_uploadNutritionPlan =
                                      false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedFiles.length &&
                                    downloadUrls.length ==
                                        selectedFiles.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_uploadNutritionPlan =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl_uploadNutritionPlan =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(
                                    context,
                                    'Success!',
                                  );
                                } else {
                                  safeSetState(() {});
                                  showUploadMessage(
                                    context,
                                    'Failed to upload file',
                                  );
                                  return;
                                }
                              }

                              // Update comp State to -TRUE
                              _model.isPlanUploaded = true;
                              safeSetState(() {});
                              if ((containerNutritionPlansMarketTempRow
                                              ?.nutritionPlanFile !=
                                          null &&
                                      containerNutritionPlansMarketTempRow
                                              ?.nutritionPlanFile !=
                                          '') &&
                                  (containerNutritionPlansMarketTempRow
                                          ?.nutritionPlanFile !=
                                      '\'\'')) {
                                // Delete Current Photo
                                await actions.deleteFileURL(
                                  'acly-nutritionplans-temp',
                                  containerNutritionPlansMarketTempRow
                                      ?.nutritionPlanFile,
                                );
                                return;
                              } else {
                                return;
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _model.isPlanUploaded
                                    ? 'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/pdf.jpg'
                                    : 'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/pdf_up.jpg',
                                width: 309.0,
                                height: 300.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        if (_model.isDataUploading_uploadNutritionPlan == true)
                          Container(
                            width: 118.0,
                            height: 124.0,
                            decoration: BoxDecoration(
                              color: Color(0x80000000),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: CircularPercentIndicator(
                              percent: 0.5,
                              radius: 50.0,
                              lineWidth: 3.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              center: Text(
                                'Загрузка ...',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width >=
                                                  380.0
                                              ? 16.0
                                              : 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(70.0, 19.0, 71.0, 16.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if ((_model.isPlanUploaded == true) &&
                          (_model.isDataUploading_uploadNutritionPlan ==
                              false)) {
                        // Set PDF URL in trainingplantemp
                        await NutritionPlansMarketTempTable().update(
                          data: {
                            'nutrition_plan_file':
                                _model.uploadedFileUrl_uploadNutritionPlan,
                          },
                          matchingRows: (rows) => rows
                              .eqOrNull(
                                'trainer_id',
                                currentUserUid,
                              )
                              .eqOrNull(
                                'id',
                                widget.tempId,
                              ),
                        );
                        Navigator.pop(context);
                        return;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Подождите, файл загружается...',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        return;
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width >= 380.0
                          ? 48.0
                          : 42.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            valueOrDefault<Color>(
                              _model.isDataUploading_uploadNutritionPlan == true
                                  ? Color(0xFFB0B0B0)
                                  : Color(0xFF7B43CE),
                              Color(0xFF7B43CE),
                            ),
                            valueOrDefault<Color>(
                              _model.isDataUploading_uploadNutritionPlan == true
                                  ? Color(0xFFB0B0B0)
                                  : Color(0xFFFF740F),
                              Color(0xFFFF740F),
                            )
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.69, -1.0),
                          end: AlignmentDirectional(-0.69, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              _model.isDataUploading_uploadNutritionPlan == true
                                  ? 'Загрузка . .'
                                  : 'Сохранить',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize:
                                        MediaQuery.sizeOf(context).width >=
                                                380.0
                                            ? 16.0
                                            : 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
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
        );
      },
    );
  }
}
