import '../database.dart';

class TemplateCombinedViewTable extends SupabaseTable<TemplateCombinedViewRow> {
  @override
  String get tableName => 'template_combined_view';

  @override
  TemplateCombinedViewRow createRow(Map<String, dynamic> data) =>
      TemplateCombinedViewRow(data);
}

class TemplateCombinedViewRow extends SupabaseDataRow {
  TemplateCombinedViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TemplateCombinedViewTable();

  int? get blockId => getField<int>('block_id');
  set blockId(int? value) => setField<int>('block_id', value);

  DateTime? get blockCreatedAt => getField<DateTime>('block_created_at');
  set blockCreatedAt(DateTime? value) =>
      setField<DateTime>('block_created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get templateBlockName => getField<String>('template_block_name');
  set templateBlockName(String? value) =>
      setField<String>('template_block_name', value);

  bool? get templateBlockType => getField<bool>('template_block_type');
  set templateBlockType(bool? value) =>
      setField<bool>('template_block_type', value);

  int? get templateExerciseQty => getField<int>('template_exercise_qty');
  set templateExerciseQty(int? value) =>
      setField<int>('template_exercise_qty', value);

  int? get exerciseId => getField<int>('exercise_id');
  set exerciseId(int? value) => setField<int>('exercise_id', value);

  DateTime? get exerciseCreatedAt => getField<DateTime>('exercise_created_at');
  set exerciseCreatedAt(DateTime? value) =>
      setField<DateTime>('exercise_created_at', value);

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

  int? get approachId => getField<int>('approach_id');
  set approachId(int? value) => setField<int>('approach_id', value);

  DateTime? get approachCreatedAt => getField<DateTime>('approach_created_at');
  set approachCreatedAt(DateTime? value) =>
      setField<DateTime>('approach_created_at', value);

  int? get approachNr => getField<int>('approach_nr');
  set approachNr(int? value) => setField<int>('approach_nr', value);

  int? get weight => getField<int>('weight');
  set weight(int? value) => setField<int>('weight', value);

  int? get repeats => getField<int>('repeats');
  set repeats(int? value) => setField<int>('repeats', value);

  int? get durationMin => getField<int>('duration_min');
  set durationMin(int? value) => setField<int>('duration_min', value);
}
