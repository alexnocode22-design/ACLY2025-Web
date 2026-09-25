import '/components_client/app_bar_new/app_bar_new_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_nutrition_plan_e_x_p_widget.dart' show NewNutritionPlanEXPWidget;
import 'package:flutter/material.dart';

class NewNutritionPlanEXPModel
    extends FlutterFlowModel<NewNutritionPlanEXPWidget> {
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

  String photoUploadResult = '\'\'';

  bool photoSizeResult = false;

  int selectedPhotoIndex = 0;

  bool replacePhotoSizeResult = false;

  String replacePhotoUploadResult = '\'\'';

  bool publishResult = false;

  FFUploadedFile? uploadedFile;

  FFUploadedFile? replaceUploadedFile;

  bool isPublishing = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in NewNutritionPlanEXP widget.
  List<String>? freshPhotosNP;
  // Model for AppBarNew component.
  late AppBarNewModel appBarNewModel;
  bool isDataUploading_uploadDataNPNEW = false;
  FFUploadedFile uploadedLocalFile_uploadDataNPNEW =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in NutritionPlanCreatedContainer widget.
  bool? photoSizeResultNPCHECK;
  // Stores action output result for [Custom Action - uploadTempNutritionPhoto] action in NutritionPlanCreatedContainer widget.
  String? uploadTempNutritionPlanPhotoRESULTnp;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in NutritionPlanCreatedContainer widget.
  List<String>? refreshTempPlanPhotosRESULTnp;
  // State field(s) for PageViewUPLOADEDnp widget.
  PageController? pageViewUPLOADEDnpController;

  int get pageViewUPLOADEDnpCurrentIndex =>
      pageViewUPLOADEDnpController != null &&
              pageViewUPLOADEDnpController!.hasClients &&
              pageViewUPLOADEDnpController!.page != null
          ? pageViewUPLOADEDnpController!.page!.round()
          : 0;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in CircleImage widget.
  List<String>? refreshTempNutritionPlanPhotosDEL;
  bool isDataUploading_uploadDataNPEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataNPEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? replacePhotoSizeNPResult;
  // Stores action output result for [Custom Action - replaceTempNutritionPhoto] action in Image widget.
  String? replacePhotoUploadNPResult;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in Image widget.
  List<String>? freshNutritionPhotosNP;
  bool isDataUploading_uploadDataNP01 = false;
  FFUploadedFile uploadedLocalFile_uploadDataNP01 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in NutritionPlanNOTCreated widget.
  bool? photoSizeResultCHECKnpnot;
  // Stores action output result for [Custom Action - uploadTempNutritionPhoto] action in NutritionPlanNOTCreated widget.
  String? uploadTempNutritionPlanPhotoRESULTnpnot;
  // Stores action output result for [Custom Action - refreshTempNutritionPhotos] action in NutritionPlanNOTCreated widget.
  List<String>? refreshTempPlanPhotosRESULTnpnot;
  // State field(s) for PageViewEMPTYnp widget.
  PageController? pageViewEMPTYnpController;

  int get pageViewEMPTYnpCurrentIndex => pageViewEMPTYnpController != null &&
          pageViewEMPTYnpController!.hasClients &&
          pageViewEMPTYnpController!.page != null
      ? pageViewEMPTYnpController!.page!.round()
      : 0;
  // State field(s) for NutritionNameField widget.
  FocusNode? nutritionNameFieldFocusNode;
  TextEditingController? nutritionNameFieldTextController;
  String? Function(BuildContext, String?)?
      nutritionNameFieldTextControllerValidator;
  String? _nutritionNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 5-ти знаков';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for NutritionDescriptionField widget.
  FocusNode? nutritionDescriptionFieldFocusNode;
  TextEditingController? nutritionDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      nutritionDescriptionFieldTextControllerValidator;
  String? _nutritionDescriptionFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 10-ти знаков';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for NutritionPriceField widget.
  FocusNode? nutritionPriceFieldFocusNode;
  TextEditingController? nutritionPriceFieldTextController;
  String? Function(BuildContext, String?)?
      nutritionPriceFieldTextControllerValidator;
  String? _nutritionPriceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 4-х цифр';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - publishNutritionPlan] action in CheckAndPublishContainer widget.
  bool? publishNutritionPlanRESULT;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarNewModel = createModel(context, () => AppBarNewModel());
    nutritionNameFieldTextControllerValidator =
        _nutritionNameFieldTextControllerValidator;
    nutritionDescriptionFieldTextControllerValidator =
        _nutritionDescriptionFieldTextControllerValidator;
    nutritionPriceFieldTextControllerValidator =
        _nutritionPriceFieldTextControllerValidator;
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarNewModel.dispose();
    nutritionNameFieldFocusNode?.dispose();
    nutritionNameFieldTextController?.dispose();

    nutritionDescriptionFieldFocusNode?.dispose();
    nutritionDescriptionFieldTextController?.dispose();

    nutritionPriceFieldFocusNode?.dispose();
    nutritionPriceFieldTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
