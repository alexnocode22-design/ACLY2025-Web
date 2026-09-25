import '../database.dart';

class ClientNutritionplanboughtViewTable
    extends SupabaseTable<ClientNutritionplanboughtViewRow> {
  @override
  String get tableName => 'client_nutritionplanbought_view';

  @override
  ClientNutritionplanboughtViewRow createRow(Map<String, dynamic> data) =>
      ClientNutritionplanboughtViewRow(data);
}

class ClientNutritionplanboughtViewRow extends SupabaseDataRow {
  ClientNutritionplanboughtViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientNutritionplanboughtViewTable();

  int? get purchaseId => getField<int>('purchase_id');
  set purchaseId(int? value) => setField<int>('purchase_id', value);

  int? get nutritionPlanId => getField<int>('nutrition_plan_id');
  set nutritionPlanId(int? value) => setField<int>('nutrition_plan_id', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get nutritionPlanName => getField<String>('nutrition_plan_name');
  set nutritionPlanName(String? value) =>
      setField<String>('nutrition_plan_name', value);

  String? get nutritionPlanPhoto1 => getField<String>('nutrition_plan_photo1');
  set nutritionPlanPhoto1(String? value) =>
      setField<String>('nutrition_plan_photo1', value);

  int? get nutritionPlanPrice => getField<int>('nutrition_plan_price');
  set nutritionPlanPrice(int? value) =>
      setField<int>('nutrition_plan_price', value);

  DateTime? get purchaseDate => getField<DateTime>('purchase_date');
  set purchaseDate(DateTime? value) =>
      setField<DateTime>('purchase_date', value);

  int? get userProfileId => getField<int>('user_profile_id');
  set userProfileId(int? value) => setField<int>('user_profile_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  bool? get userActive => getField<bool>('user_active');
  set userActive(bool? value) => setField<bool>('user_active', value);

  double? get saleMonth => getField<double>('sale_month');
  set saleMonth(double? value) => setField<double>('sale_month', value);

  double? get saleYear => getField<double>('sale_year');
  set saleYear(double? value) => setField<double>('sale_year', value);
}
