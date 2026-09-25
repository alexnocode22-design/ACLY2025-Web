import '../database.dart';

class TrainingSlotsWithBookingInfoTable
    extends SupabaseTable<TrainingSlotsWithBookingInfoRow> {
  @override
  String get tableName => 'training_slots_with_booking_info';

  @override
  TrainingSlotsWithBookingInfoRow createRow(Map<String, dynamic> data) =>
      TrainingSlotsWithBookingInfoRow(data);
}

class TrainingSlotsWithBookingInfoRow extends SupabaseDataRow {
  TrainingSlotsWithBookingInfoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingSlotsWithBookingInfoTable();

  int? get slotId => getField<int>('slot_id');
  set slotId(int? value) => setField<int>('slot_id', value);

  int? get trainingId => getField<int>('training_id');
  set trainingId(int? value) => setField<int>('training_id', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  int? get slotDuration => getField<int>('slot_duration');
  set slotDuration(int? value) => setField<int>('slot_duration', value);

  DateTime? get slotDate => getField<DateTime>('slot_date');
  set slotDate(DateTime? value) => setField<DateTime>('slot_date', value);

  PostgresTime? get slotStartTime => getField<PostgresTime>('slot_start_time');
  set slotStartTime(PostgresTime? value) =>
      setField<PostgresTime>('slot_start_time', value);

  PostgresTime? get slotEndTime => getField<PostgresTime>('slot_end_time');
  set slotEndTime(PostgresTime? value) =>
      setField<PostgresTime>('slot_end_time', value);

  DateTime? get slotStartDatetime => getField<DateTime>('slot_start_datetime');
  set slotStartDatetime(DateTime? value) =>
      setField<DateTime>('slot_start_datetime', value);

  DateTime? get slotEndDatetime => getField<DateTime>('slot_end_datetime');
  set slotEndDatetime(DateTime? value) =>
      setField<DateTime>('slot_end_datetime', value);

  bool? get isAvailable => getField<bool>('is_available');
  set isAvailable(bool? value) => setField<bool>('is_available', value);

  String? get dayOfWeek => getField<String>('day_of_week');
  set dayOfWeek(String? value) => setField<String>('day_of_week', value);

  String? get trainingName => getField<String>('training_name');
  set trainingName(String? value) => setField<String>('training_name', value);

  int? get trainingPrice => getField<int>('training_price');
  set trainingPrice(int? value) => setField<int>('training_price', value);

  String? get trainingPhoto1 => getField<String>('training_photo1');
  set trainingPhoto1(String? value) =>
      setField<String>('training_photo1', value);

  int? get bookingId => getField<int>('booking_id');
  set bookingId(int? value) => setField<int>('booking_id', value);

  String? get bookedByUserId => getField<String>('booked_by_user_id');
  set bookedByUserId(String? value) =>
      setField<String>('booked_by_user_id', value);

  bool? get trainingPayed => getField<bool>('training_payed');
  set trainingPayed(bool? value) => setField<bool>('training_payed', value);

  bool? get slotCancelled => getField<bool>('slot_cancelled');
  set slotCancelled(bool? value) => setField<bool>('slot_cancelled', value);

  DateTime? get bookedAt => getField<DateTime>('booked_at');
  set bookedAt(DateTime? value) => setField<DateTime>('booked_at', value);
}
