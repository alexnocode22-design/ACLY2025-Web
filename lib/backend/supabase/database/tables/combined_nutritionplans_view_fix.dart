import '../database.dart';

class CombinedNutritionplansViewFixTable
    extends SupabaseTable<CombinedNutritionplansViewFixRow> {
  @override
  String get tableName => 'combined_nutritionplans_view_fix';

  @override
  CombinedNutritionplansViewFixRow createRow(Map<String, dynamic> data) =>
      CombinedNutritionplansViewFixRow(data);
}

class CombinedNutritionplansViewFixRow extends SupabaseDataRow {
  CombinedNutritionplansViewFixRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CombinedNutritionplansViewFixTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get trainerSpecs => getField<String>('trainer_specs');
  set trainerSpecs(String? value) => setField<String>('trainer_specs', value);

  String? get trainerExpirience => getField<String>('trainer_expirience');
  set trainerExpirience(String? value) =>
      setField<String>('trainer_expirience', value);

  int? get trainerHourPrice => getField<int>('trainer_hour_price');
  set trainerHourPrice(int? value) =>
      setField<int>('trainer_hour_price', value);

  String? get trainerDescription => getField<String>('trainer_description');
  set trainerDescription(String? value) =>
      setField<String>('trainer_description', value);

  double? get trainerRating => getField<double>('trainer_rating');
  set trainerRating(double? value) => setField<double>('trainer_rating', value);

  DateTime? get nutritionPlanCreatedAt =>
      getField<DateTime>('nutrition_plan_created_at');
  set nutritionPlanCreatedAt(DateTime? value) =>
      setField<DateTime>('nutrition_plan_created_at', value);

  String? get nutritionPlanName => getField<String>('nutrition_plan_name');
  set nutritionPlanName(String? value) =>
      setField<String>('nutrition_plan_name', value);

  String? get nutritionPlanCategory =>
      getField<String>('nutrition_plan_category');
  set nutritionPlanCategory(String? value) =>
      setField<String>('nutrition_plan_category', value);

  String? get nutritionPlanDescription =>
      getField<String>('nutrition_plan_description');
  set nutritionPlanDescription(String? value) =>
      setField<String>('nutrition_plan_description', value);

  int? get nutritionPlanPrice => getField<int>('nutrition_plan_price');
  set nutritionPlanPrice(int? value) =>
      setField<int>('nutrition_plan_price', value);

  String? get nutritionPlanVideo => getField<String>('nutrition_plan_video');
  set nutritionPlanVideo(String? value) =>
      setField<String>('nutrition_plan_video', value);

  bool? get nutritionPlanStatus => getField<bool>('nutrition_plan_status');
  set nutritionPlanStatus(bool? value) =>
      setField<bool>('nutrition_plan_status', value);

  DateTime? get nutritionPlanUserRegDate =>
      getField<DateTime>('nutrition_plan_user_reg_date');
  set nutritionPlanUserRegDate(DateTime? value) =>
      setField<DateTime>('nutrition_plan_user_reg_date', value);

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

  bool? get nutritionPlanPublish => getField<bool>('nutrition_plan_publish');
  set nutritionPlanPublish(bool? value) =>
      setField<bool>('nutrition_plan_publish', value);

  String? get nutritionPlanFile => getField<String>('nutrition_plan_file');
  set nutritionPlanFile(String? value) =>
      setField<String>('nutrition_plan_file', value);
}
