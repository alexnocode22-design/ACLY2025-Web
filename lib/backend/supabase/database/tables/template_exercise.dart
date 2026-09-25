import '../database.dart';

class TemplateExerciseTable extends SupabaseTable<TemplateExerciseRow> {
  @override
  String get tableName => 'template_exercise';

  @override
  TemplateExerciseRow createRow(Map<String, dynamic> data) =>
      TemplateExerciseRow(data);
}

class TemplateExerciseRow extends SupabaseDataRow {
  TemplateExerciseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TemplateExerciseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get templateBlockId => getField<int>('template_block_id');
  set templateBlockId(int? value) => setField<int>('template_block_id', value);

  int? get exerciseOrderNumber => getField<int>('exercise_order_number');
  set exerciseOrderNumber(int? value) =>
      setField<int>('exercise_order_number', value);

  String? get exerciseName => getField<String>('exercise_name');
  set exerciseName(String? value) => setField<String>('exercise_name', value);

  int? get approachQty => getField<int>('approach_qty');
  set approachQty(int? value) => setField<int>('approach_qty', value);

  bool? get exerciseTimer => getField<bool>('exercise_timer');
  set exerciseTimer(bool? value) => setField<bool>('exercise_timer', value);

  bool? get exerciseSecTimer => getField<bool>('exercise_sec_timer');
  set exerciseSecTimer(bool? value) =>
      setField<bool>('exercise_sec_timer', value);
}
