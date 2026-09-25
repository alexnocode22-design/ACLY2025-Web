import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'popup_coach_photo_upload_widget.dart' show PopupCoachPhotoUploadWidget;
import 'package:flutter/material.dart';

class PopupCoachPhotoUploadModel
    extends FlutterFlowModel<PopupCoachPhotoUploadWidget> {
  ///  Local state fields for this component.

  bool isPhotoUploaded = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_trainerPhoto = false;
  FFUploadedFile uploadedLocalFile_trainerPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_trainerPhoto = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in SaveTrainingPhoto widget.
  List<UserProfileRow>? updateUserPhoto;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
