import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach/app_bar_coach_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'coach_anketa_widget.dart' show CoachAnketaWidget;
import 'package:flutter/material.dart';

class CoachAnketaModel extends FlutterFlowModel<CoachAnketaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in CoachAnketa widget.
  List<ChatMessagesRow>? checkUnreadMessagesTrainer1;
  // Model for AppBarCoach component.
  late AppBarCoachModel appBarCoachModel;
  // State field(s) for CoachNameTextField widget.
  FocusNode? coachNameTextFieldFocusNode;
  TextEditingController? coachNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      coachNameTextFieldTextControllerValidator;
  String? _coachNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for CoachSurnameTextField widget.
  FocusNode? coachSurnameTextFieldFocusNode;
  TextEditingController? coachSurnameTextFieldTextController;
  String? Function(BuildContext, String?)?
      coachSurnameTextFieldTextControllerValidator;
  String? _coachSurnameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for CoachNickTextField widget.
  FocusNode? coachNickTextFieldFocusNode;
  TextEditingController? coachNickTextFieldTextController;
  String? Function(BuildContext, String?)?
      coachNickTextFieldTextControllerValidator;
  // State field(s) for CoachEmailTextField widget.
  FocusNode? coachEmailTextFieldFocusNode;
  TextEditingController? coachEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      coachEmailTextFieldTextControllerValidator;
  // State field(s) for CoachPhoneTextField widget.
  FocusNode? coachPhoneTextFieldFocusNode;
  TextEditingController? coachPhoneTextFieldTextController;
  String? Function(BuildContext, String?)?
      coachPhoneTextFieldTextControllerValidator;
  String? _coachPhoneTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }

    return null;
  }

  // State field(s) for CoachSpecialty widget.
  FocusNode? coachSpecialtyFocusNode;
  TextEditingController? coachSpecialtyTextController;
  String? Function(BuildContext, String?)?
      coachSpecialtyTextControllerValidator;
  String? _coachSpecialtyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for CoachExpirience widget.
  FocusNode? coachExpirienceFocusNode;
  TextEditingController? coachExpirienceTextController;
  String? Function(BuildContext, String?)?
      coachExpirienceTextControllerValidator;
  String? _coachExpirienceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // State field(s) for CoachHourPrice widget.
  FocusNode? coachHourPriceFocusNode;
  TextEditingController? coachHourPriceTextController;
  String? Function(BuildContext, String?)?
      coachHourPriceTextControllerValidator;
  String? _coachHourPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for CoachShortDescription widget.
  FocusNode? coachShortDescriptionFocusNode;
  TextEditingController? coachShortDescriptionTextController;
  String? Function(BuildContext, String?)?
      coachShortDescriptionTextControllerValidator;
  String? _coachShortDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 12) {
      return 'Requires at least 12 characters.';
    }

    return null;
  }

  bool isDataUploading_uploadVideo = false;
  FFUploadedFile uploadedLocalFile_uploadVideo =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadVideo = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in UploadCoachPassport widget.
  List<TrainerProfileRow>? videoUploaded;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarCoachModel = createModel(context, () => AppBarCoachModel());
    coachNameTextFieldTextControllerValidator =
        _coachNameTextFieldTextControllerValidator;
    coachSurnameTextFieldTextControllerValidator =
        _coachSurnameTextFieldTextControllerValidator;
    coachPhoneTextFieldTextControllerValidator =
        _coachPhoneTextFieldTextControllerValidator;
    coachSpecialtyTextControllerValidator =
        _coachSpecialtyTextControllerValidator;
    coachExpirienceTextControllerValidator =
        _coachExpirienceTextControllerValidator;
    coachHourPriceTextControllerValidator =
        _coachHourPriceTextControllerValidator;
    coachShortDescriptionTextControllerValidator =
        _coachShortDescriptionTextControllerValidator;
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarCoachModel.dispose();
    coachNameTextFieldFocusNode?.dispose();
    coachNameTextFieldTextController?.dispose();

    coachSurnameTextFieldFocusNode?.dispose();
    coachSurnameTextFieldTextController?.dispose();

    coachNickTextFieldFocusNode?.dispose();
    coachNickTextFieldTextController?.dispose();

    coachEmailTextFieldFocusNode?.dispose();
    coachEmailTextFieldTextController?.dispose();

    coachPhoneTextFieldFocusNode?.dispose();
    coachPhoneTextFieldTextController?.dispose();

    coachSpecialtyFocusNode?.dispose();
    coachSpecialtyTextController?.dispose();

    coachExpirienceFocusNode?.dispose();
    coachExpirienceTextController?.dispose();

    coachHourPriceFocusNode?.dispose();
    coachHourPriceTextController?.dispose();

    coachShortDescriptionFocusNode?.dispose();
    coachShortDescriptionTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
