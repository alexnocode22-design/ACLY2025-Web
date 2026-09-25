import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'popup_coach_scans_upload_model.dart';
export 'popup_coach_scans_upload_model.dart';

class PopupCoachScansUploadWidget extends StatefulWidget {
  const PopupCoachScansUploadWidget({super.key});

  @override
  State<PopupCoachScansUploadWidget> createState() =>
      _PopupCoachScansUploadWidgetState();
}

class _PopupCoachScansUploadWidgetState
    extends State<PopupCoachScansUploadWidget> {
  late PopupCoachScansUploadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupCoachScansUploadModel());

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
          height: 640.0,
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
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert1 = true);
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
                              _model.isDataUploading_trainerCert1 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert1 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert1 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded1 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert1,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded1
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert1,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert1,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert2 = true);
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
                              _model.isDataUploading_trainerCert2 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert2 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert2 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded2 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert2,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded1
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert2,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert2,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert3 = true);
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
                              _model.isDataUploading_trainerCert3 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert3 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert3 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded3 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert3,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded3
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert3,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert3,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert4 = true);
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
                              _model.isDataUploading_trainerCert4 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert4 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert4 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded4 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert4,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded4
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert4,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert4,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert5 = true);
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
                              _model.isDataUploading_trainerCert5 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert5 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert5 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded5 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert5,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded5
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert5,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert5,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert6 = true);
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
                              _model.isDataUploading_trainerCert6 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert6 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert6 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded6 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert6,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded6
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert6,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert6,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert7 = true);
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
                              _model.isDataUploading_trainerCert7 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert7 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert7 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded7 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert7,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded7
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert7,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert7,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert8 = true);
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
                              _model.isDataUploading_trainerCert8 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert8 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert8 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded4 = true;
                          _model.isScanUploaded8 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert8,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded8
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert8,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert8,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert9 = true);
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
                              _model.isDataUploading_trainerCert9 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert9 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert9 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded9 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert9,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded9
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert9,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert9,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 118.0,
                      height: 82.0,
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
                                _model.isDataUploading_trainerCert10 = true);
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
                              _model.isDataUploading_trainerCert10 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_trainerCert10 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_trainerCert10 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          // Update comp State to -TRUE
                          _model.isScanUploaded10 = true;
                          safeSetState(() {});
                          // Delete Current Photo
                          await actions.deleteFileURL(
                            'acly-trainers',
                            containerTrainerProfileRow?.trainerCert10,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.isScanUploaded10
                                  ? valueOrDefault<String>(
                                      _model.uploadedFileUrl_trainerCert10,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    )
                                  : valueOrDefault<String>(
                                      containerTrainerProfileRow?.trainerCert10,
                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                                    ),
                              'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/empty_landscape.png',
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
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
                      if (_model.isScanUploaded1 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert1':
                                _model.uploadedFileUrl_trainerCert1,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded2 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert2':
                                _model.uploadedFileUrl_trainerCert2,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded3 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert3':
                                _model.uploadedFileUrl_trainerCert3,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded4 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert4':
                                _model.uploadedFileUrl_trainerCert4,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded5 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert5':
                                _model.uploadedFileUrl_trainerCert5,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded6 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert6':
                                _model.uploadedFileUrl_trainerCert6,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded7 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert7':
                                _model.uploadedFileUrl_trainerCert7,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded8 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert8':
                                _model.uploadedFileUrl_trainerCert8,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded9 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert9':
                                _model.isDataUploading_trainerCert9.toString(),
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'trainer_id',
                            currentUserUid,
                          ),
                        );
                      }
                      if (_model.isScanUploaded10 == true) {
                        // Set Cert1 URL in trainer_profile
                        await TrainerProfileTable().update(
                          data: {
                            'trainer_cert10':
                                _model.uploadedFileUrl_trainerCert10,
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
