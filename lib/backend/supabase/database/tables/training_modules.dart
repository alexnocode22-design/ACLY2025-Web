import '../database.dart';

class TrainingModulesTable extends SupabaseTable<TrainingModulesRow> {
  @override
  String get tableName => 'training_modules';

  @override
  TrainingModulesRow createRow(Map<String, dynamic> data) =>
      TrainingModulesRow(data);
}

class TrainingModulesRow extends SupabaseDataRow {
  TrainingModulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingModulesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get trainingId => getField<int>('training_id');
  set trainingId(int? value) => setField<int>('training_id', value);

  String? get moduleName => getField<String>('module_name');
  set moduleName(String? value) => setField<String>('module_name', value);
}
