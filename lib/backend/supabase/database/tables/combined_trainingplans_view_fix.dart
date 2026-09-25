import '../database.dart';

class CombinedTrainingplansViewFixTable
    extends SupabaseTable<CombinedTrainingplansViewFixRow> {
  @override
  String get tableName => 'combined_trainingplans_view_fix';

  @override
  CombinedTrainingplansViewFixRow createRow(Map<String, dynamic> data) =>
      CombinedTrainingplansViewFixRow(data);
}

class CombinedTrainingplansViewFixRow extends SupabaseDataRow {
  CombinedTrainingplansViewFixRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CombinedTrainingplansViewFixTable();

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

  DateTime? get planCreatedAt => getField<DateTime>('plan_created_at');
  set planCreatedAt(DateTime? value) =>
      setField<DateTime>('plan_created_at', value);

  String? get trainingPlanName => getField<String>('training_plan_name');
  set trainingPlanName(String? value) =>
      setField<String>('training_plan_name', value);

  String? get trainingPlanCategory =>
      getField<String>('training_plan_category');
  set trainingPlanCategory(String? value) =>
      setField<String>('training_plan_category', value);

  String? get trainingPlanDescription =>
      getField<String>('training_plan_description');
  set trainingPlanDescription(String? value) =>
      setField<String>('training_plan_description', value);

  int? get trainingPlanPrice => getField<int>('training_plan_price');
  set trainingPlanPrice(int? value) =>
      setField<int>('training_plan_price', value);

  String? get trainingPlanVideo => getField<String>('training_plan_video');
  set trainingPlanVideo(String? value) =>
      setField<String>('training_plan_video', value);

  bool? get trainingPlanStatus => getField<bool>('training_plan_status');
  set trainingPlanStatus(bool? value) =>
      setField<bool>('training_plan_status', value);

  DateTime? get trainingPlanUserRegDate =>
      getField<DateTime>('training_plan_user_reg_date');
  set trainingPlanUserRegDate(DateTime? value) =>
      setField<DateTime>('training_plan_user_reg_date', value);

  String? get trainingPlanPhoto1 => getField<String>('training_plan_photo1');
  set trainingPlanPhoto1(String? value) =>
      setField<String>('training_plan_photo1', value);

  String? get trainingPlanPhoto2 => getField<String>('training_plan_photo2');
  set trainingPlanPhoto2(String? value) =>
      setField<String>('training_plan_photo2', value);

  String? get trainingPlanPhoto3 => getField<String>('training_plan_photo3');
  set trainingPlanPhoto3(String? value) =>
      setField<String>('training_plan_photo3', value);

  String? get trainingPlanPhoto4 => getField<String>('training_plan_photo4');
  set trainingPlanPhoto4(String? value) =>
      setField<String>('training_plan_photo4', value);

  String? get trainingPlanPhoto5 => getField<String>('training_plan_photo5');
  set trainingPlanPhoto5(String? value) =>
      setField<String>('training_plan_photo5', value);

  bool? get trainingPlanPublish => getField<bool>('training_plan_publish');
  set trainingPlanPublish(bool? value) =>
      setField<bool>('training_plan_publish', value);

  String? get trainingPlanFile => getField<String>('training_plan_file');
  set trainingPlanFile(String? value) =>
      setField<String>('training_plan_file', value);
}
