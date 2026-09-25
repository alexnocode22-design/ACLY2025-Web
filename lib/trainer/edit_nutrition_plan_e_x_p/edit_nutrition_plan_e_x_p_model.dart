import '/components_trainer/app_bar_edit_training/app_bar_edit_training_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_nutrition_plan_e_x_p_widget.dart' show EditNutritionPlanEXPWidget;
import 'package:flutter/material.dart';

class EditNutritionPlanEXPModel
    extends FlutterFlowModel<EditNutritionPlanEXPWidget> {
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

  String photoUploadResult = '\'\'';

  int selectedPhotoIndex = 0;

  FFUploadedFile? replaceUploadedFile;

  bool replacePhotoSizeResult = false;

  String replacePhotoUploadResult = '\'\'';

  bool publishResult = false;

  FFUploadedFile? uploadedFile;

  bool isPublishing = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - initOrResumeEditNutritionPlan] action in EditNutritionPlanEXP widget.
  int? initOrResumeEditNutritionPlanRESULT;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in EditNutritionPlanEXP widget.
  List<String>? refreshTempNutritionPlanPhotosINIT;
  // Model for AppBarEditTraining component.
  late AppBarEditTrainingModel appBarEditTrainingModel;
  bool isDataUploading_uploadDataNPEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataNPEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in NutritionPlanEditContainer widget.
  bool? photoSizeResultNPEDIT;
  // Stores action output result for [Custom Action - uploadTempNutritionPhoto] action in NutritionPlanEditContainer widget.
  String? uploadTempNutritionPlanPhotoEDIT;
  // Stores action output result for [Custom Action - refreshTempPlanPhotos] action in NutritionPlanEditContainer widget.
  List<String>? refreshTempNutritionPlanPhotosEDIT;
  // State field(s) for PageViewEditUPLOADED widget.
  PageController? pageViewEditUPLOADEDController;

  int get pageViewEditUPLOADEDCurrentIndex =>
      pageViewEditUPLOADEDController != null &&
              pageViewEditUPLOADEDController!.hasClients &&
              pageViewEditUPLOADEDController!.page != null
          ? pageViewEditUPLOADEDController!.page!.round()
          : 0;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in CircleImage widget.
  List<String>? refreshTempNutritionPlanPhotosDEL;
  bool isDataUploading_uploadDataNPEDITReplace = false;
  FFUploadedFile uploadedLocalFile_uploadDataNPEDITReplace =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? replacePhotoSizeNPEDIT;
  // Stores action output result for [Custom Action - replaceTempNutritionPhoto] action in Image widget.
  String? replacePhotoUploadNPEDIT;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in Image widget.
  List<String>? freshPhotosNPEDIT;
  bool isDataUploading_uploadDataNP01EDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataNP01EDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in EmptPhotoContainer widget.
  bool? photoSizeResultCHECKnpEDIT;
  // Stores action output result for [Custom Action - uploadTempNutritionPhoto] action in EmptPhotoContainer widget.
  String? uploadTempNutritionPlanPhotoRESULTnpEDIT;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in EmptPhotoContainer widget.
  List<String>? refreshTempPlanPhotosRESULTnpEDIT;
  // State field(s) for NutritionNameField widget.
  FocusNode? nutritionNameFieldFocusNode;
  TextEditingController? nutritionNameFieldTextController;
  String? Function(BuildContext, String?)?
      nutritionNameFieldTextControllerValidator;
  // State field(s) for NutritionDescriptionField widget.
  FocusNode? nutritionDescriptionFieldFocusNode;
  TextEditingController? nutritionDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      nutritionDescriptionFieldTextControllerValidator;
  // State field(s) for PriceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldTextController;
  String? Function(BuildContext, String?)? priceFieldTextControllerValidator;
  // Stores action output result for [Custom Action - publishNutritionPlan] action in CheckAndPublishContainer widget.
  bool? publishNutritionPlanEDIT;
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
    nutritionNameFieldFocusNode?.dispose();
    nutritionNameFieldTextController?.dispose();

    nutritionDescriptionFieldFocusNode?.dispose();
    nutritionDescriptionFieldTextController?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
