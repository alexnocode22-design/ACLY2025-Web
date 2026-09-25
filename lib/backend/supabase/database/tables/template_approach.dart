import '../database.dart';

class TemplateApproachTable extends SupabaseTable<TemplateApproachRow> {
  @override
  String get tableName => 'template_approach';

  @override
  TemplateApproachRow createRow(Map<String, dynamic> data) =>
      TemplateApproachRow(data);
}

class TemplateApproachRow extends SupabaseDataRow {
  TemplateApproachRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TemplateApproachTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get templateExerciseId => getField<int>('template_exercise_id');
  set templateExerciseId(int? value) =>
      setField<int>('template_exercise_id', value);

  int? get approachNr => getField<int>('approach_nr');
  set approachNr(int? value) => setField<int>('approach_nr', value);

  int? get weight => getField<int>('weight');
  set weight(int? value) => setField<int>('weight', value);

  int? get repeats => getField<int>('repeats');
  set repeats(int? value) => setField<int>('repeats', value);

  int? get durationMin => getField<int>('duration_min');
  set durationMin(int? value) => setField<int>('duration_min', value);
}
