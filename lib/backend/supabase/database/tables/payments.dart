import '../database.dart';

class PaymentsTable extends SupabaseTable<PaymentsRow> {
  @override
  String get tableName => 'payments';

  @override
  PaymentsRow createRow(Map<String, dynamic> data) => PaymentsRow(data);
}

class PaymentsRow extends SupabaseDataRow {
  PaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PaymentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get paymentStatus => getField<bool>('payment_status');
  set paymentStatus(bool? value) => setField<bool>('payment_status', value);

  DateTime? get paymentDate => getField<DateTime>('payment_date');
  set paymentDate(DateTime? value) => setField<DateTime>('payment_date', value);

  int? get paymentAmount => getField<int>('payment_amount');
  set paymentAmount(int? value) => setField<int>('payment_amount', value);

  String? get paymentDestination => getField<String>('payment_destination');
  set paymentDestination(String? value) =>
      setField<String>('payment_destination', value);

  int? get paymentId => getField<int>('payment_id');
  set paymentId(int? value) => setField<int>('payment_id', value);

  bool? get paymentIsRecurrent => getField<bool>('payment_is_recurrent');
  set paymentIsRecurrent(bool? value) =>
      setField<bool>('payment_is_recurrent', value);
}
