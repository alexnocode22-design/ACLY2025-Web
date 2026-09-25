import '../database.dart';

class FavouriteNutritionplanTable
    extends SupabaseTable<FavouriteNutritionplanRow> {
  @override
  String get tableName => 'favourite_nutritionplan';

  @override
  FavouriteNutritionplanRow createRow(Map<String, dynamic> data) =>
      FavouriteNutritionplanRow(data);
}

class FavouriteNutritionplanRow extends SupabaseDataRow {
  FavouriteNutritionplanRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavouriteNutritionplanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get nutritionplanId => getField<int>('nutritionplan_id')!;
  set nutritionplanId(int value) => setField<int>('nutritionplan_id', value);
}
