import '/flutter_flow/flutter_flow_util.dart';
import 'popup_training_plan_p_d_f_upload_widget.dart'
    show PopupTrainingPlanPDFUploadWidget;
import 'package:flutter/material.dart';

class PopupTrainingPlanPDFUploadModel
    extends FlutterFlowModel<PopupTrainingPlanPDFUploadWidget> {
  ///  Local state fields for this component.

  bool isPlanUploaded = false;

  bool isUploading = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadTrainingPlan = false;
  FFUploadedFile uploadedLocalFile_uploadTrainingPlan =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadTrainingPlan = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
