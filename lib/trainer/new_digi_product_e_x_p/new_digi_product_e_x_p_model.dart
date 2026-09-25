import '/components_client/app_bar_new/app_bar_new_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_digi_product_e_x_p_widget.dart' show NewDigiProductEXPWidget;
import 'package:flutter/material.dart';

class NewDigiProductEXPModel extends FlutterFlowModel<NewDigiProductEXPWidget> {
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

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in NewDigiProductEXP widget.
  List<String>? refreshDigiProdPhotosRESULT;
  // Model for AppBarNew component.
  late AppBarNewModel appBarNewModel;
  bool isDataUploading_uploadDataDPNEW = false;
  FFUploadedFile uploadedLocalFile_uploadDataDPNEW =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in DigiprodCreatedContainer widget.
  bool? photoSizeResultDPCHECK;
  // Stores action output result for [Custom Action - uploadTempDigiProdPhoto] action in DigiprodCreatedContainer widget.
  String? uploadTempDigiProdPhotoRESULTdp;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in DigiprodCreatedContainer widget.
  List<String>? refreshTempDigiProdPhotosRESULTdp;
  // State field(s) for PageViewUPLOADEDdp widget.
  PageController? pageViewUPLOADEDdpController;

  int get pageViewUPLOADEDdpCurrentIndex =>
      pageViewUPLOADEDdpController != null &&
              pageViewUPLOADEDdpController!.hasClients &&
              pageViewUPLOADEDdpController!.page != null
          ? pageViewUPLOADEDdpController!.page!.round()
          : 0;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in CircleImage widget.
  List<String>? refreshTempDigiProdPhotosDEL;
  bool isDataUploading_uploadDataDPEDIT = false;
  FFUploadedFile uploadedLocalFile_uploadDataDPEDIT =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in Image widget.
  bool? replacePhotoSizeDPResult;
  // Stores action output result for [Custom Action - replaceTempDigiProdPhoto] action in Image widget.
  String? replacePhotoUploadDPResult;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in Image widget.
  List<String>? freshPhotosDP;
  bool isDataUploading_uploadDataDP01 = false;
  FFUploadedFile uploadedLocalFile_uploadDataDP01 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Custom Action - checkImageFileSizeAction] action in DigiProdNOTCreated widget.
  bool? photoSizeResultCHECKdpnot;
  // Stores action output result for [Custom Action - uploadTempDigiProdPhoto] action in DigiProdNOTCreated widget.
  String? uploadTempDigiProdPhotoRESULTdpnot;
  // Stores action output result for [Custom Action - refreshTempDigiProdPhotos] action in DigiProdNOTCreated widget.
  List<String>? refreshTempDigiProdPhotosRESULTdpnot;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DigiProdNameField widget.
  FocusNode? digiProdNameFieldFocusNode;
  TextEditingController? digiProdNameFieldTextController;
  String? Function(BuildContext, String?)?
      digiProdNameFieldTextControllerValidator;
  String? _digiProdNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 5-ти знаков';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }

    return null;
  }

  // State field(s) for DigiProdDescriptionField widget.
  FocusNode? digiProdDescriptionFieldFocusNode;
  TextEditingController? digiProdDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      digiProdDescriptionFieldTextControllerValidator;
  String? _digiProdDescriptionFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 10-ти знаков';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for DigiProdPriceField widget.
  FocusNode? digiProdPriceFieldFocusNode;
  TextEditingController? digiProdPriceFieldTextController;
  String? Function(BuildContext, String?)?
      digiProdPriceFieldTextControllerValidator;
  String? _digiProdPriceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Не менее 4-х цифр';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - publishDigiProd] action in CheckAndPublishContainer widget.
  bool? publishDigiProdRESULT;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarNewModel = createModel(context, () => AppBarNewModel());
    digiProdNameFieldTextControllerValidator =
        _digiProdNameFieldTextControllerValidator;
    digiProdDescriptionFieldTextControllerValidator =
        _digiProdDescriptionFieldTextControllerValidator;
    digiProdPriceFieldTextControllerValidator =
        _digiProdPriceFieldTextControllerValidator;
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarNewModel.dispose();
    digiProdNameFieldFocusNode?.dispose();
    digiProdNameFieldTextController?.dispose();

    digiProdDescriptionFieldFocusNode?.dispose();
    digiProdDescriptionFieldTextController?.dispose();

    digiProdPriceFieldFocusNode?.dispose();
    digiProdPriceFieldTextController?.dispose();

    tapBarTrainerModel.dispose();
  }
}
