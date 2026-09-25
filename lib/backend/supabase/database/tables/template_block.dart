import '../database.dart';

class TemplateBlockTable extends SupabaseTable<TemplateBlockRow> {
  @override
  String get tableName => 'template_block';

  @override
  TemplateBlockRow createRow(Map<String, dynamic> data) =>
      TemplateBlockRow(data);
}

class TemplateBlockRow extends SupabaseDataRow {
  TemplateBlockRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TemplateBlockTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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
}
