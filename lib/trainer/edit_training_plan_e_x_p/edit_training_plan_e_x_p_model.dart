import '/components_trainer/app_bar_edit_training/app_bar_edit_training_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_training_plan_e_x_p_widget.dart' show EditTrainingPlanEXPWidget;
import 'package:flutter/material.dart';

class EditTrainingPlanEXPModel
    extends FlutterFlowModel<EditTrainingPlanEXPWidget> {
  ///  Local state fields for this page.

  int tempId = 0;

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

  String photoUploadResult = '\'\'';

  int selectedPhotoIndex = 0;

  FFUploadedFile? replaceUploadedFile;

  bool replacePhotoSizeResult = false;

  String replacePhotoUploadResult = '\'\'';

  bool publishResult = false;

  FFUploadedFile? uploadedFile;

  bool isPublishing = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - initOrResumeEditTrainingPlan] action in EditTrainingPlanEXP widget.
  int? initOrResumeEditTrainingPlanRESULT;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in EditTrainingPlanEXP widget.
  List<String>? refreshTempPlanPhotosINIT;
  // Model for AppBarEditTraining component.
  late AppBarEditTrainingModel appBarEditTrainingModel;
  bool isDataUploading_uploadDataTPEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataTPEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in TrainingPlanEditContainer widget.
  bool? photoSizeResultTPEDIT;
  // Stores action output result for [Custom Action - uploadTempTrainingPlanPhoto] action in TrainingPlanEditContainer widget.
  String? uploadTempTrainingPlanPhotoEDIT;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in TrainingPlanEditContainer widget.
  List<String>? refreshTempPlanPhotosEDIT;
  // State field(s) for PageViewEditUPLOADED widget.
  PageController? pageViewEditUPLOADEDController;

  int get pageViewEditUPLOADEDCurrentIndex =>
      pageViewEditUPLOADEDController != null &&
              pageViewEditUPLOADEDController!.hasClients &&
              pageViewEditUPLOADEDController!.page != null
          ? pageViewEditUPLOADEDController!.page!.round()
          : 0;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in CircleImage widget.
  List<String>? refreshTempPlanPhotosDEL;
  bool isDataUploading_uploadDataTPEDITReplace = false;
  FFUploadedFile uploadedLocalFile_uploadDataTPEDITReplace =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? replacePhotoSizeTPEDIT;
  // Stores action output result for [Custom Action - replaceTempTrainingPlanPhoto] action in Image widget.
  String? replacePhotoUploadTPEDIT;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in Image widget.
  List<String>? freshPhotosTPEDIT;
  bool isDataUploading_uploadData01tpEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadData01tpEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in EmptPhotoContainer widget.
  bool? photoSizeResultCHECKtpEDIT;
  // Stores action output result for [Custom Action - uploadTempTrainingPlanPhoto] action in EmptPhotoContainer widget.
  String? uploadTempTrainingPlanPhotoRESULTtpEDIT;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in EmptPhotoContainer widget.
  List<String>? refreshTempPlanPhotosRESULTtpEDIT;
  // State field(s) for TrainingNameField widget.
  FocusNode? trainingNameFieldFocusNode;
  TextEditingController? trainingNameFieldTextController;
  String? Function(BuildContext, String?)?
      trainingNameFieldTextControllerValidator;
  // State field(s) for TrainingDescriptionField widget.
  FocusNode? trainingDescriptionFieldFocusNode;
  TextEditingController? trainingDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      trainingDescriptionFieldTextControllerValidator;
  // State field(s) for SlotPriceField widget.
  FocusNode? slotPriceFieldFocusNode;
  TextEditingController? slotPriceFieldTextController;
  String? Function(BuildContext, String?)?
      slotPriceFieldTextControllerValidator;
  // Stores action output result for [Custom Action - publishTrainingPlan] action in CheckAndPublishContainer widget.
  bool? publishTrainingPlanEDIT;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarEditTrainingModel =
        createModel(context, () => AppBarEditTrainingModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarEditTrainingModel.dispose();
    trainingNameFieldFocusNode?.dispose();
    trainingNameFieldTextController?.dispose();

    trainingDescriptionFieldFocusNode?.dispose();
    trainingDescriptionFieldTextController?.dispose();

    slotPriceFieldFocusNode?.dispose();
    slotPriceFieldTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
