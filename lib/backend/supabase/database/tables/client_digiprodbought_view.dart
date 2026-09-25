import '../database.dart';

class ClientDigiprodboughtViewTable
    extends SupabaseTable<ClientDigiprodboughtViewRow> {
  @override
  String get tableName => 'client_digiprodbought_view';

  @override
  ClientDigiprodboughtViewRow createRow(Map<String, dynamic> data) =>
      ClientDigiprodboughtViewRow(data);
}

class ClientDigiprodboughtViewRow extends SupabaseDataRow {
  ClientDigiprodboughtViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientDigiprodboughtViewTable();

  int? get purchaseId => getField<int>('purchase_id');
  set purchaseId(int? value) => setField<int>('purchase_id', value);

  int? get digiprodId => getField<int>('digiprod_id');
  set digiprodId(int? value) => setField<int>('digiprod_id', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get digiprodName => getField<String>('digiprod_name');
  set digiprodName(String? value) => setField<String>('digiprod_name', value);

  String? get digiprodPhoto1 => getField<String>('digiprod_photo1');
  set digiprodPhoto1(String? value) =>
      setField<String>('digiprod_photo1', value);

  int? get digiprodPrice => getField<int>('digiprod_price');
  set digiprodPrice(int? value) => setField<int>('digiprod_price', value);

  DateTime? get purchaseDate => getField<DateTime>('purchase_date');
  set purchaseDate(DateTime? value) =>
      setField<DateTime>('purchase_date', value);

  int? get userProfileId => getField<int>('user_profile_id');
  set userProfileId(int? value) => setField<int>('user_profile_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  bool? get userActive => getField<bool>('user_active');
  set userActive(bool? value) => setField<bool>('user_active', value);

  double? get saleMonth => getField<double>('sale_month');
  set saleMonth(double? value) => setField<double>('sale_month', value);

  double? get saleYear => getField<double>('sale_year');
  set saleYear(double? value) => setField<double>('sale_year', value);
}
