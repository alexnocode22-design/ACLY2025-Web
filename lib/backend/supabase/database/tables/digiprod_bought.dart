import '../database.dart';

class DigiprodBoughtTable extends SupabaseTable<DigiprodBoughtRow> {
  @override
  String get tableName => 'digiprodBought';

  @override
  DigiprodBoughtRow createRow(Map<String, dynamic> data) =>
      DigiprodBoughtRow(data);
}

class DigiprodBoughtRow extends SupabaseDataRow {
  DigiprodBoughtRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DigiprodBoughtTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get digiprodId => getField<int>('digiprod_id');
  set digiprodId(int? value) => setField<int>('digiprod_id', value);

  String? get digiprodName => getField<String>('digiprod_name');
  set digiprodName(String? value) => setField<String>('digiprod_name', value);

  String? get digiprodPhoto1 => getField<String>('digiprod_photo1');
  set digiprodPhoto1(String? value) =>
      setField<String>('digiprod_photo1', value);

  int? get digiprodPrice => getField<int>('digiprod_price');
  set digiprodPrice(int? value) => setField<int>('digiprod_price', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get digiprodPayed => getField<bool>('digiprod_payed');
  set digiprodPayed(bool? value) => setField<bool>('digiprod_payed', value);
}
