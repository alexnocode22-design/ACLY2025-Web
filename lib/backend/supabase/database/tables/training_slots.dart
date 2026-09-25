import '../database.dart';

class TrainingSlotsTable extends SupabaseTable<TrainingSlotsRow> {
  @override
  String get tableName => 'training_slots';

  @override
  TrainingSlotsRow createRow(Map<String, dynamic> data) =>
      TrainingSlotsRow(data);
}

class TrainingSlotsRow extends SupabaseDataRow {
  TrainingSlotsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingSlotsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get trainerId => getField<String>('trainer_id')!;
  set trainerId(String value) => setField<String>('trainer_id', value);

  int? get trainingId => getField<int>('training_id');
  set trainingId(int? value) => setField<int>('training_id', value);

  String get dayOfWeek => getField<String>('day_of_week')!;
  set dayOfWeek(String value) => setField<String>('day_of_week', value);

  PostgresTime get startTime => getField<PostgresTime>('start_time')!;
  set startTime(PostgresTime value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime get endTime => getField<PostgresTime>('end_time')!;
  set endTime(PostgresTime value) => setField<PostgresTime>('end_time', value);

  int get slotDuration => getField<int>('slot_duration')!;
  set slotDuration(int value) => setField<int>('slot_duration', value);

  bool? get isAvailable => getField<bool>('is_available');
  set isAvailable(bool? value) => setField<bool>('is_available', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get monthAvailability => getField<bool>('month_availability');
  set monthAvailability(bool? value) =>
      setField<bool>('month_availability', value);

  DateTime? get slotDate => getField<DateTime>('slot_date');
  set slotDate(DateTime? value) => setField<DateTime>('slot_date', value);
}
