import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'popup_coach_pass_upload_model.dart';
export 'popup_coach_pass_upload_model.dart';

class PopupCoachPassUploadWidget extends StatefulWidget {
  const PopupCoachPassUploadWidget({super.key});

  @override
  State<PopupCoachPassUploadWidget> createState() =>
      _PopupCoachPassUploadWidgetState();
}

class _PopupCoachPassUploadWidgetState
    extends State<PopupCoachPassUploadWidget> {
  late PopupCoachPassUploadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupCoachPassUploadModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TrainerProfileRow>>(
      future: TrainerProfileTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'trainer_id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Image.asset(
            'assets/images/logosmall.png',
          );
        }
        List<TrainerProfileRow> containerTrainerProfileRowList = snapshot.data!;

        final containerTrainerProfileRow =
            containerTrainerProfileRowList.isNotEmpty
                ? containerTrainerProfileRowList.first
                : null;

        return Container(
          width: double.infinity,
          height: 392.0,
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
                    Container(
                      width: 186.0,
                      height: 233.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            storageFolderPath: currentUserUid,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() =>
                                _model.isDataUploading_trainerPassport = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
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

                              downloadUrls = await uploadSupabaseStorageFiles(
                                bucketName: 'acly-trainers',
                                selectedFiles: selectedMedia,
                              );
                            } finally {
                              _model.isDataUploading_trainerPassport = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerPassport =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerPassport =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isPassportUploaded = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerPassport,
                          );
                          await TrainerProfileTable().update(
                            data: {
                              'trainer_passport':
                                  _model.uploadedFileUrl_trainerPassport,
                            },
                            matchingRows: (rows) => rows.eqOrNull(
                              'trainer_id',
                              currentUserUid,
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isPassportUploaded
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerPassport,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/pass_blanc.jpg',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow
                                          ?.trainerPassport,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/pass_blanc.jpg',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/pass_blanc.jpg',
                            ),
                            width: 336.0,
                            height: 495.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
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
                      if (_model.isPassportUploaded) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_passport':
                                _model.uploadedFileUrl_trainerPassport,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width >= 380.0
                          ? 48.0
                          : 42.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF7B43CE), Color(0xFFFF740F)],
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
                              'Сохранить',
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
