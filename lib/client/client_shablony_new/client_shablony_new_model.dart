import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_user_shablony_new/app_bar_user_shablony_new_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_shablony_new_widget.dart' show ClientShablonyNewWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ClientShablonyNewModel extends FlutterFlowModel<ClientShablonyNewWidget> {
  ///  Local state fields for this page.

  int approachQtyCurrent = 0;

  int exerciseQtyCurrent = 0;

  int exerciseQtyTotal = 1;

  int approachQtyTotal = 1;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for AppBarUserShablonyNew component.
  late AppBarUserShablonyNewModel appBarUserShablonyNewModel;
  // State field(s) for TemplateBlockName widget.
  FocusNode? templateBlockNameFocusNode;
  TextEditingController? templateBlockNameTextController;
  String? Function(BuildContext, String?)?
      templateBlockNameTextControllerValidator;
  String? _templateBlockNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите название шаблона';
    }

    return null;
  }

  // State field(s) for ExersizeName-1 widget.
  FocusNode? exersizeName1FocusNode;
  TextEditingController? exersizeName1TextController;
  String? Function(BuildContext, String?)? exersizeName1TextControllerValidator;
  String? _exersizeName1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите название упражнения';
    }

    return null;
  }

  // State field(s) for ApproachQuantity-1 widget.
  FocusNode? approachQuantity1FocusNode;
  TextEditingController? approachQuantity1TextController;
  late MaskTextInputFormatter approachQuantity1Mask;
  String? Function(BuildContext, String?)?
      approachQuantity1TextControllerValidator;
  String? _approachQuantity1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите количество подходов';
    }

    return null;
  }

  // State field(s) for Weight-1-1 widget.
  FocusNode? weight11FocusNode;
  TextEditingController? weight11TextController;
  String? Function(BuildContext, String?)? weight11TextControllerValidator;
  // State field(s) for Repeats-1-1 widget.
  FocusNode? repeats11FocusNode;
  TextEditingController? repeats11TextController;
  String? Function(BuildContext, String?)? repeats11TextControllerValidator;
  String? _repeats11TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите количество повторений';
    }

    return null;
  }

  // State field(s) for Weight-1-2 widget.
  FocusNode? weight12FocusNode;
  TextEditingController? weight12TextController;
  String? Function(BuildContext, String?)? weight12TextControllerValidator;
  // State field(s) for Repeats-1-2 widget.
  FocusNode? repeats12FocusNode;
  TextEditingController? repeats12TextController;
  String? Function(BuildContext, String?)? repeats12TextControllerValidator;
  // State field(s) for Weight-1-3 widget.
  FocusNode? weight13FocusNode;
  TextEditingController? weight13TextController;
  String? Function(BuildContext, String?)? weight13TextControllerValidator;
  // State field(s) for Repeats-1-3 widget.
  FocusNode? repeats13FocusNode;
  TextEditingController? repeats13TextController;
  String? Function(BuildContext, String?)? repeats13TextControllerValidator;
  // State field(s) for Weight-1-4 widget.
  FocusNode? weight14FocusNode;
  TextEditingController? weight14TextController;
  String? Function(BuildContext, String?)? weight14TextControllerValidator;
  // State field(s) for Repeats-1-4 widget.
  FocusNode? repeats14FocusNode;
  TextEditingController? repeats14TextController;
  String? Function(BuildContext, String?)? repeats14TextControllerValidator;
  // State field(s) for Weight-1-5 widget.
  FocusNode? weight15FocusNode;
  TextEditingController? weight15TextController;
  String? Function(BuildContext, String?)? weight15TextControllerValidator;
  // State field(s) for Repeats-1-5 widget.
  FocusNode? repeats15FocusNode;
  TextEditingController? repeats15TextController;
  String? Function(BuildContext, String?)? repeats15TextControllerValidator;
  // State field(s) for Weight-1-6 widget.
  FocusNode? weight16FocusNode;
  TextEditingController? weight16TextController;
  String? Function(BuildContext, String?)? weight16TextControllerValidator;
  // State field(s) for Repeats-1-6 widget.
  FocusNode? repeats16FocusNode;
  TextEditingController? repeats16TextController;
  String? Function(BuildContext, String?)? repeats16TextControllerValidator;
  // State field(s) for Weight-1-7 widget.
  FocusNode? weight17FocusNode;
  TextEditingController? weight17TextController;
  String? Function(BuildContext, String?)? weight17TextControllerValidator;
  // State field(s) for Repeats-1-7 widget.
  FocusNode? repeats17FocusNode;
  TextEditingController? repeats17TextController;
  String? Function(BuildContext, String?)? repeats17TextControllerValidator;
  // State field(s) for Weight-1-8 widget.
  FocusNode? weight18FocusNode;
  TextEditingController? weight18TextController;
  String? Function(BuildContext, String?)? weight18TextControllerValidator;
  // State field(s) for Repeats-1-8 widget.
  FocusNode? repeats18FocusNode;
  TextEditingController? repeats18TextController;
  String? Function(BuildContext, String?)? repeats18TextControllerValidator;
  // State field(s) for Weight-1-9 widget.
  FocusNode? weight19FocusNode;
  TextEditingController? weight19TextController;
  String? Function(BuildContext, String?)? weight19TextControllerValidator;
  // State field(s) for Repeats-1-9 widget.
  FocusNode? repeats19FocusNode;
  TextEditingController? repeats19TextController;
  String? Function(BuildContext, String?)? repeats19TextControllerValidator;
  // State field(s) for Weight-1-10 widget.
  FocusNode? weight110FocusNode;
  TextEditingController? weight110TextController;
  String? Function(BuildContext, String?)? weight110TextControllerValidator;
  // State field(s) for Repeats-1-10 widget.
  FocusNode? repeats110FocusNode;
  TextEditingController? repeats110TextController;
  String? Function(BuildContext, String?)? repeats110TextControllerValidator;
  // State field(s) for ExersizeName-2 widget.
  FocusNode? exersizeName2FocusNode;
  TextEditingController? exersizeName2TextController;
  String? Function(BuildContext, String?)? exersizeName2TextControllerValidator;
  // State field(s) for ApproachQuantity-2 widget.
  FocusNode? approachQuantity2FocusNode;
  TextEditingController? approachQuantity2TextController;
  String? Function(BuildContext, String?)?
      approachQuantity2TextControllerValidator;
  // State field(s) for Weight-2-1 widget.
  FocusNode? weight21FocusNode;
  TextEditingController? weight21TextController;
  String? Function(BuildContext, String?)? weight21TextControllerValidator;
  // State field(s) for Repeats-2-1 widget.
  FocusNode? repeats21FocusNode;
  TextEditingController? repeats21TextController;
  String? Function(BuildContext, String?)? repeats21TextControllerValidator;
  // State field(s) for Weight-2-2 widget.
  FocusNode? weight22FocusNode;
  TextEditingController? weight22TextController;
  String? Function(BuildContext, String?)? weight22TextControllerValidator;
  // State field(s) for Repeats-2-2 widget.
  FocusNode? repeats22FocusNode;
  TextEditingController? repeats22TextController;
  String? Function(BuildContext, String?)? repeats22TextControllerValidator;
  // State field(s) for Weight-2-3 widget.
  FocusNode? weight23FocusNode;
  TextEditingController? weight23TextController;
  String? Function(BuildContext, String?)? weight23TextControllerValidator;
  // State field(s) for Repeats-2-3 widget.
  FocusNode? repeats23FocusNode;
  TextEditingController? repeats23TextController;
  String? Function(BuildContext, String?)? repeats23TextControllerValidator;
  // State field(s) for Weight-2-4 widget.
  FocusNode? weight24FocusNode;
  TextEditingController? weight24TextController;
  String? Function(BuildContext, String?)? weight24TextControllerValidator;
  // State field(s) for Repeats-2-4 widget.
  FocusNode? repeats24FocusNode;
  TextEditingController? repeats24TextController;
  String? Function(BuildContext, String?)? repeats24TextControllerValidator;
  // State field(s) for Weight-2-5 widget.
  FocusNode? weight25FocusNode;
  TextEditingController? weight25TextController;
  String? Function(BuildContext, String?)? weight25TextControllerValidator;
  // State field(s) for Repeats-2-5 widget.
  FocusNode? repeats25FocusNode;
  TextEditingController? repeats25TextController;
  String? Function(BuildContext, String?)? repeats25TextControllerValidator;
  // State field(s) for Weight-2-6 widget.
  FocusNode? weight26FocusNode;
  TextEditingController? weight26TextController;
  String? Function(BuildContext, String?)? weight26TextControllerValidator;
  // State field(s) for Repeats-2-6 widget.
  FocusNode? repeats26FocusNode;
  TextEditingController? repeats26TextController;
  String? Function(BuildContext, String?)? repeats26TextControllerValidator;
  // State field(s) for Weight-2-7 widget.
  FocusNode? weight27FocusNode;
  TextEditingController? weight27TextController;
  String? Function(BuildContext, String?)? weight27TextControllerValidator;
  // State field(s) for Repeats-2-7 widget.
  FocusNode? repeats27FocusNode;
  TextEditingController? repeats27TextController;
  String? Function(BuildContext, String?)? repeats27TextControllerValidator;
  // State field(s) for Weight-2-8 widget.
  FocusNode? weight28FocusNode;
  TextEditingController? weight28TextController;
  String? Function(BuildContext, String?)? weight28TextControllerValidator;
  // State field(s) for Repeats-2-8 widget.
  FocusNode? repeats28FocusNode;
  TextEditingController? repeats28TextController;
  String? Function(BuildContext, String?)? repeats28TextControllerValidator;
  // State field(s) for Weight-2-9 widget.
  FocusNode? weight29FocusNode;
  TextEditingController? weight29TextController;
  String? Function(BuildContext, String?)? weight29TextControllerValidator;
  // State field(s) for Repeats-2-9 widget.
  FocusNode? repeats29FocusNode;
  TextEditingController? repeats29TextController;
  String? Function(BuildContext, String?)? repeats29TextControllerValidator;
  // State field(s) for Weight-2-10 widget.
  FocusNode? weight210FocusNode;
  TextEditingController? weight210TextController;
  String? Function(BuildContext, String?)? weight210TextControllerValidator;
  // State field(s) for Repeats-2-10 widget.
  FocusNode? repeats210FocusNode;
  TextEditingController? repeats210TextController;
  String? Function(BuildContext, String?)? repeats210TextControllerValidator;
  // State field(s) for ExersizeName-3 widget.
  FocusNode? exersizeName3FocusNode;
  TextEditingController? exersizeName3TextController;
  String? Function(BuildContext, String?)? exersizeName3TextControllerValidator;
  // State field(s) for ApproachQuantity-3 widget.
  FocusNode? approachQuantity3FocusNode;
  TextEditingController? approachQuantity3TextController;
  String? Function(BuildContext, String?)?
      approachQuantity3TextControllerValidator;
  // State field(s) for Weight-3-1 widget.
  FocusNode? weight31FocusNode;
  TextEditingController? weight31TextController;
  String? Function(BuildContext, String?)? weight31TextControllerValidator;
  // State field(s) for Repeats-3-1 widget.
  FocusNode? repeats31FocusNode;
  TextEditingController? repeats31TextController;
  String? Function(BuildContext, String?)? repeats31TextControllerValidator;
  // State field(s) for Weight-3-2 widget.
  FocusNode? weight32FocusNode;
  TextEditingController? weight32TextController;
  String? Function(BuildContext, String?)? weight32TextControllerValidator;
  // State field(s) for Repeats-3-2 widget.
  FocusNode? repeats32FocusNode;
  TextEditingController? repeats32TextController;
  String? Function(BuildContext, String?)? repeats32TextControllerValidator;
  // State field(s) for Weight-3-3 widget.
  FocusNode? weight33FocusNode;
  TextEditingController? weight33TextController;
  String? Function(BuildContext, String?)? weight33TextControllerValidator;
  // State field(s) for Repeats-3-3 widget.
  FocusNode? repeats33FocusNode;
  TextEditingController? repeats33TextController;
  String? Function(BuildContext, String?)? repeats33TextControllerValidator;
  // State field(s) for Weight-3-4 widget.
  FocusNode? weight34FocusNode;
  TextEditingController? weight34TextController;
  String? Function(BuildContext, String?)? weight34TextControllerValidator;
  // State field(s) for Repeats-3-4 widget.
  FocusNode? repeats34FocusNode;
  TextEditingController? repeats34TextController;
  String? Function(BuildContext, String?)? repeats34TextControllerValidator;
  // State field(s) for Weight-3-5 widget.
  FocusNode? weight35FocusNode;
  TextEditingController? weight35TextController;
  String? Function(BuildContext, String?)? weight35TextControllerValidator;
  // State field(s) for Repeats-3-5 widget.
  FocusNode? repeats35FocusNode;
  TextEditingController? repeats35TextController;
  String? Function(BuildContext, String?)? repeats35TextControllerValidator;
  // State field(s) for Weight-3-6 widget.
  FocusNode? weight36FocusNode;
  TextEditingController? weight36TextController;
  String? Function(BuildContext, String?)? weight36TextControllerValidator;
  // State field(s) for Repeats-3-6 widget.
  FocusNode? repeats36FocusNode;
  TextEditingController? repeats36TextController;
  String? Function(BuildContext, String?)? repeats36TextControllerValidator;
  // State field(s) for Weight-3-7 widget.
  FocusNode? weight37FocusNode;
  TextEditingController? weight37TextController;
  String? Function(BuildContext, String?)? weight37TextControllerValidator;
  // State field(s) for Repeats-3-7 widget.
  FocusNode? repeats37FocusNode;
  TextEditingController? repeats37TextController;
  String? Function(BuildContext, String?)? repeats37TextControllerValidator;
  // State field(s) for Weight-3-8 widget.
  FocusNode? weight38FocusNode;
  TextEditingController? weight38TextController;
  String? Function(BuildContext, String?)? weight38TextControllerValidator;
  // State field(s) for Repeats-3-8 widget.
  FocusNode? repeats38FocusNode;
  TextEditingController? repeats38TextController;
  String? Function(BuildContext, String?)? repeats38TextControllerValidator;
  // State field(s) for Weight-3-9 widget.
  FocusNode? weight39FocusNode;
  TextEditingController? weight39TextController;
  String? Function(BuildContext, String?)? weight39TextControllerValidator;
  // State field(s) for Repeats-3-9 widget.
  FocusNode? repeats39FocusNode;
  TextEditingController? repeats39TextController;
  String? Function(BuildContext, String?)? repeats39TextControllerValidator;
  // State field(s) for Weight-3-10 widget.
  FocusNode? weight310FocusNode;
  TextEditingController? weight310TextController;
  String? Function(BuildContext, String?)? weight310TextControllerValidator;
  // State field(s) for Repeats-3-10 widget.
  FocusNode? repeats310FocusNode;
  TextEditingController? repeats310TextController;
  String? Function(BuildContext, String?)? repeats310TextControllerValidator;
  // State field(s) for ExersizeName-4 widget.
  FocusNode? exersizeName4FocusNode;
  TextEditingController? exersizeName4TextController;
  String? Function(BuildContext, String?)? exersizeName4TextControllerValidator;
  // State field(s) for ApproachQuantity-4 widget.
  FocusNode? approachQuantity4FocusNode;
  TextEditingController? approachQuantity4TextController;
  String? Function(BuildContext, String?)?
      approachQuantity4TextControllerValidator;
  // State field(s) for Weight-4-1 widget.
  FocusNode? weight41FocusNode;
  TextEditingController? weight41TextController;
  String? Function(BuildContext, String?)? weight41TextControllerValidator;
  // State field(s) for Repeats-4-1 widget.
  FocusNode? repeats41FocusNode;
  TextEditingController? repeats41TextController;
  String? Function(BuildContext, String?)? repeats41TextControllerValidator;
  // State field(s) for Weight-4-2 widget.
  FocusNode? weight42FocusNode;
  TextEditingController? weight42TextController;
  String? Function(BuildContext, String?)? weight42TextControllerValidator;
  // State field(s) for Repeats-4-2 widget.
  FocusNode? repeats42FocusNode;
  TextEditingController? repeats42TextController;
  String? Function(BuildContext, String?)? repeats42TextControllerValidator;
  // State field(s) for Weight-4-3 widget.
  FocusNode? weight43FocusNode;
  TextEditingController? weight43TextController;
  String? Function(BuildContext, String?)? weight43TextControllerValidator;
  // State field(s) for Repeats-4-3 widget.
  FocusNode? repeats43FocusNode;
  TextEditingController? repeats43TextController;
  String? Function(BuildContext, String?)? repeats43TextControllerValidator;
  // State field(s) for Weight-4-4 widget.
  FocusNode? weight44FocusNode;
  TextEditingController? weight44TextController;
  String? Function(BuildContext, String?)? weight44TextControllerValidator;
  // State field(s) for Repeats-4-4 widget.
  FocusNode? repeats44FocusNode;
  TextEditingController? repeats44TextController;
  String? Function(BuildContext, String?)? repeats44TextControllerValidator;
  // State field(s) for Weight-4-5 widget.
  FocusNode? weight45FocusNode;
  TextEditingController? weight45TextController;
  String? Function(BuildContext, String?)? weight45TextControllerValidator;
  // State field(s) for Repeats-4-5 widget.
  FocusNode? repeats45FocusNode;
  TextEditingController? repeats45TextController;
  String? Function(BuildContext, String?)? repeats45TextControllerValidator;
  // State field(s) for Weight-4-6 widget.
  FocusNode? weight46FocusNode;
  TextEditingController? weight46TextController;
  String? Function(BuildContext, String?)? weight46TextControllerValidator;
  // State field(s) for Repeats-4-6 widget.
  FocusNode? repeats46FocusNode;
  TextEditingController? repeats46TextController;
  String? Function(BuildContext, String?)? repeats46TextControllerValidator;
  // State field(s) for Weight-4-7 widget.
  FocusNode? weight47FocusNode;
  TextEditingController? weight47TextController;
  String? Function(BuildContext, String?)? weight47TextControllerValidator;
  // State field(s) for Repeats-4-7 widget.
  FocusNode? repeats47FocusNode;
  TextEditingController? repeats47TextController;
  String? Function(BuildContext, String?)? repeats47TextControllerValidator;
  // State field(s) for Weight-4-8 widget.
  FocusNode? weight48FocusNode;
  TextEditingController? weight48TextController;
  String? Function(BuildContext, String?)? weight48TextControllerValidator;
  // State field(s) for Repeats-4-8 widget.
  FocusNode? repeats48FocusNode;
  TextEditingController? repeats48TextController;
  String? Function(BuildContext, String?)? repeats48TextControllerValidator;
  // State field(s) for Weight-4-9 widget.
  FocusNode? weight49FocusNode;
  TextEditingController? weight49TextController;
  String? Function(BuildContext, String?)? weight49TextControllerValidator;
  // State field(s) for Repeats-4-9 widget.
  FocusNode? repeats49FocusNode;
  TextEditingController? repeats49TextController;
  String? Function(BuildContext, String?)? repeats49TextControllerValidator;
  // State field(s) for Weight-4-10 widget.
  FocusNode? weight410FocusNode;
  TextEditingController? weight410TextController;
  String? Function(BuildContext, String?)? weight410TextControllerValidator;
  // State field(s) for Repeats-4-10 widget.
  FocusNode? repeats410FocusNode;
  TextEditingController? repeats410TextController;
  String? Function(BuildContext, String?)? repeats410TextControllerValidator;
  // State field(s) for ExersizeName-5 widget.
  FocusNode? exersizeName5FocusNode;
  TextEditingController? exersizeName5TextController;
  String? Function(BuildContext, String?)? exersizeName5TextControllerValidator;
  // State field(s) for ApproachQuantity-5 widget.
  FocusNode? approachQuantity5FocusNode;
  TextEditingController? approachQuantity5TextController;
  String? Function(BuildContext, String?)?
      approachQuantity5TextControllerValidator;
  // State field(s) for Weight-5-1 widget.
  FocusNode? weight51FocusNode;
  TextEditingController? weight51TextController;
  String? Function(BuildContext, String?)? weight51TextControllerValidator;
  // State field(s) for Repeats-5-1 widget.
  FocusNode? repeats51FocusNode;
  TextEditingController? repeats51TextController;
  String? Function(BuildContext, String?)? repeats51TextControllerValidator;
  // State field(s) for Weight-5-2 widget.
  FocusNode? weight52FocusNode;
  TextEditingController? weight52TextController;
  String? Function(BuildContext, String?)? weight52TextControllerValidator;
  // State field(s) for Repeats-5-2 widget.
  FocusNode? repeats52FocusNode;
  TextEditingController? repeats52TextController;
  String? Function(BuildContext, String?)? repeats52TextControllerValidator;
  // State field(s) for Weight-5-3 widget.
  FocusNode? weight53FocusNode;
  TextEditingController? weight53TextController;
  String? Function(BuildContext, String?)? weight53TextControllerValidator;
  // State field(s) for Repeats-5-3 widget.
  FocusNode? repeats53FocusNode;
  TextEditingController? repeats53TextController;
  String? Function(BuildContext, String?)? repeats53TextControllerValidator;
  // State field(s) for Weight-5-4 widget.
  FocusNode? weight54FocusNode;
  TextEditingController? weight54TextController;
  String? Function(BuildContext, String?)? weight54TextControllerValidator;
  // State field(s) for Repeats-5-4 widget.
  FocusNode? repeats54FocusNode;
  TextEditingController? repeats54TextController;
  String? Function(BuildContext, String?)? repeats54TextControllerValidator;
  // State field(s) for Weight-5-5 widget.
  FocusNode? weight55FocusNode;
  TextEditingController? weight55TextController;
  String? Function(BuildContext, String?)? weight55TextControllerValidator;
  // State field(s) for Repeats-5-5 widget.
  FocusNode? repeats55FocusNode;
  TextEditingController? repeats55TextController;
  String? Function(BuildContext, String?)? repeats55TextControllerValidator;
  // State field(s) for Weight-5-6 widget.
  FocusNode? weight56FocusNode;
  TextEditingController? weight56TextController;
  String? Function(BuildContext, String?)? weight56TextControllerValidator;
  // State field(s) for Repeats-5-6 widget.
  FocusNode? repeats56FocusNode;
  TextEditingController? repeats56TextController;
  String? Function(BuildContext, String?)? repeats56TextControllerValidator;
  // State field(s) for Weight-5-7 widget.
  FocusNode? weight57FocusNode;
  TextEditingController? weight57TextController;
  String? Function(BuildContext, String?)? weight57TextControllerValidator;
  // State field(s) for Repeats-5-7 widget.
  FocusNode? repeats57FocusNode;
  TextEditingController? repeats57TextController;
  String? Function(BuildContext, String?)? repeats57TextControllerValidator;
  // State field(s) for Weight-5-8 widget.
  FocusNode? weight58FocusNode;
  TextEditingController? weight58TextController;
  String? Function(BuildContext, String?)? weight58TextControllerValidator;
  // State field(s) for Repeats-5-8 widget.
  FocusNode? repeats58FocusNode;
  TextEditingController? repeats58TextController;
  String? Function(BuildContext, String?)? repeats58TextControllerValidator;
  // State field(s) for Weight-5-9 widget.
  FocusNode? weight59FocusNode;
  TextEditingController? weight59TextController;
  String? Function(BuildContext, String?)? weight59TextControllerValidator;
  // State field(s) for Repeats-5-9 widget.
  FocusNode? repeats59FocusNode;
  TextEditingController? repeats59TextController;
  String? Function(BuildContext, String?)? repeats59TextControllerValidator;
  // State field(s) for Weight-5-10 widget.
  FocusNode? weight510FocusNode;
  TextEditingController? weight510TextController;
  String? Function(BuildContext, String?)? weight510TextControllerValidator;
  // State field(s) for Repeats-5-10 widget.
  FocusNode? repeats510FocusNode;
  TextEditingController? repeats510TextController;
  String? Function(BuildContext, String?)? repeats510TextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateBlockRow? newTemplateBlock;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateExerciseRow? newExercise1;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach11;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach12;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach13;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach14;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach15;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach16;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach17;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach18;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach19;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach110;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateExerciseRow? newExercise2;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach21;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach22;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach23;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach24;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach25;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach26;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach27;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach28;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach29;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach210;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateExerciseRow? newExercise3;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach31;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach32;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach33;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach34;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach35;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach36;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach37;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach38;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach39;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach310;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateExerciseRow? newExercise4;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach41;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach42;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach43;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach44;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach45;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach46;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach47;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach48;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach49;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach410;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateExerciseRow? newExercise5;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach51;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach52;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach53;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach54;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach55;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach56;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach57;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach58;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach59;
  // Stores action output result for [Backend Call - Insert Row] action in SaveTemplates widget.
  TemplateApproachRow? approach510;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarUserShablonyNewModel =
        createModel(context, () => AppBarUserShablonyNewModel());
    templateBlockNameTextControllerValidator =
        _templateBlockNameTextControllerValidator;
    exersizeName1TextControllerValidator =
        _exersizeName1TextControllerValidator;
    approachQuantity1TextControllerValidator =
        _approachQuantity1TextControllerValidator;
    repeats11TextControllerValidator = _repeats11TextControllerValidator;
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarUserShablonyNewModel.dispose();
    templateBlockNameFocusNode?.dispose();
    templateBlockNameTextController?.dispose();

    exersizeName1FocusNode?.dispose();
    exersizeName1TextController?.dispose();

    approachQuantity1FocusNode?.dispose();
    approachQuantity1TextController?.dispose();

    weight11FocusNode?.dispose();
    weight11TextController?.dispose();

    repeats11FocusNode?.dispose();
    repeats11TextController?.dispose();

    weight12FocusNode?.dispose();
    weight12TextController?.dispose();

    repeats12FocusNode?.dispose();
    repeats12TextController?.dispose();

    weight13FocusNode?.dispose();
    weight13TextController?.dispose();

    repeats13FocusNode?.dispose();
    repeats13TextController?.dispose();

    weight14FocusNode?.dispose();
    weight14TextController?.dispose();

    repeats14FocusNode?.dispose();
    repeats14TextController?.dispose();

    weight15FocusNode?.dispose();
    weight15TextController?.dispose();

    repeats15FocusNode?.dispose();
    repeats15TextController?.dispose();

    weight16FocusNode?.dispose();
    weight16TextController?.dispose();

    repeats16FocusNode?.dispose();
    repeats16TextController?.dispose();

    weight17FocusNode?.dispose();
    weight17TextController?.dispose();

    repeats17FocusNode?.dispose();
    repeats17TextController?.dispose();

    weight18FocusNode?.dispose();
    weight18TextController?.dispose();

    repeats18FocusNode?.dispose();
    repeats18TextController?.dispose();

    weight19FocusNode?.dispose();
    weight19TextController?.dispose();

    repeats19FocusNode?.dispose();
    repeats19TextController?.dispose();

    weight110FocusNode?.dispose();
    weight110TextController?.dispose();

    repeats110FocusNode?.dispose();
    repeats110TextController?.dispose();

    exersizeName2FocusNode?.dispose();
    exersizeName2TextController?.dispose();

    approachQuantity2FocusNode?.dispose();
    approachQuantity2TextController?.dispose();

    weight21FocusNode?.dispose();
    weight21TextController?.dispose();

    repeats21FocusNode?.dispose();
    repeats21TextController?.dispose();

    weight22FocusNode?.dispose();
    weight22TextController?.dispose();

    repeats22FocusNode?.dispose();
    repeats22TextController?.dispose();

    weight23FocusNode?.dispose();
    weight23TextController?.dispose();

    repeats23FocusNode?.dispose();
    repeats23TextController?.dispose();

    weight24FocusNode?.dispose();
    weight24TextController?.dispose();

    repeats24FocusNode?.dispose();
    repeats24TextController?.dispose();

    weight25FocusNode?.dispose();
    weight25TextController?.dispose();

    repeats25FocusNode?.dispose();
    repeats25TextController?.dispose();

    weight26FocusNode?.dispose();
    weight26TextController?.dispose();

    repeats26FocusNode?.dispose();
    repeats26TextController?.dispose();

    weight27FocusNode?.dispose();
    weight27TextController?.dispose();

    repeats27FocusNode?.dispose();
    repeats27TextController?.dispose();

    weight28FocusNode?.dispose();
    weight28TextController?.dispose();

    repeats28FocusNode?.dispose();
    repeats28TextController?.dispose();

    weight29FocusNode?.dispose();
    weight29TextController?.dispose();

    repeats29FocusNode?.dispose();
    repeats29TextController?.dispose();

    weight210FocusNode?.dispose();
    weight210TextController?.dispose();

    repeats210FocusNode?.dispose();
    repeats210TextController?.dispose();

    exersizeName3FocusNode?.dispose();
    exersizeName3TextController?.dispose();

    approachQuantity3FocusNode?.dispose();
    approachQuantity3TextController?.dispose();

    weight31FocusNode?.dispose();
    weight31TextController?.dispose();

    repeats31FocusNode?.dispose();
    repeats31TextController?.dispose();

    weight32FocusNode?.dispose();
    weight32TextController?.dispose();

    repeats32FocusNode?.dispose();
    repeats32TextController?.dispose();

    weight33FocusNode?.dispose();
    weight33TextController?.dispose();

    repeats33FocusNode?.dispose();
    repeats33TextController?.dispose();

    weight34FocusNode?.dispose();
    weight34TextController?.dispose();

    repeats34FocusNode?.dispose();
    repeats34TextController?.dispose();

    weight35FocusNode?.dispose();
    weight35TextController?.dispose();

    repeats35FocusNode?.dispose();
    repeats35TextController?.dispose();

    weight36FocusNode?.dispose();
    weight36TextController?.dispose();

    repeats36FocusNode?.dispose();
    repeats36TextController?.dispose();

    weight37FocusNode?.dispose();
    weight37TextController?.dispose();

    repeats37FocusNode?.dispose();
    repeats37TextController?.dispose();

    weight38FocusNode?.dispose();
    weight38TextController?.dispose();

    repeats38FocusNode?.dispose();
    repeats38TextController?.dispose();

    weight39FocusNode?.dispose();
    weight39TextController?.dispose();

    repeats39FocusNode?.dispose();
    repeats39TextController?.dispose();

    weight310FocusNode?.dispose();
    weight310TextController?.dispose();

    repeats310FocusNode?.dispose();
    repeats310TextController?.dispose();

    exersizeName4FocusNode?.dispose();
    exersizeName4TextController?.dispose();

    approachQuantity4FocusNode?.dispose();
    approachQuantity4TextController?.dispose();

    weight41FocusNode?.dispose();
    weight41TextController?.dispose();

    repeats41FocusNode?.dispose();
    repeats41TextController?.dispose();

    weight42FocusNode?.dispose();
    weight42TextController?.dispose();

    repeats42FocusNode?.dispose();
    repeats42TextController?.dispose();

    weight43FocusNode?.dispose();
    weight43TextController?.dispose();

    repeats43FocusNode?.dispose();
    repeats43TextController?.dispose();

    weight44FocusNode?.dispose();
    weight44TextController?.dispose();

    repeats44FocusNode?.dispose();
    repeats44TextController?.dispose();

    weight45FocusNode?.dispose();
    weight45TextController?.dispose();

    repeats45FocusNode?.dispose();
    repeats45TextController?.dispose();

    weight46FocusNode?.dispose();
    weight46TextController?.dispose();

    repeats46FocusNode?.dispose();
    repeats46TextController?.dispose();

    weight47FocusNode?.dispose();
    weight47TextController?.dispose();

    repeats47FocusNode?.dispose();
    repeats47TextController?.dispose();

    weight48FocusNode?.dispose();
    weight48TextController?.dispose();

    repeats48FocusNode?.dispose();
    repeats48TextController?.dispose();

    weight49FocusNode?.dispose();
    weight49TextController?.dispose();

    repeats49FocusNode?.dispose();
    repeats49TextController?.dispose();

    weight410FocusNode?.dispose();
    weight410TextController?.dispose();

    repeats410FocusNode?.dispose();
    repeats410TextController?.dispose();

    exersizeName5FocusNode?.dispose();
    exersizeName5TextController?.dispose();

    approachQuantity5FocusNode?.dispose();
    approachQuantity5TextController?.dispose();

    weight51FocusNode?.dispose();
    weight51TextController?.dispose();

    repeats51FocusNode?.dispose();
    repeats51TextController?.dispose();

    weight52FocusNode?.dispose();
    weight52TextController?.dispose();

    repeats52FocusNode?.dispose();
    repeats52TextController?.dispose();

    weight53FocusNode?.dispose();
    weight53TextController?.dispose();

    repeats53FocusNode?.dispose();
    repeats53TextController?.dispose();

    weight54FocusNode?.dispose();
    weight54TextController?.dispose();

    repeats54FocusNode?.dispose();
    repeats54TextController?.dispose();

    weight55FocusNode?.dispose();
    weight55TextController?.dispose();

    repeats55FocusNode?.dispose();
    repeats55TextController?.dispose();

    weight56FocusNode?.dispose();
    weight56TextController?.dispose();

    repeats56FocusNode?.dispose();
    repeats56TextController?.dispose();

    weight57FocusNode?.dispose();
    weight57TextController?.dispose();

    repeats57FocusNode?.dispose();
    repeats57TextController?.dispose();

    weight58FocusNode?.dispose();
    weight58TextController?.dispose();

    repeats58FocusNode?.dispose();
    repeats58TextController?.dispose();

    weight59FocusNode?.dispose();
    weight59TextController?.dispose();

    repeats59FocusNode?.dispose();
    repeats59TextController?.dispose();

    weight510FocusNode?.dispose();
    weight510TextController?.dispose();

    repeats510FocusNode?.dispose();
    repeats510TextController?.dispose();

    tapBarClientModel.dispose();
  }
}
