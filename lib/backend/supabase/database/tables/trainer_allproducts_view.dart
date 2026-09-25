import '../database.dart';

class TrainerAllproductsViewTable
    extends SupabaseTable<TrainerAllproductsViewRow> {
  @override
  String get tableName => 'trainer_allproducts_view';

  @override
  TrainerAllproductsViewRow createRow(Map<String, dynamic> data) =>
      TrainerAllproductsViewRow(data);
}

class TrainerAllproductsViewRow extends SupabaseDataRow {
  TrainerAllproductsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainerAllproductsViewTable();

  int? get userProfileId => getField<int>('user_profile_id');
  set userProfileId(int? value) => setField<int>('user_profile_id', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  String? get productType => getField<String>('product_type');
  set productType(String? value) => setField<String>('product_type', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get productPhoto => getField<String>('product_photo');
  set productPhoto(String? value) => setField<String>('product_photo', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get timesSold => getField<int>('times_sold');
  set timesSold(int? value) => setField<int>('times_sold', value);

  int? get totalAmount => getField<int>('total_amount');
  set totalAmount(int? value) => setField<int>('total_amount', value);

  int? get saleMonth => getField<int>('sale_month');
  set saleMonth(int? value) => setField<int>('sale_month', value);

  int? get saleYear => getField<int>('sale_year');
  set saleYear(int? value) => setField<int>('sale_year', value);

  double? get monthAmount => getField<double>('month_amount');
  set monthAmount(double? value) => setField<double>('month_amount', value);

  double? get productTypeMonthAmount =>
      getField<double>('product_type_month_amount');
  set productTypeMonthAmount(double? value) =>
      setField<double>('product_type_month_amount', value);

  double? get productTypeMonthSalesCount =>
      getField<double>('product_type_month_sales_count');
  set productTypeMonthSalesCount(double? value) =>
      setField<double>('product_type_month_sales_count', value);

  String? get monthYearName => getField<String>('month_year_name');
  set monthYearName(String? value) =>
      setField<String>('month_year_name', value);

  String? get monthYearShort => getField<String>('month_year_short');
  set monthYearShort(String? value) =>
      setField<String>('month_year_short', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
