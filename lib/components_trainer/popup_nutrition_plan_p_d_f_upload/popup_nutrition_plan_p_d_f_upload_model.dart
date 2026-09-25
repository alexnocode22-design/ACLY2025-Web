import '/flutter_flow/flutter_flow_util.dart';
import 'popup_nutrition_plan_p_d_f_upload_widget.dart'
    show PopupNutritionPlanPDFUploadWidget;
import 'package:flutter/material.dart';

class PopupNutritionPlanPDFUploadModel
    extends FlutterFlowModel<PopupNutritionPlanPDFUploadWidget> {
  ///  Local state fields for this component.

  bool isPlanUploaded = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadNutritionPlan = false;
  FFUploadedFile uploadedLocalFile_uploadNutritionPlan =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadNutritionPlan = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
