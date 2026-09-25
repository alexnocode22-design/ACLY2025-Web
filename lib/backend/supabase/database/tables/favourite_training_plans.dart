import '../database.dart';

class FavouriteTrainingPlansTable
    extends SupabaseTable<FavouriteTrainingPlansRow> {
  @override
  String get tableName => 'favourite_training_plans';

  @override
  FavouriteTrainingPlansRow createRow(Map<String, dynamic> data) =>
      FavouriteTrainingPlansRow(data);
}

class FavouriteTrainingPlansRow extends SupabaseDataRow {
  FavouriteTrainingPlansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavouriteTrainingPlansTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get trainingplanId => getField<int>('trainingplan_id')!;
  set trainingplanId(int value) => setField<int>('trainingplan_id', value);
}
