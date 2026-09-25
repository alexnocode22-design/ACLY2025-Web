import '../database.dart';

class NutritionplanBoughtTable extends SupabaseTable<NutritionplanBoughtRow> {
  @override
  String get tableName => 'nutritionplanBought';

  @override
  NutritionplanBoughtRow createRow(Map<String, dynamic> data) =>
      NutritionplanBoughtRow(data);
}

class NutritionplanBoughtRow extends SupabaseDataRow {
  NutritionplanBoughtRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NutritionplanBoughtTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get nutritionPlanId => getField<int>('nutrition_plan_id');
  set nutritionPlanId(int? value) => setField<int>('nutrition_plan_id', value);

  String? get nutritionPlanName => getField<String>('nutrition_plan_name');
  set nutritionPlanName(String? value) =>
      setField<String>('nutrition_plan_name', value);

  String? get nutritionPlanPhoto1 => getField<String>('nutrition_plan_photo1');
  set nutritionPlanPhoto1(String? value) =>
      setField<String>('nutrition_plan_photo1', value);

  int? get nutritionPlanPrice => getField<int>('nutrition_plan_price');
  set nutritionPlanPrice(int? value) =>
      setField<int>('nutrition_plan_price', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get nutritionPlanPayed => getField<bool>('nutrition_plan_payed');
  set nutritionPlanPayed(bool? value) =>
      setField<bool>('nutrition_plan_payed', value);
}
