import '/components_trainer/app_bar_edit_training/app_bar_edit_training_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_digital_product_e_x_p_widget.dart'
    show EditDigitalProductEXPWidget;
import 'package:flutter/material.dart';

class EditDigitalProductEXPModel
    extends FlutterFlowModel<EditDigitalProductEXPWidget> {
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

  int? selectedPhotoIndex = 0;

  bool replacePhotoSizeResult = false;

  String replacePhotoUploadResult = '\'\'';

  bool publishResult = false;

  FFUploadedFile? uploadedFile;

  FFUploadedFile? replaceUploadedFile;

  bool isPublishing = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - initOrResumeEditDigiProd] action in EditDigitalProductEXP widget.
  int? initOrResumeEditDigiProdRESULT;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in EditDigitalProductEXP widget.
  List<String>? refreshDigiProdPhotosINIT;
  // Model for AppBarEditTraining component.
  late AppBarEditTrainingModel appBarEditTrainingModel;
  bool isDataUploading_uploadDataDPEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataDPEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in DigiProdEditContainer widget.
  bool? photoSizeResultDPEDIT;
  // Stores action output result for [Custom Action - uploadTempDigiProdPhoto] action in DigiProdEditContainer widget.
  String? uploadTempDigiProdPhotoEDIT;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in DigiProdEditContainer widget.
  List<String>? refreshTempDigiProdPhotosEDIT;
  // State field(s) for PageViewEditUPLOADED widget.
  PageController? pageViewEditUPLOADEDController;

  int get pageViewEditUPLOADEDCurrentIndex =>
      pageViewEditUPLOADEDController != null &&
              pageViewEditUPLOADEDController!.hasClients &&
              pageViewEditUPLOADEDController!.page != null
          ? pageViewEditUPLOADEDController!.page!.round()
          : 0;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in CircleImage widget.
  List<String>? refreshDigiProdnPhotosDEL;
  bool isDataUploading_uploadDataDPEDITReplace = false;
  FFUploadedFile uploadedLocalFile_uploadDataDPEDITReplace =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? replacePhotoSizeDPEDIT;
  // Stores action output result for [Custom Action - replaceTempDigiProdPhoto] action in Image widget.
  String? replacePhotoUploadDPEDIT;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in Image widget.
  List<String>? freshPhotosDPEDIT;
  bool isDataUploading_uploadDataDP01EDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataDP01EDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in EmptPhotoContainer widget.
  bool? photoSizeResultCHECKdpEDIT;
  // Stores action output result for [Custom Action - uploadTempDigiProdPhoto] action in EmptPhotoContainer widget.
  String? uploadTempDigiProdPhotoRESULTdpEDIT;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in EmptPhotoContainer widget.
  List<String>? refreshTempDigiProdPhotosRESULTdpEDIT;
  // State field(s) for DigiProdNameField widget.
  FocusNode? digiProdNameFieldFocusNode;
  TextEditingController? digiProdNameFieldTextController;
  String? Function(BuildContext, String?)?
      digiProdNameFieldTextControllerValidator;
  // State field(s) for DigiProdDescriptionField widget.
  FocusNode? digiProdDescriptionFieldFocusNode;
  TextEditingController? digiProdDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      digiProdDescriptionFieldTextControllerValidator;
  // State field(s) for DigiProdPriceField widget.
  FocusNode? digiProdPriceFieldFocusNode;
  TextEditingController? digiProdPriceFieldTextController;
  String? Function(BuildContext, String?)?
      digiProdPriceFieldTextControllerValidator;
  // Stores action output result for [Custom Action - publishDigiProd] action in CheckAndPublishContainer widget.
  bool? publishDigiProdEDIT;
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
    digiProdNameFieldFocusNode?.dispose();
    digiProdNameFieldTextController?.dispose();

    digiProdDescriptionFieldFocusNode?.dispose();
    digiProdDescriptionFieldTextController?.dispose();

    digiProdPriceFieldFocusNode?.dispose();
    digiProdPriceFieldTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
