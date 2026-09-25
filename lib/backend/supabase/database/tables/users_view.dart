import '../database.dart';

class UsersViewTable extends SupabaseTable<UsersViewRow> {
  @override
  String get tableName => 'users_view';

  @override
  UsersViewRow createRow(Map<String, dynamic> data) => UsersViewRow(data);
}

class UsersViewRow extends SupabaseDataRow {
  UsersViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userSurname => getField<String>('user_surname');
  set userSurname(String? value) => setField<String>('user_surname', value);

  String? get userPhoto => getField<String>('user_photo');
  set userPhoto(String? value) => setField<String>('user_photo', value);

  String? get userPushToken => getField<String>('user_push_token');
  set userPushToken(String? value) =>
      setField<String>('user_push_token', value);

  String? get userNickname => getField<String>('user_nickname');
  set userNickname(String? value) => setField<String>('user_nickname', value);

  String? get userPhone => getField<String>('user_phone');
  set userPhone(String? value) => setField<String>('user_phone', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  bool? get userActive => getField<bool>('user_active');
  set userActive(bool? value) => setField<bool>('user_active', value);

  String? get userComments => getField<String>('user_comments');
  set userComments(String? value) => setField<String>('user_comments', value);

  DateTime? get userBlockedAt => getField<DateTime>('user_blocked_at');
  set userBlockedAt(DateTime? value) =>
      setField<DateTime>('user_blocked_at', value);

  String? get roleName => getField<String>('role_name');
  set roleName(String? value) => setField<String>('role_name', value);
}
