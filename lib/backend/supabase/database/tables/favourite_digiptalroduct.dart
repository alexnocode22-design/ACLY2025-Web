import '../database.dart';

class FavouriteDigiptalroductTable
    extends SupabaseTable<FavouriteDigiptalroductRow> {
  @override
  String get tableName => 'favourite_digiptalroduct';

  @override
  FavouriteDigiptalroductRow createRow(Map<String, dynamic> data) =>
      FavouriteDigiptalroductRow(data);
}

class FavouriteDigiptalroductRow extends SupabaseDataRow {
  FavouriteDigiptalroductRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavouriteDigiptalroductTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int get digitalproductId => getField<int>('digitalproduct_id')!;
  set digitalproductId(int value) => setField<int>('digitalproduct_id', value);
}
