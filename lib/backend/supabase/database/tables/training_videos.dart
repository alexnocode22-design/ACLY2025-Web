import '../database.dart';

class TrainingVideosTable extends SupabaseTable<TrainingVideosRow> {
  @override
  String get tableName => 'training_videos';

  @override
  TrainingVideosRow createRow(Map<String, dynamic> data) =>
      TrainingVideosRow(data);
}

class TrainingVideosRow extends SupabaseDataRow {
  TrainingVideosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingVideosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get moduleId => getField<int>('module_id');
  set moduleId(int? value) => setField<int>('module_id', value);

  String? get videoName => getField<String>('video_name');
  set videoName(String? value) => setField<String>('video_name', value);

  String? get videoDescription => getField<String>('video_description');
  set videoDescription(String? value) =>
      setField<String>('video_description', value);

  String? get videoUrl => getField<String>('video_url');
  set videoUrl(String? value) => setField<String>('video_url', value);
}
