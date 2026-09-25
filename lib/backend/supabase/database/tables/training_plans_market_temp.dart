import '../database.dart';

class TrainingPlansMarketTempTable
    extends SupabaseTable<TrainingPlansMarketTempRow> {
  @override
  String get tableName => 'training_plans_market_temp';

  @override
  TrainingPlansMarketTempRow createRow(Map<String, dynamic> data) =>
      TrainingPlansMarketTempRow(data);
}

class TrainingPlansMarketTempRow extends SupabaseDataRow {
  TrainingPlansMarketTempRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingPlansMarketTempTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get trainerId => getField<String>('trainer_id')!;
  set trainerId(String value) => setField<String>('trainer_id', value);

  String? get trainingPlanName => getField<String>('training_plan_name');
  set trainingPlanName(String? value) =>
      setField<String>('training_plan_name', value);

  String? get trainingPlanDescription =>
      getField<String>('training_plan_description');
  set trainingPlanDescription(String? value) =>
      setField<String>('training_plan_description', value);

  int? get trainingPlanPrice => getField<int>('training_plan_price');
  set trainingPlanPrice(int? value) =>
      setField<int>('training_plan_price', value);

  List<String> get trainingPlanPhoto =>
      getListField<String>('training_plan_photo');
  set trainingPlanPhoto(List<String>? value) =>
      setListField<String>('training_plan_photo', value);

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

  String? get trainingPlanFile => getField<String>('training_plan_file');
  set trainingPlanFile(String? value) =>
      setField<String>('training_plan_file', value);

  DateTime? get lastHeartbeat => getField<DateTime>('last_heartbeat');
  set lastHeartbeat(DateTime? value) =>
      setField<DateTime>('last_heartbeat', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get draftType => getField<String>('draft_type');
  set draftType(String? value) => setField<String>('draft_type', value);

  int? get sourcePlanId => getField<int>('source_plan_id');
  set sourcePlanId(int? value) => setField<int>('source_plan_id', value);
}
