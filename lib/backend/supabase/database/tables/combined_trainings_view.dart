import '../database.dart';

class CombinedTrainingsViewTable
    extends SupabaseTable<CombinedTrainingsViewRow> {
  @override
  String get tableName => 'combined_trainings_view';

  @override
  CombinedTrainingsViewRow createRow(Map<String, dynamic> data) =>
      CombinedTrainingsViewRow(data);
}

class CombinedTrainingsViewRow extends SupabaseDataRow {
  CombinedTrainingsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CombinedTrainingsViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get trainingName => getField<String>('training_name');
  set trainingName(String? value) => setField<String>('training_name', value);

  String? get trainingCategory => getField<String>('training_category');
  set trainingCategory(String? value) =>
      setField<String>('training_category', value);

  String? get trainingDescription => getField<String>('training_description');
  set trainingDescription(String? value) =>
      setField<String>('training_description', value);

  int? get trainingPrice => getField<int>('training_price');
  set trainingPrice(int? value) => setField<int>('training_price', value);

  String? get trainingVideo => getField<String>('training_video');
  set trainingVideo(String? value) => setField<String>('training_video', value);

  bool? get trainingStatus => getField<bool>('training_status');
  set trainingStatus(bool? value) => setField<bool>('training_status', value);

  bool? get trainingSolo => getField<bool>('training_solo');
  set trainingSolo(bool? value) => setField<bool>('training_solo', value);

  int? get trainingQuantity => getField<int>('training_quantity');
  set trainingQuantity(int? value) => setField<int>('training_quantity', value);

  DateTime? get trainingUserRegDate =>
      getField<DateTime>('training_user_reg_date');
  set trainingUserRegDate(DateTime? value) =>
      setField<DateTime>('training_user_reg_date', value);

  String? get userTrainerDoc => getField<String>('user_trainer_doc');
  set userTrainerDoc(String? value) =>
      setField<String>('user_trainer_doc', value);

  String? get trainingPhoto1 => getField<String>('training_photo1');
  set trainingPhoto1(String? value) =>
      setField<String>('training_photo1', value);

  String? get trainingPhoto2 => getField<String>('training_photo2');
  set trainingPhoto2(String? value) =>
      setField<String>('training_photo2', value);

  String? get trainingPhoto3 => getField<String>('training_photo3');
  set trainingPhoto3(String? value) =>
      setField<String>('training_photo3', value);

  String? get trainingPhoto4 => getField<String>('training_photo4');
  set trainingPhoto4(String? value) =>
      setField<String>('training_photo4', value);

  String? get trainingPhoto5 => getField<String>('training_photo5');
  set trainingPhoto5(String? value) =>
      setField<String>('training_photo5', value);

  bool? get trainingPublish => getField<bool>('training_publish');
  set trainingPublish(bool? value) => setField<bool>('training_publish', value);

  int? get slotDuration => getField<int>('slot_duration');
  set slotDuration(int? value) => setField<int>('slot_duration', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  bool? get trainerActive => getField<bool>('trainer_active');
  set trainerActive(bool? value) => setField<bool>('trainer_active', value);
}
