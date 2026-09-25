import '../database.dart';

class UserRolesViewTable extends SupabaseTable<UserRolesViewRow> {
  @override
  String get tableName => 'user_roles_view';

  @override
  UserRolesViewRow createRow(Map<String, dynamic> data) =>
      UserRolesViewRow(data);
}

class UserRolesViewRow extends SupabaseDataRow {
  UserRolesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRolesViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<String> get roles => getListField<String>('roles');
  set roles(List<String>? value) => setListField<String>('roles', value);

  List<int> get roleIds => getListField<int>('role_ids');
  set roleIds(List<int>? value) => setListField<int>('role_ids', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);
}
