import '../database.dart';

class TrainingsBookedTempTable extends SupabaseTable<TrainingsBookedTempRow> {
  @override
  String get tableName => 'trainings_booked_temp';

  @override
  TrainingsBookedTempRow createRow(Map<String, dynamic> data) =>
      TrainingsBookedTempRow(data);
}

class TrainingsBookedTempRow extends SupabaseDataRow {
  TrainingsBookedTempRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingsBookedTempTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int? get trainingId => getField<int>('training_id');
  set trainingId(int? value) => setField<int>('training_id', value);

  String get trainerId => getField<String>('trainer_id')!;
  set trainerId(String value) => setField<String>('trainer_id', value);

  int? get slotId => getField<int>('slot_id');
  set slotId(int? value) => setField<int>('slot_id', value);

  DateTime? get slotDate => getField<DateTime>('slot_date');
  set slotDate(DateTime? value) => setField<DateTime>('slot_date', value);

  DateTime? get slotStartDatetime => getField<DateTime>('slot_start_datetime');
  set slotStartDatetime(DateTime? value) =>
      setField<DateTime>('slot_start_datetime', value);

  int? get slotDuration => getField<int>('slot_duration');
  set slotDuration(int? value) => setField<int>('slot_duration', value);

  String? get trainingName => getField<String>('training_name');
  set trainingName(String? value) => setField<String>('training_name', value);

  String? get trainingPhoto1 => getField<String>('training_photo1');
  set trainingPhoto1(String? value) =>
      setField<String>('training_photo1', value);

  int? get trainingPrice => getField<int>('training_price');
  set trainingPrice(int? value) => setField<int>('training_price', value);

  String? get sessionId => getField<String>('session_id');
  set sessionId(String? value) => setField<String>('session_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get trainingQuantity => getField<int>('training_quantity');
  set trainingQuantity(int? value) => setField<int>('training_quantity', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);
}
