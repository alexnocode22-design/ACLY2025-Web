import '../database.dart';

class CombinedUserTrainerViewTable
    extends SupabaseTable<CombinedUserTrainerViewRow> {
  @override
  String get tableName => 'combined_user_trainer_view';

  @override
  CombinedUserTrainerViewRow createRow(Map<String, dynamic> data) =>
      CombinedUserTrainerViewRow(data);
}

class CombinedUserTrainerViewRow extends SupabaseDataRow {
  CombinedUserTrainerViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CombinedUserTrainerViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userNickname => getField<String>('user_nickname');
  set userNickname(String? value) => setField<String>('user_nickname', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  String? get userPhone => getField<String>('user_phone');
  set userPhone(String? value) => setField<String>('user_phone', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get trainerPushToken => getField<String>('trainer_push_token');
  set trainerPushToken(String? value) =>
      setField<String>('trainer_push_token', value);

  String? get trainerDoc => getField<String>('trainer_doc');
  set trainerDoc(String? value) => setField<String>('trainer_doc', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get trainerSpecs => getField<String>('trainer_specs');
  set trainerSpecs(String? value) => setField<String>('trainer_specs', value);

  String? get trainerExpirience => getField<String>('trainer_expirience');
  set trainerExpirience(String? value) =>
      setField<String>('trainer_expirience', value);

  int? get trainerHourPrice => getField<int>('trainer_hour_price');
  set trainerHourPrice(int? value) =>
      setField<int>('trainer_hour_price', value);

  String? get trainerDescription => getField<String>('trainer_description');
  set trainerDescription(String? value) =>
      setField<String>('trainer_description', value);

  String? get trainerCert1 => getField<String>('trainer_cert1');
  set trainerCert1(String? value) => setField<String>('trainer_cert1', value);

  String? get trainerCert2 => getField<String>('trainer_cert2');
  set trainerCert2(String? value) => setField<String>('trainer_cert2', value);

  String? get trainerCert3 => getField<String>('trainer_cert3');
  set trainerCert3(String? value) => setField<String>('trainer_cert3', value);

  String? get trainerCert4 => getField<String>('trainer_cert4');
  set trainerCert4(String? value) => setField<String>('trainer_cert4', value);

  String? get trainerCert5 => getField<String>('trainer_cert5');
  set trainerCert5(String? value) => setField<String>('trainer_cert5', value);

  String? get trainerCert6 => getField<String>('trainer_cert6');
  set trainerCert6(String? value) => setField<String>('trainer_cert6', value);

  String? get trainerCert7 => getField<String>('trainer_cert7');
  set trainerCert7(String? value) => setField<String>('trainer_cert7', value);

  String? get trainerCert8 => getField<String>('trainer_cert8');
  set trainerCert8(String? value) => setField<String>('trainer_cert8', value);

  String? get trainerCert9 => getField<String>('trainer_cert9');
  set trainerCert9(String? value) => setField<String>('trainer_cert9', value);

  String? get trainerCert10 => getField<String>('trainer_cert10');
  set trainerCert10(String? value) => setField<String>('trainer_cert10', value);

  String? get trainerPassport => getField<String>('trainer_passport');
  set trainerPassport(String? value) =>
      setField<String>('trainer_passport', value);

  double? get trainerRating => getField<double>('trainer_rating');
  set trainerRating(double? value) => setField<double>('trainer_rating', value);

  String? get trainerVideo => getField<String>('trainer_video');
  set trainerVideo(String? value) => setField<String>('trainer_video', value);

  bool? get trainerActive => getField<bool>('trainer_active');
  set trainerActive(bool? value) => setField<bool>('trainer_active', value);

  DateTime? get trainerActivatedAt =>
      getField<DateTime>('trainer_activated_at');
  set trainerActivatedAt(DateTime? value) =>
      setField<DateTime>('trainer_activated_at', value);

  bool? get trainerRefused => getField<bool>('trainer_refused');
  set trainerRefused(bool? value) => setField<bool>('trainer_refused', value);

  String? get trainerComments => getField<String>('trainer_comments');
  set trainerComments(String? value) =>
      setField<String>('trainer_comments', value);
}
