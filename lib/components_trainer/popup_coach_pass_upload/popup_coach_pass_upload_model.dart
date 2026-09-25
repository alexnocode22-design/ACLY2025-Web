import '/flutter_flow/flutter_flow_util.dart';
import 'popup_coach_pass_upload_widget.dart' show PopupCoachPassUploadWidget;
import 'package:flutter/material.dart';

class PopupCoachPassUploadModel
    extends FlutterFlowModel<PopupCoachPassUploadWidget> {
  ///  Local state fields for this component.

  bool isPassportUploaded = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_trainerPassport = false;
  FFUploadedFile uploadedLocalFile_trainerPassport =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_trainerPassport = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
