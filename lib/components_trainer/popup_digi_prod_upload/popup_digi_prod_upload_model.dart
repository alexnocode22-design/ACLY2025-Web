import '/flutter_flow/flutter_flow_util.dart';
import 'popup_digi_prod_upload_widget.dart' show PopupDigiProdUploadWidget;
import 'package:flutter/material.dart';

class PopupDigiProdUploadModel
    extends FlutterFlowModel<PopupDigiProdUploadWidget> {
  ///  Local state fields for this component.

  bool isPlanUploaded = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDigiProd = false;
  FFUploadedFile uploadedLocalFile_uploadDigiProd =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDigiProd = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
