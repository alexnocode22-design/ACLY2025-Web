import '../database.dart';

class FavouriteTrainingsTable extends SupabaseTable<FavouriteTrainingsRow> {
  @override
  String get tableName => 'favourite_trainings';

  @override
  FavouriteTrainingsRow createRow(Map<String, dynamic> data) =>
      FavouriteTrainingsRow(data);
}

class FavouriteTrainingsRow extends SupabaseDataRow {
  FavouriteTrainingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavouriteTrainingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get trainingId => getField<int>('training_id')!;
  set trainingId(int value) => setField<int>('training_id', value);
}
