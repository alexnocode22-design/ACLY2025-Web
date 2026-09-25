import '/components_client/app_bar_new/app_bar_new_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_training_plan_e_x_p_widget.dart' show NewTrainingPlanEXPWidget;
import 'package:flutter/material.dart';

class NewTrainingPlanEXPModel
    extends FlutterFlowModel<NewTrainingPlanEXPWidget> {
  ///  Local state fields for this page.

  int? tempId = 0;

  List<String> tempPhotos = [];
  void addToTempPhotos(String item) => tempPhotos.add(item);
  void removeFromTempPhotos(String item) => tempPhotos.remove(item);
  void removeAtIndexFromTempPhotos(int index) => tempPhotos.removeAt(index);
  void insertAtIndexInTempPhotos(int index, String item) =>
      tempPhotos.insert(index, item);
  void updateTempPhotosAtIndex(int index, Function(String) updateFn) =>
      tempPhotos[index] = updateFn(tempPhotos[index]);

  List<String> freshPhotos = [];
  void addToFreshPhotos(String item) => freshPhotos.add(item);
  void removeFromFreshPhotos(String item) => freshPhotos.remove(item);
  void removeAtIndexFromFreshPhotos(int index) => freshPhotos.removeAt(index);
  void insertAtIndexInFreshPhotos(int index, String item) =>
      freshPhotos.insert(index, item);
  void updateFreshPhotosAtIndex(int index, Function(String) updateFn) =>
      freshPhotos[index] = updateFn(freshPhotos[index]);

  bool photoSizeResult = false;

  String? photoUploadResult;

  FFUploadedFile? uploadedFile;

  bool publishResult = false;

  int selectedPhotoIndex = 0;

  bool replacePhotoSizeResult = false;

  String replacePhotoUploadResult = '\'\'';

  FFUploadedFile? replaceUploadedFile;

  bool deleteConfirmedTP = false;

  bool isPublishing = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in NewTrainingPlanEXP widget.
  List<String>? refreshTempPlanPhotosRESULT;
  // Model for AppBarNew component.
  late AppBarNewModel appBarNewModel;
  bool isDataUploading_uploadDataTPNEW = false;
  FFUploadedFile uploadedLocalFile_uploadDataTPNEW =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in TrainingPlanCreatedContainer widget.
  bool? photoSizeResultTPCHECK;
  // Stores action output result for [Custom Action - uploadTempTrainingPlanPhoto] action in TrainingPlanCreatedContainer widget.
  String? uploadTempTrainingPlanPhotoRESULTtp;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in TrainingPlanCreatedContainer widget.
  List<String>? refreshTempPlanPhotosRESULTtp;
  // State field(s) for PageViewUPLOADEDtp widget.
  PageController? pageViewUPLOADEDtpController;

  int get pageViewUPLOADEDtpCurrentIndex =>
      pageViewUPLOADEDtpController != null &&
              pageViewUPLOADEDtpController!.hasClients &&
              pageViewUPLOADEDtpController!.page != null
          ? pageViewUPLOADEDtpController!.page!.round()
          : 0;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in CircleImage widget.
  List<String>? refreshTempPlanPhotosDEL;
  bool isDataUploading_uploadDataTPEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataTPEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? replacePhotoSizeTPResult;
  // Stores action output result for [Custom Action - replaceTempTrainingPlanPhoto] action in Image widget.
  String? replacePhotoUploadTPResult;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in Image widget.
  List<String>? freshPhotosTP;
  bool isDataUploading_uploadData01 = false;
  FFUploadedFile uploadedLocalFile_uploadData01 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in TrainingPlanNOTCreated widget.
  bool? photoSizeResultCHECKtpnot;
  // Stores action output result for [Custom Action - uploadTempTrainingPlanPhoto] action in TrainingPlanNOTCreated widget.
  String? uploadTempTrainingPlanPhotoRESULTtpnot;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in TrainingPlanNOTCreated widget.
  List<String>? refreshTempPlanPhotosRESULTtpnot;
  // State field(s) for PageViewEMPTYtp widget.
  PageController? pageViewEMPTYtpController;

  int get pageViewEMPTYtpCurrentIndex => pageViewEMPTYtpController != null &&
          pageViewEMPTYtpController!.hasClients &&
          pageViewEMPTYtpController!.page != null
      ? pageViewEMPTYtpController!.page!.round()
      : 0;
  // State field(s) for TrainingPlanNameField widget.
  FocusNode? trainingPlanNameFieldFocusNode;
  TextEditingController? trainingPlanNameFieldTextController;
  String? Function(BuildContext, String?)?
      trainingPlanNameFieldTextControllerValidator;
  String? _trainingPlanNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 5-ти знаков';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for TrainingPlanDescriptionField widget.
  FocusNode? trainingPlanDescriptionFieldFocusNode;
  TextEditingController? trainingPlanDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      trainingPlanDescriptionFieldTextControllerValidator;
  String? _trainingPlanDescriptionFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 10-ти знаков';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for SlotPriceField widget.
  FocusNode? slotPriceFieldFocusNode;
  TextEditingController? slotPriceFieldTextController;
  String? Function(BuildContext, String?)?
      slotPriceFieldTextControllerValidator;
  String? _slotPriceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 4-х цифр';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - publishTrainingPlan] action in CheckAndPublishContainer widget.
  bool? publishTrainingPlanRESULT;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarNewModel = createModel(context, () => AppBarNewModel());
    trainingPlanNameFieldTextControllerValidator =
        _trainingPlanNameFieldTextControllerValidator;
    trainingPlanDescriptionFieldTextControllerValidator =
        _trainingPlanDescriptionFieldTextControllerValidator;
    slotPriceFieldTextControllerValidator =
        _slotPriceFieldTextControllerValidator;
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarNewModel.dispose();
    trainingPlanNameFieldFocusNode?.dispose();
    trainingPlanNameFieldTextController?.dispose();

    trainingPlanDescriptionFieldFocusNode?.dispose();
    trainingPlanDescriptionFieldTextController?.dispose();

    slotPriceFieldFocusNode?.dispose();
    slotPriceFieldTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
