import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'payment_support_page_widget.dart' show PaymentSupportPageWidget;
import 'package:flutter/material.dart';

class PaymentSupportPageModel
    extends FlutterFlowModel<PaymentSupportPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TapBarTrainer component.
  late TapBarTrainerModel tapBarTrainerModel;

  @override
  void initState(BuildContext context) {
    tapBarTrainerModel = createModel(context, () => TapBarTrainerModel());
  }

  @override
  void dispose() {
    tapBarTrainerModel.dispose();
  }
}
