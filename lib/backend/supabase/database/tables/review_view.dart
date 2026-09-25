import '../database.dart';

class ReviewViewTable extends SupabaseTable<ReviewViewRow> {
  @override
  String get tableName => 'review_view';

  @override
  ReviewViewRow createRow(Map<String, dynamic> data) => ReviewViewRow(data);
}

class ReviewViewRow extends SupabaseDataRow {
  ReviewViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get reviewText => getField<String>('review_text');
  set reviewText(String? value) => setField<String>('review_text', value);

  int? get reviewRaiting => getField<int>('review_raiting');
  set reviewRaiting(int? value) => setField<int>('review_raiting', value);

  bool? get reviewStatus => getField<bool>('review_status');
  set reviewStatus(bool? value) => setField<bool>('review_status', value);

  String? get reviewObjectName => getField<String>('review_object_name');
  set reviewObjectName(String? value) =>
      setField<String>('review_object_name', value);

  int? get reviewObjectId => getField<int>('review_object_id');
  set reviewObjectId(int? value) => setField<int>('review_object_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get trainerId => getField<String>('trainer_id');
  set trainerId(String? value) => setField<String>('trainer_id', value);

  String? get reviewReply => getField<String>('review_reply');
  set reviewReply(String? value) => setField<String>('review_reply', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);
}
