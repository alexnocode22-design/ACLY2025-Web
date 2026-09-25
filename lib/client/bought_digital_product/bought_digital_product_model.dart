import '/components_client/app_bar_bought_product/app_bar_bought_product_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bought_digital_product_widget.dart' show BoughtDigitalProductWidget;
import 'package:flutter/material.dart';

class BoughtDigitalProductModel
    extends FlutterFlowModel<BoughtDigitalProductWidget> {
  ///  Local state fields for this page.

  bool isNewTrainingCreated = false;

  int? trainingID;

  bool isImageUploaded1 = false;

  bool isImageUploaded2 = false;

  bool isImageUploaded3 = false;

  bool isImageUploaded4 = false;

  bool isImageUploaded5 = false;

  ///  State fields for stateful widgets in this page.

  // Model for AppBarBoughtProduct component.
  late AppBarBoughtProductModel appBarBoughtProductModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    appBarBoughtProductModel =
        createModel(context, () => AppBarBoughtProductModel());
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    appBarBoughtProductModel.dispose();
    tapBarTrainerModel.dispose();
  }
}
