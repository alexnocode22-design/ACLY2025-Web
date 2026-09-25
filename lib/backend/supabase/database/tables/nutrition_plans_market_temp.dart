import '../database.dart';

class NutritionPlansMarketTempTable
    extends SupabaseTable<NutritionPlansMarketTempRow> {
  @override
  String get tableName => 'nutrition_plans_market_temp';

  @override
  NutritionPlansMarketTempRow createRow(Map<String, dynamic> data) =>
      NutritionPlansMarketTempRow(data);
}

class NutritionPlansMarketTempRow extends SupabaseDataRow {
  NutritionPlansMarketTempRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NutritionPlansMarketTempTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get trainerId => getField<String>('trainer_id')!;
  set trainerId(String value) => setField<String>('trainer_id', value);

  String get draftType => getField<String>('draft_type')!;
  set draftType(String value) => setField<String>('draft_type', value);

  int? get sourcePlanId => getField<int>('source_plan_id');
  set sourcePlanId(int? value) => setField<int>('source_plan_id', value);

  String? get nutritionPlanName => getField<String>('nutrition_plan_name');
  set nutritionPlanName(String? value) =>
      setField<String>('nutrition_plan_name', value);

  String? get nutritionPlanDescription =>
      getField<String>('nutrition_plan_description');
  set nutritionPlanDescription(String? value) =>
      setField<String>('nutrition_plan_description', value);

  int? get nutritionPlanPrice => getField<int>('nutrition_plan_price');
  set nutritionPlanPrice(int? value) =>
      setField<int>('nutrition_plan_price', value);

  List<String> get nutritionPlanPhoto =>
      getListField<String>('nutrition_plan_photo');
  set nutritionPlanPhoto(List<String>? value) =>
      setListField<String>('nutrition_plan_photo', value);

  String? get nutritionPlanPhoto1 => getField<String>('nutrition_plan_photo1');
  set nutritionPlanPhoto1(String? value) =>
      setField<String>('nutrition_plan_photo1', value);

  String? get nutritionPlanPhoto2 => getField<String>('nutrition_plan_photo2');
  set nutritionPlanPhoto2(String? value) =>
      setField<String>('nutrition_plan_photo2', value);

  String? get nutritionPlanPhoto3 => getField<String>('nutrition_plan_photo3');
  set nutritionPlanPhoto3(String? value) =>
      setField<String>('nutrition_plan_photo3', value);

  String? get nutritionPlanPhoto4 => getField<String>('nutrition_plan_photo4');
  set nutritionPlanPhoto4(String? value) =>
      setField<String>('nutrition_plan_photo4', value);

  String? get nutritionPlanPhoto5 => getField<String>('nutrition_plan_photo5');
  set nutritionPlanPhoto5(String? value) =>
      setField<String>('nutrition_plan_photo5', value);

  String? get nutritionPlanFile => getField<String>('nutrition_plan_file');
  set nutritionPlanFile(String? value) =>
      setField<String>('nutrition_plan_file', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);
}
