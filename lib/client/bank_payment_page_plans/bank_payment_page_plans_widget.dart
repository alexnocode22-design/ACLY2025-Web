import '/backend/supabase/supabase.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'bank_payment_page_plans_model.dart';
export 'bank_payment_page_plans_model.dart';

class BankPaymentPagePlansWidget extends StatefulWidget {
  const BankPaymentPagePlansWidget({
    super.key,
    required this.productPrice,
    required this.productType,
    required this.productID,
    required this.userID,
    required this.productName,
    required this.trainerID,
    required this.productPhoto1,
  });

  final int? productPrice;
  final String? productType;
  final int? productID;
  final String? userID;
  final String? productName;
  final String? trainerID;
  final String? productPhoto1;

  static String routeName = 'BankPaymentPagePlans';
  static String routePath = 'bankPaymentPagePlans';

  @override
  State<BankPaymentPagePlansWidget> createState() =>
      _BankPaymentPagePlansWidgetState();
}

class _BankPaymentPagePlansWidgetState
    extends State<BankPaymentPagePlansWidget> {
  late BankPaymentPagePlansModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BankPaymentPagePlansModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFF9F5),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  57.0, 29.0, 56.0, 0.0),
                              child: Text(
                                'Платежный шлюз банка',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF808080),
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: GradientText(
                              formatNumber(
                                widget.productPrice,
                                formatType: FormatType.custom,
                                format: '##.## ₽',
                                locale: '',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 46.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                              colors: [Color(0xFFFF740F), Color(0xFF7B43CE)],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Text(
                              widget.productType!,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.productName,
                                'Нет названия',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  89.0, 135.0, 89.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (widget.productType ==
                                      'План тренировки') {
                                    _model.trainingPlanBoughtID =
                                        await TrainingplanBoughtTable().insert({
                                      'training_plan_id': widget.productID,
                                      'training_plan_name': widget.productName,
                                      'user_id': widget.userID,
                                      'training_plan_price':
                                          widget.productPrice,
                                      'training_plan_payed': true,
                                      'trainer_id': widget.trainerID,
                                      'training_plan_photo1':
                                          widget.productPhoto1,
                                    });
                                    // NOTIFICATION
                                    await NotificationsTable().insert({
                                      'user_id': widget.trainerID,
                                      'title': 'У вас купили план тренировки.',
                                      'body': valueOrDefault<String>(
                                        widget.productName,
                                        'Нет названия',
                                      ),
                                    });
                                  }
                                  if (widget.productType == 'План питания') {
                                    _model.nutritionPlanBoughtID =
                                        await NutritionplanBoughtTable()
                                            .insert({
                                      'user_id': widget.userID,
                                      'nutrition_plan_id': widget.productID,
                                      'nutrition_plan_name':
                                          widget.productName,
                                      'nutrition_plan_price':
                                          widget.productPrice,
                                      'nutrition_plan_payed': true,
                                      'trainer_id': widget.trainerID,
                                      'nutrition_plan_photo1':
                                          widget.productPhoto1,
                                    });
                                    // NOTIFICATION
                                    await NotificationsTable().insert({
                                      'user_id': widget.trainerID,
                                      'title': 'У вас купили план питания.',
                                      'body': valueOrDefault<String>(
                                        widget.productName,
                                        'Нет названия',
                                      ),
                                    });
                                  }
                                  if (widget.productType ==
                                      'Цифровой продукт') {
                                    _model.digiProdBoughtID =
                                        await DigiprodBoughtTable().insert({
                                      'user_id': widget.userID,
                                      'digiprod_id': widget.productID,
                                      'digiprod_name': widget.productName,
                                      'digiprod_price': widget.productPrice,
                                      'digiprod_payed': true,
                                      'trainer_id': widget.trainerID,
                                      'digiprod_photo1': widget.productPhoto1,
                                    });
                                    // NOTIFICATION
                                    await NotificationsTable().insert({
                                      'user_id': widget.trainerID,
                                      'title': 'У вас купили цифровой продукт.',
                                      'body': valueOrDefault<String>(
                                        widget.productName,
                                        'Нет названия',
                                      ),
                                    });
                                  }

                                  context.pushNamed(
                                    BankPaymentConfirmedWidget.routeName,
                                    queryParameters: {
                                      'amountPayed': serializeParam(
                                        widget.productPrice,
                                        ParamType.int,
                                      ),
                                      'productID': serializeParam(
                                        widget.productID,
                                        ParamType.int,
                                      ),
                                      'productType': serializeParam(
                                        widget.productType,
                                        ParamType.String,
                                      ),
                                      'boughtID': serializeParam(
                                        0,
                                        ParamType.int,
                                      ),
                                      'productName': serializeParam(
                                        widget.productName,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF7B43CE),
                                        Color(0xFFFF740F)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.69, -1.0),
                                      end: AlignmentDirectional(-0.69, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'ОПЛАТИТЬ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ].addToEnd(SizedBox(height: 150.0)),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.tapBarTrainerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TapBarTrainerWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
