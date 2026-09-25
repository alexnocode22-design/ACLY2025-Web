import '../database.dart';

class DigitalProductMarketTable extends SupabaseTable<DigitalProductMarketRow> {
  @override
  String get tableName => 'digitalProductMarket';

  @override
  DigitalProductMarketRow createRow(Map<String, dynamic> data) =>
      DigitalProductMarketRow(data);
}

class DigitalProductMarketRow extends SupabaseDataRow {
  DigitalProductMarketRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DigitalProductMarketTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get digitalProductName => getField<String>('digital_product_name');
  set digitalProductName(String? value) =>
      setField<String>('digital_product_name', value);

  String? get digitalProductCategory =>
      getField<String>('digital_product_category');
  set digitalProductCategory(String? value) =>
      setField<String>('digital_product_category', value);

  String? get digitalProductDescription =>
      getField<String>('digital_product_description');
  set digitalProductDescription(String? value) =>
      setField<String>('digital_product_description', value);

  int? get digitalProductPrice => getField<int>('digital_product_price');
  set digitalProductPrice(int? value) =>
      setField<int>('digital_product_price', value);

  String? get digitalProductVideo => getField<String>('digital_product_video');
  set digitalProductVideo(String? value) =>
      setField<String>('digital_product_video', value);

  bool? get digitalProductStatus => getField<bool>('digital_product_status');
  set digitalProductStatus(bool? value) =>
      setField<bool>('digital_product_status', value);

  DateTime? get digitalProductUserRegDate =>
      getField<DateTime>('digital_product_user_reg_date');
  set digitalProductUserRegDate(DateTime? value) =>
      setField<DateTime>('digital_product_user_reg_date', value);

  String? get digitalProductPhoto1 =>
      getField<String>('digital_product_photo1');
  set digitalProductPhoto1(String? value) =>
      setField<String>('digital_product_photo1', value);

  String? get digitalProductPhoto2 =>
      getField<String>('digital_product_photo2');
  set digitalProductPhoto2(String? value) =>
      setField<String>('digital_product_photo2', value);

  String? get digitalProductPhoto3 =>
      getField<String>('digital_product_photo3');
  set digitalProductPhoto3(String? value) =>
      setField<String>('digital_product_photo3', value);

  String? get digitalProductPhoto4 =>
      getField<String>('digital_product_photo4');
  set digitalProductPhoto4(String? value) =>
      setField<String>('digital_product_photo4', value);

  String? get digitalProductPhoto5 =>
      getField<String>('digital_product_photo5');
  set digitalProductPhoto5(String? value) =>
      setField<String>('digital_product_photo5', value);

  bool? get digitalProductPublish => getField<bool>('digital_product_publish');
  set digitalProductPublish(bool? value) =>
      setField<bool>('digital_product_publish', value);

  String? get digitalProductFile => getField<String>('digital_product_file');
  set digitalProductFile(String? value) =>
      setField<String>('digital_product_file', value);

  List<String> get digitalProductPhoto =>
      getListField<String>('digital_product_photo');
  set digitalProductPhoto(List<String>? value) =>
      setListField<String>('digital_product_photo', value);
}
