import '../database.dart';

class TrainingplanBoughtTable extends SupabaseTable<TrainingplanBoughtRow> {
  @override
  String get tableName => 'trainingplanBought';

  @override
  TrainingplanBoughtRow createRow(Map<String, dynamic> data) =>
      TrainingplanBoughtRow(data);
}

class TrainingplanBoughtRow extends SupabaseDataRow {
  TrainingplanBoughtRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingplanBoughtTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get trainingPlanId => getField<int>('training_plan_id');
  set trainingPlanId(int? value) => setField<int>('training_plan_id', value);

  String? get trainingPlanName => getField<String>('training_plan_name');
  set trainingPlanName(String? value) =>
      setField<String>('training_plan_name', value);

  String? get trainingPlanPhoto1 => getField<String>('training_plan_photo1');
  set trainingPlanPhoto1(String? value) =>
      setField<String>('training_plan_photo1', value);

  int? get trainingPlanPrice => getField<int>('training_plan_price');
  set trainingPlanPrice(int? value) =>
      setField<int>('training_plan_price', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get trainingPlanPayed => getField<bool>('training_plan_payed');
  set trainingPlanPayed(bool? value) =>
      setField<bool>('training_plan_payed', value);
}
