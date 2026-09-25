import '/components_trainer/app_bar_new_training/app_bar_new_training_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_training_e_x_p_widget.dart' show NewTrainingEXPWidget;
import 'package:flutter/material.dart';

class NewTrainingEXPModel extends FlutterFlowModel<NewTrainingEXPWidget> {
  ///  Local state fields for this page.

  int? tempId = -1;

  List<String> tempPhotos = [];
  void addToTempPhotos(String item) => tempPhotos.add(item);
  void removeFromTempPhotos(String item) => tempPhotos.remove(item);
  void removeAtIndexFromTempPhotos(int index) => tempPhotos.removeAt(index);
  void insertAtIndexInTempPhotos(int index, String item) =>
      tempPhotos.insert(index, item);
  void updateTempPhotosAtIndex(int index, Function(String) updateFn) =>
      tempPhotos[index] = updateFn(tempPhotos[index]);

  List<String> tempPhotosEXT = [];
  void addToTempPhotosEXT(String item) => tempPhotosEXT.add(item);
  void removeFromTempPhotosEXT(String item) => tempPhotosEXT.remove(item);
  void removeAtIndexFromTempPhotosEXT(int index) =>
      tempPhotosEXT.removeAt(index);
  void insertAtIndexInTempPhotosEXT(int index, String item) =>
      tempPhotosEXT.insert(index, item);
  void updateTempPhotosEXTAtIndex(int index, Function(String) updateFn) =>
      tempPhotosEXT[index] = updateFn(tempPhotosEXT[index]);

  String? draftJson;

  int selectedPhotoIndex = 0;

  FFUploadedFile? replaceUploadedFile;

  bool replacePhotoSizeResult = false;

  String replacePhotoUploadResult = '\'\'';

  List<String> freshPhotosTraining = [];
  void addToFreshPhotosTraining(String item) => freshPhotosTraining.add(item);
  void removeFromFreshPhotosTraining(String item) =>
      freshPhotosTraining.remove(item);
  void removeAtIndexFromFreshPhotosTraining(int index) =>
      freshPhotosTraining.removeAt(index);
  void insertAtIndexInFreshPhotosTraining(int index, String item) =>
      freshPhotosTraining.insert(index, item);
  void updateFreshPhotosTrainingAtIndex(int index, Function(String) updateFn) =>
      freshPhotosTraining[index] = updateFn(freshPhotosTraining[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - loadOrCreateTrainingDraft] action in NewTrainingEXP widget.
  String? draftJsonEXT;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in NewTrainingEXP widget.
  List<String>? freshPhotosEXT;
  // Model for AppBarNewTraining component.
  late AppBarNewTrainingModel appBarNewTrainingModel;
  bool isDataUploading_uploadedFileSECOND = false;
  FFUploadedFile uploadedLocalFile_uploadedFileSECOND =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in TrainingCreatedContainer widget.
  bool? photoSizeResult;
  // Stores action output result for [Custom Action - uploadTempTrainingPhoto] action in TrainingCreatedContainer widget.
  String? photoResult;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in TrainingCreatedContainer widget.
  List<String>? freshPhotos;
  // State field(s) for PageViewUPLOADEDt widget.
  PageController? pageViewUPLOADEDtController;

  int get pageViewUPLOADEDtCurrentIndex =>
      pageViewUPLOADEDtController != null &&
              pageViewUPLOADEDtController!.hasClients &&
              pageViewUPLOADEDtController!.page != null
          ? pageViewUPLOADEDtController!.page!.round()
          : 0;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in CircleImage widget.
  List<String>? refreshTempPhotosDEL;
  bool isDataUploading_uploadDataTEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataTEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? replacePhotoSizeTResult;
  // Stores action output result for [Custom Action - replaceTempTrainingPhoto] action in Image widget.
  String? replacePhotoUploadTResult;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in Image widget.
  List<String>? freshPhotosT;
  bool isDataUploading_uploadedFileEMPTY = false;
  FFUploadedFile uploadedLocalFile_uploadedFileEMPTY =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in TrainingNOTCreatedContainer widget.
  bool? photoSizeResult0;
  // Stores action output result for [Custom Action - uploadTempTrainingPhoto] action in TrainingNOTCreatedContainer widget.
  String? photoResultCopy0;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in TrainingNOTCreatedContainer widget.
  List<String>? freshPhotosCopy0;
  // State field(s) for PageViewEMPTYt widget.
  PageController? pageViewEMPTYtController;

  int get pageViewEMPTYtCurrentIndex => pageViewEMPTYtController != null &&
          pageViewEMPTYtController!.hasClients &&
          pageViewEMPTYtController!.page != null
      ? pageViewEMPTYtController!.page!.round()
      : 0;
  // State field(s) for TrainingNameField widget.
  FocusNode? trainingNameFieldFocusNode;
  TextEditingController? trainingNameFieldTextController;
  String? Function(BuildContext, String?)?
      trainingNameFieldTextControllerValidator;
  String? _trainingNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ввести название (Обязательно)';
    }

    if (val.length < 3) {
      return 'Не менее 3-х знаков';
    }
    if (val.length > 35) {
      return 'Не более 35 знаков';
    }

    return null;
  }

  // State field(s) for TrainingDescriptionField widget.
  FocusNode? trainingDescriptionFieldFocusNode;
  TextEditingController? trainingDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      trainingDescriptionFieldTextControllerValidator;
  String? _trainingDescriptionFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 10 знаков';
    }

    if (val.length < 10) {
      return 'Не менее 10 знаков';
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
      return 'Введите стоимость  (Обязательно)';
    }

    if (val.length < 4) {
      return 'Не менее 4-х цифр';
    }

    return null;
  }

  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarNewTrainingModel =
        createModel(context, () => AppBarNewTrainingModel());
    trainingNameFieldTextControllerValidator =
        _trainingNameFieldTextControllerValidator;
    trainingDescriptionFieldTextControllerValidator =
        _trainingDescriptionFieldTextControllerValidator;
    slotPriceFieldTextControllerValidator =
        _slotPriceFieldTextControllerValidator;
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarNewTrainingModel.dispose();
    trainingNameFieldFocusNode?.dispose();
    trainingNameFieldTextController?.dispose();

    trainingDescriptionFieldFocusNode?.dispose();
    trainingDescriptionFieldTextController?.dispose();

    slotPriceFieldFocusNode?.dispose();
    slotPriceFieldTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
