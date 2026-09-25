import '../database.dart';

class TrainingPlanMarketTable extends SupabaseTable<TrainingPlanMarketRow> {
  @override
  String get tableName => 'trainingPlanMarket';

  @override
  TrainingPlanMarketRow createRow(Map<String, dynamic> data) =>
      TrainingPlanMarketRow(data);
}

class TrainingPlanMarketRow extends SupabaseDataRow {
  TrainingPlanMarketRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingPlanMarketTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

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

  List<String> get trainingPlanPhoto =>
      getListField<String>('training_plan_photo');
  set trainingPlanPhoto(List<String>? value) =>
      setListField<String>('training_plan_photo', value);
}
