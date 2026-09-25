import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_profile/app_bar_profile_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_profile_widget.dart' show ClientProfileWidget;
import 'package:flutter/material.dart';

class ClientProfileModel extends FlutterFlowModel<ClientProfileWidget> {
  ///  Local state fields for this page.

  bool isNewImgUploaded = false;

  String mon1Time = '08:00:00';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in ClientProfile widget.
  List<ChatMessagesRow>? checkUnreadMessages1;
  bool isDataUploading_userPhoto = false;
  FFUploadedFile uploadedLocalFile_userPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_userPhoto = '';

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for SurnameTextField widget.
  FocusNode? surnameTextFieldFocusNode;
  TextEditingController? surnameTextFieldTextController;
  String? Function(BuildContext, String?)?
      surnameTextFieldTextControllerValidator;
  String? _surnameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for NickTextField widget.
  FocusNode? nickTextFieldFocusNode;
  TextEditingController? nickTextFieldTextController;
  String? Function(BuildContext, String?)? nickTextFieldTextControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for PhoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  String? _phoneTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PassTextField widget.
  FocusNode? passTextFieldFocusNode;
  TextEditingController? passTextFieldTextController;
  String? Function(BuildContext, String?)? passTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveUserData widget.
  List<UserProfileRow>? updateUserProfile;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveUserData widget.
  List<UserProfileRow>? updateUserPhoto;
  // Stores action output result for [Backend Call - Query Rows] action in SetTrainerContainer widget.
  List<TrainerProfileRow>? trainerProfileExists;
  // Stores action output result for [Backend Call - Insert Row] action in SetTrainerContainer widget.
  TrainerProfileRow? createTrainerProfile;
  // Model for AppBarProfile component.
  late AppBarProfileModel appBarProfileModel;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    surnameTextFieldTextControllerValidator =
        _surnameTextFieldTextControllerValidator;
    phoneTextFieldTextControllerValidator =
        _phoneTextFieldTextControllerValidator;
    appBarProfileModel = createModel(context, () => AppBarProfileModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    surnameTextFieldFocusNode?.dispose();
    surnameTextFieldTextController?.dispose();

    nickTextFieldFocusNode?.dispose();
    nickTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    passTextFieldFocusNode?.dispose();
    passTextFieldTextController?.dispose();

    appBarProfileModel.dispose();
    tapBarClientModel.dispose();
  }
}
