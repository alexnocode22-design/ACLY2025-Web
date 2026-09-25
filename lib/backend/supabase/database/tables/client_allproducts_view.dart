import '../database.dart';

class ClientAllproductsViewTable
    extends SupabaseTable<ClientAllproductsViewRow> {
  @override
  String get tableName => 'client_allproducts_view';

  @override
  ClientAllproductsViewRow createRow(Map<String, dynamic> data) =>
      ClientAllproductsViewRow(data);
}

class ClientAllproductsViewRow extends SupabaseDataRow {
  ClientAllproductsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientAllproductsViewTable();

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

  String? get productType => getField<String>('product_type');
  set productType(String? value) => setField<String>('product_type', value);

  int? get purchaseId => getField<int>('purchase_id');
  set purchaseId(int? value) => setField<int>('purchase_id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  DateTime? get purchaseDate => getField<DateTime>('purchase_date');
  set purchaseDate(DateTime? value) =>
      setField<DateTime>('purchase_date', value);

  double? get saleMonth => getField<double>('sale_month');
  set saleMonth(double? value) => setField<double>('sale_month', value);

  double? get saleYear => getField<double>('sale_year');
  set saleYear(double? value) => setField<double>('sale_year', value);
}
