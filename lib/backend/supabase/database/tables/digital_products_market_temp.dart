import '../database.dart';

class DigitalProductsMarketTempTable
    extends SupabaseTable<DigitalProductsMarketTempRow> {
  @override
  String get tableName => 'digital_products_market_temp';

  @override
  DigitalProductsMarketTempRow createRow(Map<String, dynamic> data) =>
      DigitalProductsMarketTempRow(data);
}

class DigitalProductsMarketTempRow extends SupabaseDataRow {
  DigitalProductsMarketTempRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DigitalProductsMarketTempTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get trainerId => getField<String>('trainer_id')!;
  set trainerId(String value) => setField<String>('trainer_id', value);

  String get draftType => getField<String>('draft_type')!;
  set draftType(String value) => setField<String>('draft_type', value);

  int? get sourceProductId => getField<int>('source_product_id');
  set sourceProductId(int? value) => setField<int>('source_product_id', value);

  String? get digitalProductName => getField<String>('digital_product_name');
  set digitalProductName(String? value) =>
      setField<String>('digital_product_name', value);

  String? get digitalProductDescription =>
      getField<String>('digital_product_description');
  set digitalProductDescription(String? value) =>
      setField<String>('digital_product_description', value);

  int? get digitalProductPrice => getField<int>('digital_product_price');
  set digitalProductPrice(int? value) =>
      setField<int>('digital_product_price', value);

  List<String> get digitalProductPhoto =>
      getListField<String>('digital_product_photo');
  set digitalProductPhoto(List<String>? value) =>
      setListField<String>('digital_product_photo', value);

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

  String? get digitalProductFile => getField<String>('digital_product_file');
  set digitalProductFile(String? value) =>
      setField<String>('digital_product_file', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);
}
