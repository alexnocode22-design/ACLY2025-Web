import '../database.dart';

class TrainingsBoughtTable extends SupabaseTable<TrainingsBoughtRow> {
  @override
  String get tableName => 'trainingsBought';

  @override
  TrainingsBoughtRow createRow(Map<String, dynamic> data) =>
      TrainingsBoughtRow(data);
}

class TrainingsBoughtRow extends SupabaseDataRow {
  TrainingsBoughtRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingsBoughtTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get trainingId => getField<int>('training_id');
  set trainingId(int? value) => setField<int>('training_id', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  int? get trainingQuantity => getField<int>('training_quantity');
  set trainingQuantity(int? value) => setField<int>('training_quantity', value);

  int? get trainingPrice => getField<int>('training_price');
  set trainingPrice(int? value) => setField<int>('training_price', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get slotStartDatetime => getField<DateTime>('slot_start_datetime');
  set slotStartDatetime(DateTime? value) =>
      setField<DateTime>('slot_start_datetime', value);

  int? get slotId => getField<int>('slot_id');
  set slotId(int? value) => setField<int>('slot_id', value);

  int? get slotDuration => getField<int>('slot_duration');
  set slotDuration(int? value) => setField<int>('slot_duration', value);

  String? get trainingName => getField<String>('training_name');
  set trainingName(String? value) => setField<String>('training_name', value);

  bool? get trainingPayed => getField<bool>('training_payed');
  set trainingPayed(bool? value) => setField<bool>('training_payed', value);

  bool? get slotCancelled => getField<bool>('slot_cancelled');
  set slotCancelled(bool? value) => setField<bool>('slot_cancelled', value);

  String? get trainingPhoto1 => getField<String>('training_photo1');
  set trainingPhoto1(String? value) =>
      setField<String>('training_photo1', value);
}
