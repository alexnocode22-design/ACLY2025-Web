import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_edit_training/app_bar_edit_training_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_training_e_x_p_widget.dart' show EditTrainingEXPWidget;
import 'package:flutter/material.dart';

class EditTrainingEXPModel extends FlutterFlowModel<EditTrainingEXPWidget> {
  ///  Local state fields for this page.

  int? trainingID;

  int tempId = 0;

  List<String> tempPhotosEXT = [];
  void addToTempPhotosEXT(String item) => tempPhotosEXT.add(item);
  void removeFromTempPhotosEXT(String item) => tempPhotosEXT.remove(item);
  void removeAtIndexFromTempPhotosEXT(int index) =>
      tempPhotosEXT.removeAt(index);
  void insertAtIndexInTempPhotosEXT(int index, String item) =>
      tempPhotosEXT.insert(index, item);
  void updateTempPhotosEXTAtIndex(int index, Function(String) updateFn) =>
      tempPhotosEXT[index] = updateFn(tempPhotosEXT[index]);

  int selectedSlotDuration = 60;

  List<String> freshPhotosEXT = [];
  void addToFreshPhotosEXT(String item) => freshPhotosEXT.add(item);
  void removeFromFreshPhotosEXT(String item) => freshPhotosEXT.remove(item);
  void removeAtIndexFromFreshPhotosEXT(int index) =>
      freshPhotosEXT.removeAt(index);
  void insertAtIndexInFreshPhotosEXT(int index, String item) =>
      freshPhotosEXT.insert(index, item);
  void updateFreshPhotosEXTAtIndex(int index, Function(String) updateFn) =>
      freshPhotosEXT[index] = updateFn(freshPhotosEXT[index]);

  int selectedPhotoIndex = 0;

  bool deleteConfirmed = false;

  FFUploadedFile? replaceUploadedFile;

  bool replacePhotoSizeResult = false;

  String replacePhotoUploadResult = '\'\'';

  List<String> tempPhotos = [];
  void addToTempPhotos(String item) => tempPhotos.add(item);
  void removeFromTempPhotos(String item) => tempPhotos.remove(item);
  void removeAtIndexFromTempPhotos(int index) => tempPhotos.removeAt(index);
  void insertAtIndexInTempPhotos(int index, String item) =>
      tempPhotos.insert(index, item);
  void updateTempPhotosAtIndex(int index, Function(String) updateFn) =>
      tempPhotos[index] = updateFn(tempPhotos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - initOrResumeEditTraining] action in EditTrainingEXP widget.
  int? editTraining;
  // Stores action output result for [Backend Call - Query Rows] action in EditTrainingEXP widget.
  List<TrainingsMarketTempRow>? editTrainingEXP;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in EditTrainingEXP widget.
  List<String>? freshPhotosEXTINIT;
  // Model for AppBarEditTraining component.
  late AppBarEditTrainingModel appBarEditTrainingModel;
  bool isDataUploading_uploadedFileEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadedFileEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in PhotoContainer widget.
  bool? photoSizeResultEDIT;
  // Stores action output result for [Custom Action - uploadTempTrainingPhoto] action in PhotoContainer widget.
  String? photoResultEDIT;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in PhotoContainer widget.
  List<String>? freshPhotosEDIT;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in CircleImage widget.
  List<String>? refreshTempPhotosEDITDELETE;
  bool isDataUploading_uploadedFileREPLACEEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadedFileREPLACEEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? uploadedFileREPLACERESULT;
  // Stores action output result for [Custom Action - replaceTempTrainingPhoto] action in Image widget.
  String? replacePhotoUploadResultOUTPUT;
  // Stores action output result for [Custom Action - refreshTempPhotos] action in Image widget.
  List<String>? freshPhotosEXTOUTPUT;
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
