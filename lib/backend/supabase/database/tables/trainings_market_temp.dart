import '../database.dart';

class TrainingsMarketTempTable extends SupabaseTable<TrainingsMarketTempRow> {
  @override
  String get tableName => 'trainings_market_temp';

  @override
  TrainingsMarketTempRow createRow(Map<String, dynamic> data) =>
      TrainingsMarketTempRow(data);
}

class TrainingsMarketTempRow extends SupabaseDataRow {
  TrainingsMarketTempRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingsMarketTempTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get trainerId => getField<String>('trainer_id')!;
  set trainerId(String value) => setField<String>('trainer_id', value);

  int? get sourceTrainingId => getField<int>('source_training_id');
  set sourceTrainingId(int? value) =>
      setField<int>('source_training_id', value);

  String? get trainingName => getField<String>('training_name');
  set trainingName(String? value) => setField<String>('training_name', value);

  String? get trainingDescription => getField<String>('training_description');
  set trainingDescription(String? value) =>
      setField<String>('training_description', value);

  int? get trainingPrice => getField<int>('training_price');
  set trainingPrice(int? value) => setField<int>('training_price', value);

  int? get slotDuration => getField<int>('slot_duration');
  set slotDuration(int? value) => setField<int>('slot_duration', value);

  List<String> get trainingPhoto => getListField<String>('training_photo');
  set trainingPhoto(List<String>? value) =>
      setListField<String>('training_photo', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);

  String? get draftType => getField<String>('draft_type');
  set draftType(String? value) => setField<String>('draft_type', value);

  String? get trainingPhoto1 => getField<String>('training_photo1');
  set trainingPhoto1(String? value) =>
      setField<String>('training_photo1', value);

  String? get trainingPhoto2 => getField<String>('training_photo2');
  set trainingPhoto2(String? value) =>
      setField<String>('training_photo2', value);

  String? get trainingPhoto3 => getField<String>('training_photo3');
  set trainingPhoto3(String? value) =>
      setField<String>('training_photo3', value);

  String? get trainingPhoto4 => getField<String>('training_photo4');
  set trainingPhoto4(String? value) =>
      setField<String>('training_photo4', value);

  String? get trainingPhoto5 => getField<String>('training_photo5');
  set trainingPhoto5(String? value) =>
      setField<String>('training_photo5', value);
}
