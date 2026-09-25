import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components_trainer/app_bar_coach_sales/app_bar_coach_sales_widget.dart';
import '/components_trainer/tap_bar_trainer/tap_bar_trainer_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'coach_sales_model.dart';
export 'coach_sales_model.dart';

class CoachSalesWidget extends StatefulWidget {
  const CoachSalesWidget({super.key});

  static String routeName = 'CoachSales';
  static String routePath = 'coachSales';

  @override
  State<CoachSalesWidget> createState() => _CoachSalesWidgetState();
}

class _CoachSalesWidgetState extends State<CoachSalesWidget> {
  late CoachSalesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachSalesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Set SaleMonth
      _model.saleMonth = functions.currentMonth();
      _model.saleYear = valueOrDefault<int>(
        DateTime.now().year,
        2026,
      );
      safeSetState(() {});
      FFAppState().tabIconColor = 0;
      FFAppState().currentMonth = valueOrDefault<int>(
        functions.currentMonth(),
        6,
      );
      safeSetState(() {});
      _model.pageReady = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFFFF9F5),
          body: SafeArea(
            top: true,
            child: Visibility(
              visible: _model.pageReady == true,
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.appBarCoachSalesModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppBarCoachSalesWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 0.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('Все продукты'),
                                  ChipData('Тренировки'),
                                  ChipData('Планы питания'),
                                  ChipData('Планы тренировок'),
                                  ChipData('Цифровые продукты')
                                ],
                                onChanged: (val) => safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFFFAC70),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF090A0A),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  iconColor: Color(0xFF15161E),
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 6.0, 12.0, 6.0),
                                  elevation: 0.0,
                                  borderWidth: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFFF2F4F5),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF090A0A),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  iconColor: Color(0xFF606A85),
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 6.0, 12.0, 6.0),
                                  elevation: 0.0,
                                  borderWidth: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                chipSpacing: 6.0,
                                rowSpacing: 8.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['Все продукты'],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 25.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Продажи за',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF090A0A),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 4.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.monthSelectValueController ??=
                                            FormFieldController<String>(
                                      _model.monthSelectValue ??=
                                          valueOrDefault<String>(
                                        () {
                                          if (functions.currentMonth() == 1) {
                                            return 'Январь';
                                          } else if (functions.currentMonth() ==
                                              2) {
                                            return 'Февраль';
                                          } else if (functions.currentMonth() ==
                                              3) {
                                            return 'Март';
                                          } else if (functions.currentMonth() ==
                                              4) {
                                            return 'Апрель';
                                          } else if (functions.currentMonth() ==
                                              5) {
                                            return 'Май';
                                          } else if (functions.currentMonth() ==
                                              6) {
                                            return 'Июнь';
                                          } else if (functions.currentMonth() ==
                                              7) {
                                            return 'Июль';
                                          } else if (functions.currentMonth() ==
                                              8) {
                                            return 'Август';
                                          } else if (functions.currentMonth() ==
                                              9) {
                                            return 'Сентябрь';
                                          } else if (functions.currentMonth() ==
                                              10) {
                                            return 'Октябрь';
                                          } else if (functions.currentMonth() ==
                                              11) {
                                            return 'Ноябрь';
                                          } else if (functions.currentMonth() ==
                                              12) {
                                            return 'Декабрь';
                                          } else {
                                            return 'Январь';
                                          }
                                        }(),
                                        'Январь',
                                      ),
                                    ),
                                    options: [
                                      'Январь',
                                      'Февраль',
                                      'Март',
                                      'Апрель',
                                      'Май',
                                      'Июнь',
                                      'Июль',
                                      'Август',
                                      'Сентябрь',
                                      'Октябрь',
                                      'Ноябрь',
                                      'Декабрь'
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.monthSelectValue = val);
                                      _model.saleMonth = () {
                                        if (_model.monthSelectValue ==
                                            'Январь') {
                                          return 1;
                                        } else if (_model.monthSelectValue ==
                                            'Февраль') {
                                          return 2;
                                        } else if (_model.monthSelectValue ==
                                            'Март') {
                                          return 3;
                                        } else if (_model.monthSelectValue ==
                                            'Апрель') {
                                          return 4;
                                        } else if (_model.monthSelectValue ==
                                            'Май') {
                                          return 5;
                                        } else if (_model.monthSelectValue ==
                                            'Июнь') {
                                          return 6;
                                        } else if (_model.monthSelectValue ==
                                            'Июль') {
                                          return 7;
                                        } else if (_model.monthSelectValue ==
                                            'Август') {
                                          return 8;
                                        } else if (_model.monthSelectValue ==
                                            'Сентябрь') {
                                          return 9;
                                        } else if (_model.monthSelectValue ==
                                            'Октябрь') {
                                          return 10;
                                        } else if (_model.monthSelectValue ==
                                            'Ноябрь') {
                                          return 11;
                                        } else if (_model.monthSelectValue ==
                                            'Декабрь') {
                                          return 12;
                                        } else {
                                          return 1;
                                        }
                                      }();
                                      safeSetState(() {});
                                      safeSetState(() {});
                                    },
                                    width: 148.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFF740F),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Январь',
                                    icon: Icon(
                                      Icons.calendar_month_outlined,
                                      color: Color(0xFFFF740F),
                                      size: 24.0,
                                    ),
                                    fillColor: Color(0xFFFFF9F5),
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.yearSelectValueController ??=
                                            FormFieldController<String>(
                                      _model.yearSelectValue ??=
                                          valueOrDefault<String>(
                                        _model.saleYear?.toString(),
                                        '2026',
                                      ),
                                    ),
                                    options: [
                                      '2025',
                                      '2026',
                                      '2027',
                                      '2028',
                                      '2029',
                                      '2030'
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.yearSelectValue = val);
                                      _model.saleYear = () {
                                        if (_model.yearSelectValue == '2025') {
                                          return 2025;
                                        } else if (_model.yearSelectValue ==
                                            '2026') {
                                          return 2026;
                                        } else if (_model.yearSelectValue ==
                                            '2027') {
                                          return 2027;
                                        } else if (_model.yearSelectValue ==
                                            '2028') {
                                          return 2028;
                                        } else if (_model.yearSelectValue ==
                                            '2029') {
                                          return 2029;
                                        } else if (_model.yearSelectValue ==
                                            '2030') {
                                          return 2030;
                                        } else if (_model.yearSelectValue ==
                                            'Июль') {
                                          return 2030;
                                        } else {
                                          return 2026;
                                        }
                                      }();
                                      safeSetState(() {});
                                      safeSetState(() {});
                                    },
                                    width: 70.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFFF740F),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    hintText: '2026',
                                    fillColor: Color(0xFFFFF9F5),
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (_model.choiceChipsValue == 'Все продукты') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 15.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<TrainerAllproductsViewRow>>(
                                    future: TrainerAllproductsViewTable()
                                        .querySingleRow(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'trainer_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'sale_month',
                                            _model.saleMonth,
                                          )
                                          .eqOrNull(
                                            'sale_year',
                                            valueOrDefault<int>(
                                              _model.saleYear,
                                              2025,
                                            ),
                                          )
                                          .order('created_at'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                          ),
                                        );
                                      }
                                      List<TrainerAllproductsViewRow>
                                          allProdTotalAmountTrainerAllproductsViewRowList =
                                          snapshot.data!;

                                      final allProdTotalAmountTrainerAllproductsViewRow =
                                          allProdTotalAmountTrainerAllproductsViewRowList
                                                  .isNotEmpty
                                              ? allProdTotalAmountTrainerAllproductsViewRowList
                                                  .first
                                              : null;

                                      return GradientText(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            allProdTotalAmountTrainerAllproductsViewRow
                                                ?.monthAmount,
                                            formatType: FormatType.custom,
                                            format: '##.## ₽',
                                            locale: '',
                                          ),
                                          '0,0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        colors: [
                                          Color(0xFFFF740F),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      );
                                    },
                                  ),
                                );
                              } else if (_model.choiceChipsValue ==
                                  'Тренировки') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 15.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<TrainerAllproductsViewRow>>(
                                    future: TrainerAllproductsViewTable()
                                        .querySingleRow(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'trainer_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'sale_month',
                                            _model.saleMonth,
                                          )
                                          .eqOrNull(
                                            'sale_year',
                                            valueOrDefault<int>(
                                              _model.saleYear,
                                              2025,
                                            ),
                                          )
                                          .eqOrNull(
                                            'product_type',
                                            'Training',
                                          )
                                          .order('created_at'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                          ),
                                        );
                                      }
                                      List<TrainerAllproductsViewRow>
                                          trainingTotalAmountTrainerAllproductsViewRowList =
                                          snapshot.data!;

                                      final trainingTotalAmountTrainerAllproductsViewRow =
                                          trainingTotalAmountTrainerAllproductsViewRowList
                                                  .isNotEmpty
                                              ? trainingTotalAmountTrainerAllproductsViewRowList
                                                  .first
                                              : null;

                                      return GradientText(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            trainingTotalAmountTrainerAllproductsViewRow
                                                ?.productTypeMonthAmount,
                                            formatType: FormatType.custom,
                                            format: '##.## ₽',
                                            locale: '',
                                          ),
                                          '0,0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        colors: [
                                          Color(0xFFFF740F),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      );
                                    },
                                  ),
                                );
                              } else if (_model.choiceChipsValue ==
                                  'Планы питания') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 15.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<TrainerAllproductsViewRow>>(
                                    future: TrainerAllproductsViewTable()
                                        .querySingleRow(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'trainer_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'sale_month',
                                            _model.saleMonth,
                                          )
                                          .eqOrNull(
                                            'sale_year',
                                            valueOrDefault<int>(
                                              _model.saleYear,
                                              2025,
                                            ),
                                          )
                                          .eqOrNull(
                                            'product_type',
                                            'Nutrition Plan',
                                          )
                                          .order('created_at'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                          ),
                                        );
                                      }
                                      List<TrainerAllproductsViewRow>
                                          nutritionTotalAmountTrainerAllproductsViewRowList =
                                          snapshot.data!;

                                      final nutritionTotalAmountTrainerAllproductsViewRow =
                                          nutritionTotalAmountTrainerAllproductsViewRowList
                                                  .isNotEmpty
                                              ? nutritionTotalAmountTrainerAllproductsViewRowList
                                                  .first
                                              : null;

                                      return GradientText(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            nutritionTotalAmountTrainerAllproductsViewRow
                                                ?.productTypeMonthAmount,
                                            formatType: FormatType.custom,
                                            format: '##.## ₽',
                                            locale: '',
                                          ),
                                          '0,0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        colors: [
                                          Color(0xFFFF740F),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      );
                                    },
                                  ),
                                );
                              } else if (_model.choiceChipsValue ==
                                  'Планы тренировок') {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 15.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<TrainerAllproductsViewRow>>(
                                    future: TrainerAllproductsViewTable()
                                        .querySingleRow(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'trainer_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'sale_month',
                                            _model.saleMonth,
                                          )
                                          .eqOrNull(
                                            'sale_year',
                                            valueOrDefault<int>(
                                              _model.saleYear,
                                              2025,
                                            ),
                                          )
                                          .eqOrNull(
                                            'product_type',
                                            'Training Plan',
                                          )
                                          .order('created_at'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                          ),
                                        );
                                      }
                                      List<TrainerAllproductsViewRow>
                                          trainingPlanTotalAmountTrainerAllproductsViewRowList =
                                          snapshot.data!;

                                      final trainingPlanTotalAmountTrainerAllproductsViewRow =
                                          trainingPlanTotalAmountTrainerAllproductsViewRowList
                                                  .isNotEmpty
                                              ? trainingPlanTotalAmountTrainerAllproductsViewRowList
                                                  .first
                                              : null;

                                      return GradientText(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            trainingPlanTotalAmountTrainerAllproductsViewRow
                                                ?.productTypeMonthAmount,
                                            formatType: FormatType.custom,
                                            format: '##.## ₽',
                                            locale: '',
                                          ),
                                          '0,0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        colors: [
                                          Color(0xFFFF740F),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 15.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<TrainerAllproductsViewRow>>(
                                    future: TrainerAllproductsViewTable()
                                        .querySingleRow(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'trainer_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'sale_month',
                                            _model.saleMonth,
                                          )
                                          .eqOrNull(
                                            'sale_year',
                                            valueOrDefault<int>(
                                              _model.saleYear,
                                              2025,
                                            ),
                                          )
                                          .eqOrNull(
                                            'product_type',
                                            'Digital Product',
                                          )
                                          .order('created_at'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/logo.png',
                                          ),
                                        );
                                      }
                                      List<TrainerAllproductsViewRow>
                                          digiProdTotalAmountTrainerAllproductsViewRowList =
                                          snapshot.data!;

                                      final digiProdTotalAmountTrainerAllproductsViewRow =
                                          digiProdTotalAmountTrainerAllproductsViewRowList
                                                  .isNotEmpty
                                              ? digiProdTotalAmountTrainerAllproductsViewRowList
                                                  .first
                                              : null;

                                      return GradientText(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            digiProdTotalAmountTrainerAllproductsViewRow
                                                ?.productTypeMonthAmount,
                                            formatType: FormatType.custom,
                                            format: '##.## ₽',
                                            locale: '',
                                          ),
                                          '0,0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 36.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        colors: [
                                          Color(0xFFFF740F),
                                          Color(0xFF7B43CE)
                                        ],
                                        gradientDirection:
                                            GradientDirection.ltr,
                                        gradientType: GradientType.linear,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                          Builder(
                            builder: (context) {
                              if (_model.choiceChipsValue == 'Все продукты') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 10.0),
                                              child: Text(
                                                'Продажи по продуктам:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    TrainerAllproductsViewRow>>(
                                              future:
                                                  TrainerAllproductsViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth,
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear,
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<TrainerAllproductsViewRow>
                                                    allProductsListViewTrainerAllproductsViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      allProductsListViewTrainerAllproductsViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      allProductsListViewIndex) {
                                                    final allProductsListViewTrainerAllproductsViewRow =
                                                        allProductsListViewTrainerAllproductsViewRowList[
                                                            allProductsListViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  9.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF2F4F5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      150.0,
                                                                  minHeight:
                                                                      110.0,
                                                                  maxWidth:
                                                                      150.0,
                                                                  maxHeight:
                                                                      110.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        allProductsListViewTrainerAllproductsViewRow
                                                                            .productPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/no-image-icon-6.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fitHeight,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (valueOrDefault<String>(
                                                                                allProductsListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Training Plan') {
                                                                            return 'План тренировки';
                                                                          } else if (valueOrDefault<String>(
                                                                                allProductsListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Digital Product') {
                                                                            return 'Цифровой продукт';
                                                                          } else if (valueOrDefault<String>(
                                                                                allProductsListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Nutrition Plan') {
                                                                            return 'План питания';
                                                                          } else {
                                                                            return 'Тренировка';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          18.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          allProductsListViewTrainerAllproductsViewRow
                                                                              .productName,
                                                                          'Нет названия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Продано: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                allProductsListViewTrainerAllproductsViewRow.timesSold?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: () {
                                                                                if (allProductsListViewTrainerAllproductsViewRow.timesSold == 2) {
                                                                                  return ' раза';
                                                                                } else if (allProductsListViewTrainerAllproductsViewRow.timesSold == 3) {
                                                                                  return ' раза';
                                                                                } else if (allProductsListViewTrainerAllproductsViewRow.timesSold == 4) {
                                                                                  return ' раза';
                                                                                } else {
                                                                                  return ' раз';
                                                                                }
                                                                              }(),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'На сумму: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  allProductsListViewTrainerAllproductsViewRow.totalAmount,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '## ₽',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 0.0),
                                              child: Text(
                                                'Оплатившие клиенты',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<ClientAllproductsViewRow>>(
                                              future:
                                                  ClientAllproductsViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth
                                                          .toDouble(),
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear
                                                          ?.toDouble(),
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<ClientAllproductsViewRow>
                                                    allProdClientsClientAllproductsViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      allProdClientsClientAllproductsViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      allProdClientsIndex) {
                                                    final allProdClientsClientAllproductsViewRow =
                                                        allProdClientsClientAllproductsViewRowList[
                                                            allProdClientsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  19.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF7F1FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        23.0,
                                                                        23.0,
                                                                        13.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      allProdClientsClientAllproductsViewRow
                                                                          .userPhoto,
                                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          22.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          allProdClientsClientAllproductsViewRow
                                                                              .userName,
                                                                          'Нет имени',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (allProdClientsClientAllproductsViewRow.productType ==
                                                                              'Training Plan') {
                                                                            return 'План тренировки';
                                                                          } else if (allProdClientsClientAllproductsViewRow.productType ==
                                                                              'Digital Product') {
                                                                            return 'Цифровой продукт';
                                                                          } else if (allProdClientsClientAllproductsViewRow.productType ==
                                                                              'Nutrition Plan') {
                                                                            return 'План питания';
                                                                          } else {
                                                                            return 'Тренировка';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          14.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          allProdClientsClientAllproductsViewRow
                                                                              .productName,
                                                                          'Нет названия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            13.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            FFAppState().chatUserName =
                                                                                allProdClientsClientAllproductsViewRow.userName!;
                                                                            safeSetState(() {});
                                                                            _model.chatExistSales =
                                                                                await ChatsTable().queryRows(
                                                                              queryFn: (q) => q
                                                                                  .containsOrNull(
                                                                                    'chat_members',
                                                                                    '{${allProdClientsClientAllproductsViewRow.userId}}',
                                                                                  )
                                                                                  .containsOrNull(
                                                                                    'chat_members',
                                                                                    '{${currentUserUid}}',
                                                                                  ),
                                                                            );
                                                                            if (_model.chatExistSales!.length >
                                                                                0) {
                                                                              FFAppState().chatUserName = allProdClientsClientAllproductsViewRow.userName!;

                                                                              context.pushNamed(
                                                                                CoachChatWithClientWidget.routeName,
                                                                                queryParameters: {
                                                                                  'chatID': serializeParam(
                                                                                    _model.chatExistSales?.firstOrNull?.id,
                                                                                    ParamType.int,
                                                                                  ),
                                                                                  'chatMembers': serializeParam(
                                                                                    _model.chatExistSales?.firstOrNull?.chatMembers,
                                                                                    ParamType.String,
                                                                                    isList: true,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            } else {
                                                                              _model.chatCreatedSales = await ChatsTable().insert({
                                                                                'chat_members': (String user, String trainer) {
                                                                                  return [user] + [trainer];
                                                                                }(allProdClientsClientAllproductsViewRow.userId!, currentUserUid),
                                                                              });
                                                                              FFAppState().chatUserName = allProdClientsClientAllproductsViewRow.userName!;

                                                                              context.pushNamed(
                                                                                CoachChatWithClientWidget.routeName,
                                                                                queryParameters: {
                                                                                  'chatID': serializeParam(
                                                                                    _model.chatCreatedSales?.id,
                                                                                    ParamType.int,
                                                                                  ),
                                                                                  'chatMembers': serializeParam(
                                                                                    _model.chatCreatedSales?.chatMembers,
                                                                                    ParamType.String,
                                                                                    isList: true,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                170.0,
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0xFF7B43CE),
                                                                                  Color(0xFFFF740F)
                                                                                ],
                                                                                stops: [
                                                                                  0.0,
                                                                                  1.0
                                                                                ],
                                                                                begin: AlignmentDirectional(0.69, -1.0),
                                                                                end: AlignmentDirectional(-0.69, 1.0),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 8.0, 0.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/messages-2.svg',
                                                                                      width: 24.0,
                                                                                      height: 24.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Написать клиенту',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (_model.choiceChipsValue ==
                                  'Тренировки') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 10.0),
                                              child: Text(
                                                'Продажи по продуктам:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    TrainerAllproductsViewRow>>(
                                              future:
                                                  TrainerAllproductsViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'product_type',
                                                      'Training',
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth,
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear,
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<TrainerAllproductsViewRow>
                                                    trainingsBoughtTrainerAllproductsViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      trainingsBoughtTrainerAllproductsViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      trainingsBoughtIndex) {
                                                    final trainingsBoughtTrainerAllproductsViewRow =
                                                        trainingsBoughtTrainerAllproductsViewRowList[
                                                            trainingsBoughtIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  9.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF2F4F5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      150.0,
                                                                  minHeight:
                                                                      110.0,
                                                                  maxWidth:
                                                                      150.0,
                                                                  maxHeight:
                                                                      110.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        trainingsBoughtTrainerAllproductsViewRow
                                                                            .productPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/_training_shadow1.jpg',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (valueOrDefault<String>(
                                                                                trainingsBoughtTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Training Plan') {
                                                                            return 'План тренировки';
                                                                          } else if (valueOrDefault<String>(
                                                                                trainingsBoughtTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Digital Product') {
                                                                            return 'Цифровой продукт';
                                                                          } else if (valueOrDefault<String>(
                                                                                trainingsBoughtTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Nutrition Plan') {
                                                                            return 'План питания';
                                                                          } else {
                                                                            return 'Тренировка';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          18.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          trainingsBoughtTrainerAllproductsViewRow
                                                                              .productName,
                                                                          'Нет названия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Продано: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                trainingsBoughtTrainerAllproductsViewRow.timesSold?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: () {
                                                                                if (trainingsBoughtTrainerAllproductsViewRow.timesSold == 2) {
                                                                                  return ' раза';
                                                                                } else if (trainingsBoughtTrainerAllproductsViewRow.timesSold == 3) {
                                                                                  return ' раза';
                                                                                } else if (trainingsBoughtTrainerAllproductsViewRow.timesSold == 4) {
                                                                                  return ' раза';
                                                                                } else {
                                                                                  return ' раз';
                                                                                }
                                                                              }(),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'На сумму: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  trainingsBoughtTrainerAllproductsViewRow.totalAmount,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '## ₽',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 0.0),
                                              child: Text(
                                                'Оплатившие клиенты',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    ClientTrainingsboughtViewRow>>(
                                              future:
                                                  ClientTrainingsboughtViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth
                                                          .toDouble(),
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear
                                                          ?.toDouble(),
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<ClientTrainingsboughtViewRow>
                                                    trainingsClientsClientTrainingsboughtViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      trainingsClientsClientTrainingsboughtViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      trainingsClientsIndex) {
                                                    final trainingsClientsClientTrainingsboughtViewRow =
                                                        trainingsClientsClientTrainingsboughtViewRowList[
                                                            trainingsClientsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  19.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF7F1FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        23.0,
                                                                        23.0,
                                                                        13.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      trainingsClientsClientTrainingsboughtViewRow
                                                                          .userPhoto,
                                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            22.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        trainingsClientsClientTrainingsboughtViewRow
                                                                            .userName,
                                                                        'Нет имени',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            14.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        trainingsClientsClientTrainingsboughtViewRow
                                                                            .trainingName,
                                                                        'Нет названия',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          13.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().chatUserName =
                                                                              trainingsClientsClientTrainingsboughtViewRow.userName!;
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.chatExistTrainings =
                                                                              await ChatsTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${trainingsClientsClientTrainingsboughtViewRow.userId}}',
                                                                                )
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${currentUserUid}}',
                                                                                ),
                                                                          );
                                                                          if (_model.chatExistTrainings!.length >
                                                                              0) {
                                                                            FFAppState().chatUserName =
                                                                                trainingsClientsClientTrainingsboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatExistTrainings?.firstOrNull?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatExistTrainings?.firstOrNull?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else {
                                                                            _model.chatCreatedTrainings =
                                                                                await ChatsTable().insert({
                                                                              'chat_members': (String user, String trainer) {
                                                                                return [user] + [trainer];
                                                                              }(trainingsClientsClientTrainingsboughtViewRow.userId!, currentUserUid),
                                                                            });
                                                                            FFAppState().chatUserName =
                                                                                trainingsClientsClientTrainingsboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatCreatedTrainings?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatCreatedTrainings?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              170.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0xFF7B43CE),
                                                                                Color(0xFFFF740F)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.69, -1.0),
                                                                              end: AlignmentDirectional(-0.69, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/messages-2.svg',
                                                                                    width: 24.0,
                                                                                    height: 24.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Написать клиенту',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (_model.choiceChipsValue ==
                                  'Планы питания') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 10.0),
                                              child: Text(
                                                'Продажи по продуктам:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    TrainerAllproductsViewRow>>(
                                              future:
                                                  TrainerAllproductsViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'product_type',
                                                      'Nutrition Plan',
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth,
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear,
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<TrainerAllproductsViewRow>
                                                    nutritionPlansListViewTrainerAllproductsViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      nutritionPlansListViewTrainerAllproductsViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      nutritionPlansListViewIndex) {
                                                    final nutritionPlansListViewTrainerAllproductsViewRow =
                                                        nutritionPlansListViewTrainerAllproductsViewRowList[
                                                            nutritionPlansListViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  9.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF2F4F5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      150.0,
                                                                  minHeight:
                                                                      110.0,
                                                                  maxWidth:
                                                                      150.0,
                                                                  maxHeight:
                                                                      110.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        nutritionPlansListViewTrainerAllproductsViewRow
                                                                            .productPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/no-image-icon-6.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (valueOrDefault<String>(
                                                                                nutritionPlansListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Training Plan') {
                                                                            return 'План тренировки';
                                                                          } else if (valueOrDefault<String>(
                                                                                nutritionPlansListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Digital Product') {
                                                                            return 'Цифровой продукт';
                                                                          } else if (valueOrDefault<String>(
                                                                                nutritionPlansListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Nutrition Plan') {
                                                                            return 'План питания';
                                                                          } else {
                                                                            return 'Тренировка';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          18.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          nutritionPlansListViewTrainerAllproductsViewRow
                                                                              .productName,
                                                                          'Нет названия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Продано: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                nutritionPlansListViewTrainerAllproductsViewRow.timesSold?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: () {
                                                                                if (nutritionPlansListViewTrainerAllproductsViewRow.timesSold == 2) {
                                                                                  return ' раза';
                                                                                } else if (nutritionPlansListViewTrainerAllproductsViewRow.timesSold == 3) {
                                                                                  return ' раза';
                                                                                } else if (nutritionPlansListViewTrainerAllproductsViewRow.timesSold == 4) {
                                                                                  return ' раза';
                                                                                } else {
                                                                                  return ' раз';
                                                                                }
                                                                              }(),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'На сумму: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  nutritionPlansListViewTrainerAllproductsViewRow.totalAmount,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '## ₽',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 0.0),
                                              child: Text(
                                                'Оплатившие клиенты',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    ClientNutritionplanboughtViewRow>>(
                                              future:
                                                  ClientNutritionplanboughtViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth
                                                          .toDouble(),
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear
                                                          ?.toDouble(),
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<ClientNutritionplanboughtViewRow>
                                                    nutritionPlansClientsClientNutritionplanboughtViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      nutritionPlansClientsClientNutritionplanboughtViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      nutritionPlansClientsIndex) {
                                                    final nutritionPlansClientsClientNutritionplanboughtViewRow =
                                                        nutritionPlansClientsClientNutritionplanboughtViewRowList[
                                                            nutritionPlansClientsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  19.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF7F1FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          23.0,
                                                                          23.0,
                                                                          13.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    nutritionPlansClientsClientNutritionplanboughtViewRow
                                                                        .userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            22.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        nutritionPlansClientsClientNutritionplanboughtViewRow
                                                                            .userName,
                                                                        'Нет имени',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            14.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        nutritionPlansClientsClientNutritionplanboughtViewRow
                                                                            .nutritionPlanName,
                                                                        'Нет названия',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          13.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().chatUserName =
                                                                              nutritionPlansClientsClientNutritionplanboughtViewRow.userName!;
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.chatExistsNutriPlan =
                                                                              await ChatsTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${nutritionPlansClientsClientNutritionplanboughtViewRow.userId}}',
                                                                                )
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${currentUserUid}}',
                                                                                ),
                                                                          );
                                                                          if (_model.chatExistsNutriPlan!.length >
                                                                              0) {
                                                                            FFAppState().chatUserName =
                                                                                nutritionPlansClientsClientNutritionplanboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatExistsNutriPlan?.firstOrNull?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatExistsNutriPlan?.firstOrNull?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else {
                                                                            _model.chatCreatedNutriPlan =
                                                                                await ChatsTable().insert({
                                                                              'chat_members': (String user, String trainer) {
                                                                                return [user] + [trainer];
                                                                              }(nutritionPlansClientsClientNutritionplanboughtViewRow.userId!, currentUserUid),
                                                                            });
                                                                            FFAppState().chatUserName =
                                                                                nutritionPlansClientsClientNutritionplanboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatCreatedNutriPlan?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatCreatedNutriPlan?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              170.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0xFF7B43CE),
                                                                                Color(0xFFFF740F)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.69, -1.0),
                                                                              end: AlignmentDirectional(-0.69, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/messages-2.svg',
                                                                                    width: 24.0,
                                                                                    height: 24.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 6.0, 0.0),
                                                                                child: Text(
                                                                                  'Написать клиенту',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (_model.choiceChipsValue ==
                                  'Планы тренировок') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 10.0),
                                              child: Text(
                                                'Продажи по продуктам:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    TrainerAllproductsViewRow>>(
                                              future:
                                                  TrainerAllproductsViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'product_type',
                                                      'Training Plan',
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth,
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear,
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<TrainerAllproductsViewRow>
                                                    trainingPlansListViewTrainerAllproductsViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      trainingPlansListViewTrainerAllproductsViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      trainingPlansListViewIndex) {
                                                    final trainingPlansListViewTrainerAllproductsViewRow =
                                                        trainingPlansListViewTrainerAllproductsViewRowList[
                                                            trainingPlansListViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  9.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF2F4F5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      150.0,
                                                                  minHeight:
                                                                      110.0,
                                                                  maxWidth:
                                                                      150.0,
                                                                  maxHeight:
                                                                      110.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        trainingPlansListViewTrainerAllproductsViewRow
                                                                            .productPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/no-image-icon-6.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (valueOrDefault<String>(
                                                                                trainingPlansListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Training Plan') {
                                                                            return 'План тренировки';
                                                                          } else if (valueOrDefault<String>(
                                                                                trainingPlansListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Digital Product') {
                                                                            return 'Цифровой продукт';
                                                                          } else if (valueOrDefault<String>(
                                                                                trainingPlansListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Nutrition Plan') {
                                                                            return 'План питания';
                                                                          } else {
                                                                            return 'Тренировка';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          18.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          trainingPlansListViewTrainerAllproductsViewRow
                                                                              .productName,
                                                                          'Нет названия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Продано: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                trainingPlansListViewTrainerAllproductsViewRow.timesSold?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: () {
                                                                                if (trainingPlansListViewTrainerAllproductsViewRow.timesSold == 2) {
                                                                                  return ' раза';
                                                                                } else if (trainingPlansListViewTrainerAllproductsViewRow.timesSold == 3) {
                                                                                  return ' раза';
                                                                                } else if (trainingPlansListViewTrainerAllproductsViewRow.timesSold == 4) {
                                                                                  return ' раза';
                                                                                } else {
                                                                                  return ' раз';
                                                                                }
                                                                              }(),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'На сумму: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  trainingPlansListViewTrainerAllproductsViewRow.totalAmount,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '## ₽',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 19.0, 0.0, 0.0),
                                              child: Text(
                                                'Оплатившие клиенты',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    ClientTrainingplanboughtViewRow>>(
                                              future:
                                                  ClientTrainingplanboughtViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth
                                                          .toDouble(),
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear
                                                          ?.toDouble(),
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<ClientTrainingplanboughtViewRow>
                                                    trainingPlansClientsClientTrainingplanboughtViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      trainingPlansClientsClientTrainingplanboughtViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      trainingPlansClientsIndex) {
                                                    final trainingPlansClientsClientTrainingplanboughtViewRow =
                                                        trainingPlansClientsClientTrainingplanboughtViewRowList[
                                                            trainingPlansClientsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  19.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF7F1FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        23.0,
                                                                        23.0,
                                                                        13.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      trainingPlansClientsClientTrainingplanboughtViewRow
                                                                          .userPhoto,
                                                                      'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            22.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        trainingPlansClientsClientTrainingplanboughtViewRow
                                                                            .userName,
                                                                        'Нет имени',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            14.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        trainingPlansClientsClientTrainingplanboughtViewRow
                                                                            .trainingPlanName,
                                                                        'Нет названия',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          13.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().chatUserName =
                                                                              trainingPlansClientsClientTrainingplanboughtViewRow.userName!;
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.chatExistTrainPlans =
                                                                              await ChatsTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${trainingPlansClientsClientTrainingplanboughtViewRow.userId}}',
                                                                                )
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${currentUserUid}}',
                                                                                ),
                                                                          );
                                                                          if (_model.chatExistTrainPlans!.length >
                                                                              0) {
                                                                            FFAppState().chatUserName =
                                                                                trainingPlansClientsClientTrainingplanboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatExistTrainPlans?.firstOrNull?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatExistTrainPlans?.firstOrNull?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else {
                                                                            _model.chatCreatedTrainPlans =
                                                                                await ChatsTable().insert({
                                                                              'chat_members': (String user, String trainer) {
                                                                                return [user] + [trainer];
                                                                              }(trainingPlansClientsClientTrainingplanboughtViewRow.userId!, currentUserUid),
                                                                            });
                                                                            FFAppState().chatUserName =
                                                                                trainingPlansClientsClientTrainingplanboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatCreatedTrainPlans?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatCreatedTrainPlans?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              170.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0xFF7B43CE),
                                                                                Color(0xFFFF740F)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.69, -1.0),
                                                                              end: AlignmentDirectional(-0.69, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/messages-2.svg',
                                                                                    width: 24.0,
                                                                                    height: 24.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Написать клиенту',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 15.0, 0.0, 10.0),
                                              child: Text(
                                                'Продажи по продуктам:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    TrainerAllproductsViewRow>>(
                                              future:
                                                  TrainerAllproductsViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'product_type',
                                                      'Digital Product',
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth,
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear,
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<TrainerAllproductsViewRow>
                                                    digiProdListViewTrainerAllproductsViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      digiProdListViewTrainerAllproductsViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      digiProdListViewIndex) {
                                                    final digiProdListViewTrainerAllproductsViewRow =
                                                        digiProdListViewTrainerAllproductsViewRowList[
                                                            digiProdListViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  9.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF2F4F5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      150.0,
                                                                  minHeight:
                                                                      110.0,
                                                                  maxWidth:
                                                                      150.0,
                                                                  maxHeight:
                                                                      110.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        digiProdListViewTrainerAllproductsViewRow
                                                                            .productPhoto,
                                                                        'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/no-image-icon-6.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fitHeight,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (valueOrDefault<String>(
                                                                                digiProdListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Training Plan') {
                                                                            return 'План тренировки';
                                                                          } else if (valueOrDefault<String>(
                                                                                digiProdListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Digital Product') {
                                                                            return 'Цифровой продукт';
                                                                          } else if (valueOrDefault<String>(
                                                                                digiProdListViewTrainerAllproductsViewRow.productType,
                                                                                'Нет типа продукта',
                                                                              ) ==
                                                                              'Nutrition Plan') {
                                                                            return 'План питания';
                                                                          } else {
                                                                            return 'Тренировка';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          18.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          digiProdListViewTrainerAllproductsViewRow
                                                                              .productName,
                                                                          'Нет названия',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF2C2C2C),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          1.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'Продано: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                digiProdListViewTrainerAllproductsViewRow.timesSold?.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: () {
                                                                                if (digiProdListViewTrainerAllproductsViewRow.timesSold == 2) {
                                                                                  return ' раза';
                                                                                } else if (digiProdListViewTrainerAllproductsViewRow.timesSold == 3) {
                                                                                  return ' раза';
                                                                                } else if (digiProdListViewTrainerAllproductsViewRow.timesSold == 4) {
                                                                                  return ' раза';
                                                                                } else {
                                                                                  return ' раз';
                                                                                }
                                                                              }(),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: 'На сумму: ',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF8D8D8D),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            TextSpan(
                                                                              text: valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  digiProdListViewTrainerAllproductsViewRow.totalAmount,
                                                                                  formatType: FormatType.custom,
                                                                                  format: '## ₽',
                                                                                  locale: '',
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: GoogleFonts.inter(
                                                                                color: Color(0xFF2C2C2C),
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 14.0, 16.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 15.0, 0.0, 10.0),
                                              child: Text(
                                                'Оплатившие клиенты',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            FutureBuilder<
                                                List<
                                                    ClientDigiprodboughtViewRow>>(
                                              future:
                                                  ClientDigiprodboughtViewTable()
                                                      .queryRows(
                                                queryFn: (q) => q
                                                    .eqOrNull(
                                                      'trainer_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'sale_month',
                                                      _model.saleMonth
                                                          .toDouble(),
                                                    )
                                                    .eqOrNull(
                                                      'sale_year',
                                                      _model.saleYear
                                                          ?.toDouble(),
                                                    ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Image.asset(
                                                    'assets/images/logo.png',
                                                  );
                                                }
                                                List<ClientDigiprodboughtViewRow>
                                                    digiprodClientsClientDigiprodboughtViewRowList =
                                                    snapshot.data!;

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      digiprodClientsClientDigiprodboughtViewRowList
                                                          .length,
                                                  itemBuilder: (context,
                                                      digiprodClientsIndex) {
                                                    final digiprodClientsClientDigiprodboughtViewRow =
                                                        digiprodClientsClientDigiprodboughtViewRowList[
                                                            digiprodClientsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  9.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF7F1FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          23.0,
                                                                          23.0,
                                                                          13.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    digiprodClientsClientDigiprodboughtViewRow
                                                                        .userPhoto,
                                                                    'https://supa.3146577-db61528.twc1.net/storage/v1/object/public/acly-public/images/blank-profile-picture.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            22.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        digiprodClientsClientDigiprodboughtViewRow
                                                                            .userName,
                                                                        'Нет имени',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            14.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        digiprodClientsClientDigiprodboughtViewRow
                                                                            .digiprodName,
                                                                        'Нет названия',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF2C2C2C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          13.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().chatUserName =
                                                                              digiprodClientsClientDigiprodboughtViewRow.userName!;
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.chatExistDigiprod =
                                                                              await ChatsTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${digiprodClientsClientDigiprodboughtViewRow.userId}}',
                                                                                )
                                                                                .containsOrNull(
                                                                                  'chat_members',
                                                                                  '{${currentUserUid}}',
                                                                                ),
                                                                          );
                                                                          if (_model.chatExistDigiprod!.length >
                                                                              0) {
                                                                            FFAppState().chatUserName =
                                                                                digiprodClientsClientDigiprodboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatExistDigiprod?.firstOrNull?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatExistDigiprod?.firstOrNull?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          } else {
                                                                            _model.chatCreatedDigiProd =
                                                                                await ChatsTable().insert({
                                                                              'chat_members': (String user, String trainer) {
                                                                                return [user] + [trainer];
                                                                              }(digiprodClientsClientDigiprodboughtViewRow.userId!, currentUserUid),
                                                                            });
                                                                            FFAppState().chatUserName =
                                                                                digiprodClientsClientDigiprodboughtViewRow.userName!;

                                                                            context.pushNamed(
                                                                              CoachChatWithClientWidget.routeName,
                                                                              queryParameters: {
                                                                                'chatID': serializeParam(
                                                                                  _model.chatCreatedDigiProd?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                                'chatMembers': serializeParam(
                                                                                  _model.chatCreatedDigiProd?.chatMembers,
                                                                                  ParamType.String,
                                                                                  isList: true,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              170.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0xFF7B43CE),
                                                                                Color(0xFFFF740F)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.69, -1.0),
                                                                              end: AlignmentDirectional(-0.69, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.0),
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/messages-2.svg',
                                                                                    width: 24.0,
                                                                                    height: 24.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 6.0, 0.0),
                                                                                child: Text(
                                                                                  'Написать клиенту',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ].addToEnd(SizedBox(height: 150.0)),
                      ),
                    ),
                  ),
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
        ),
      ),
    );
  }
}
