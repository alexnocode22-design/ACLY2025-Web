import '../database.dart';

class TrainerScheduleIntervalsTable
    extends SupabaseTable<TrainerScheduleIntervalsRow> {
  @override
  String get tableName => 'trainer_schedule_intervals';

  @override
  TrainerScheduleIntervalsRow createRow(Map<String, dynamic> data) =>
      TrainerScheduleIntervalsRow(data);
}

class TrainerScheduleIntervalsRow extends SupabaseDataRow {
  TrainerScheduleIntervalsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainerScheduleIntervalsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get trainerId => getField<String>('trainer_id')!;
  set trainerId(String value) => setField<String>('trainer_id', value);

  String get dayOfWeek => getField<String>('day_of_week')!;
  set dayOfWeek(String value) => setField<String>('day_of_week', value);

  int get intervalNumber => getField<int>('interval_number')!;
  set intervalNumber(int value) => setField<int>('interval_number', value);

  PostgresTime get startTime => getField<PostgresTime>('start_time')!;
  set startTime(PostgresTime value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime get endTime => getField<PostgresTime>('end_time')!;
  set endTime(PostgresTime value) => setField<PostgresTime>('end_time', value);

  bool? get enabled => getField<bool>('enabled');
  set enabled(bool? value) => setField<bool>('enabled', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int get trainingId => getField<int>('training_id')!;
  set trainingId(int value) => setField<int>('training_id', value);
}
