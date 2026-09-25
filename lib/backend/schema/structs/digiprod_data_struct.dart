// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DigiprodDataStruct extends BaseStruct {
  DigiprodDataStruct({
    String? userName,
    String? userSurname,
    String? userPhoto,
    String? digitalProductName,
    String? digitalProductDescription,
    String? digitalProductPhoto1,
    int? digitalProductPrice,
    int? id,
    bool? digitalProductStatus,
    bool? digitalProductPublish,
    bool? trainerActive,
  })  : _userName = userName,
        _userSurname = userSurname,
        _userPhoto = userPhoto,
        _digitalProductName = digitalProductName,
        _digitalProductDescription = digitalProductDescription,
        _digitalProductPhoto1 = digitalProductPhoto1,
        _digitalProductPrice = digitalProductPrice,
        _id = id,
        _digitalProductStatus = digitalProductStatus,
        _digitalProductPublish = digitalProductPublish,
        _trainerActive = trainerActive;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "user_surname" field.
  String? _userSurname;
  String get userSurname => _userSurname ?? '';
  set userSurname(String? val) => _userSurname = val;

  bool hasUserSurname() => _userSurname != null;

  // "user_photo" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  set userPhoto(String? val) => _userPhoto = val;

  bool hasUserPhoto() => _userPhoto != null;

  // "digital_product_name" field.
  String? _digitalProductName;
  String get digitalProductName => _digitalProductName ?? '';
  set digitalProductName(String? val) => _digitalProductName = val;

  bool hasDigitalProductName() => _digitalProductName != null;

  // "digital_product_description" field.
  String? _digitalProductDescription;
  String get digitalProductDescription => _digitalProductDescription ?? '';
  set digitalProductDescription(String? val) =>
      _digitalProductDescription = val;

  bool hasDigitalProductDescription() => _digitalProductDescription != null;

  // "digital_product_photo1" field.
  String? _digitalProductPhoto1;
  String get digitalProductPhoto1 => _digitalProductPhoto1 ?? '';
  set digitalProductPhoto1(String? val) => _digitalProductPhoto1 = val;

  bool hasDigitalProductPhoto1() => _digitalProductPhoto1 != null;

  // "digital_product_price" field.
  int? _digitalProductPrice;
  int get digitalProductPrice => _digitalProductPrice ?? 0;
  set digitalProductPrice(int? val) => _digitalProductPrice = val;

  void incrementDigitalProductPrice(int amount) =>
      digitalProductPrice = digitalProductPrice + amount;

  bool hasDigitalProductPrice() => _digitalProductPrice != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "digital_product_status" field.
  bool? _digitalProductStatus;
  bool get digitalProductStatus => _digitalProductStatus ?? false;
  set digitalProductStatus(bool? val) => _digitalProductStatus = val;

  bool hasDigitalProductStatus() => _digitalProductStatus != null;

  // "digital_product_publish" field.
  bool? _digitalProductPublish;
  bool get digitalProductPublish => _digitalProductPublish ?? false;
  set digitalProductPublish(bool? val) => _digitalProductPublish = val;

  bool hasDigitalProductPublish() => _digitalProductPublish != null;

  // "trainer_active" field.
  bool? _trainerActive;
  bool get trainerActive => _trainerActive ?? false;
  set trainerActive(bool? val) => _trainerActive = val;

  bool hasTrainerActive() => _trainerActive != null;

  static DigiprodDataStruct fromMap(Map<String, dynamic> data) =>
      DigiprodDataStruct(
        userName: data['user_name'] as String?,
        userSurname: data['user_surname'] as String?,
        userPhoto: data['user_photo'] as String?,
        digitalProductName: data['digital_product_name'] as String?,
        digitalProductDescription:
            data['digital_product_description'] as String?,
        digitalProductPhoto1: data['digital_product_photo1'] as String?,
        digitalProductPrice: castToType<int>(data['digital_product_price']),
        id: castToType<int>(data['id']),
        digitalProductStatus: data['digital_product_status'] as bool?,
        digitalProductPublish: data['digital_product_publish'] as bool?,
        trainerActive: data['trainer_active'] as bool?,
      );

  static DigiprodDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DigiprodDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_name': _userName,
        'user_surname': _userSurname,
        'user_photo': _userPhoto,
        'digital_product_name': _digitalProductName,
        'digital_product_description': _digitalProductDescription,
        'digital_product_photo1': _digitalProductPhoto1,
        'digital_product_price': _digitalProductPrice,
        'id': _id,
        'digital_product_status': _digitalProductStatus,
        'digital_product_publish': _digitalProductPublish,
        'trainer_active': _trainerActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user_surname': serializeParam(
          _userSurname,
          ParamType.String,
        ),
        'user_photo': serializeParam(
          _userPhoto,
          ParamType.String,
        ),
        'digital_product_name': serializeParam(
          _digitalProductName,
          ParamType.String,
        ),
        'digital_product_description': serializeParam(
          _digitalProductDescription,
          ParamType.String,
        ),
        'digital_product_photo1': serializeParam(
          _digitalProductPhoto1,
          ParamType.String,
        ),
        'digital_product_price': serializeParam(
          _digitalProductPrice,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'digital_product_status': serializeParam(
          _digitalProductStatus,
          ParamType.bool,
        ),
        'digital_product_publish': serializeParam(
          _digitalProductPublish,
          ParamType.bool,
        ),
        'trainer_active': serializeParam(
          _trainerActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DigiprodDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DigiprodDataStruct(
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userSurname: deserializeParam(
          data['user_surname'],
          ParamType.String,
          false,
        ),
        userPhoto: deserializeParam(
          data['user_photo'],
          ParamType.String,
          false,
        ),
        digitalProductName: deserializeParam(
          data['digital_product_name'],
          ParamType.String,
          false,
        ),
        digitalProductDescription: deserializeParam(
          data['digital_product_description'],
          ParamType.String,
          false,
        ),
        digitalProductPhoto1: deserializeParam(
          data['digital_product_photo1'],
          ParamType.String,
          false,
        ),
        digitalProductPrice: deserializeParam(
          data['digital_product_price'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        digitalProductStatus: deserializeParam(
          data['digital_product_status'],
          ParamType.bool,
          false,
        ),
        digitalProductPublish: deserializeParam(
          data['digital_product_publish'],
          ParamType.bool,
          false,
        ),
        trainerActive: deserializeParam(
          data['trainer_active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DigiprodDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DigiprodDataStruct &&
        userName == other.userName &&
        userSurname == other.userSurname &&
        userPhoto == other.userPhoto &&
        digitalProductName == other.digitalProductName &&
        digitalProductDescription == other.digitalProductDescription &&
        digitalProductPhoto1 == other.digitalProductPhoto1 &&
        digitalProductPrice == other.digitalProductPrice &&
        id == other.id &&
        digitalProductStatus == other.digitalProductStatus &&
        digitalProductPublish == other.digitalProductPublish &&
        trainerActive == other.trainerActive;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userName,
        userSurname,
        userPhoto,
        digitalProductName,
        digitalProductDescription,
        digitalProductPhoto1,
        digitalProductPrice,
        id,
        digitalProductStatus,
        digitalProductPublish,
        trainerActive
      ]);
}

DigiprodDataStruct createDigiprodDataStruct({
  String? userName,
  String? userSurname,
  String? userPhoto,
  String? digitalProductName,
  String? digitalProductDescription,
  String? digitalProductPhoto1,
  int? digitalProductPrice,
  int? id,
  bool? digitalProductStatus,
  bool? digitalProductPublish,
  bool? trainerActive,
}) =>
    DigiprodDataStruct(
      userName: userName,
      userSurname: userSurname,
      userPhoto: userPhoto,
      digitalProductName: digitalProductName,
      digitalProductDescription: digitalProductDescription,
      digitalProductPhoto1: digitalProductPhoto1,
      digitalProductPrice: digitalProductPrice,
      id: id,
      digitalProductStatus: digitalProductStatus,
      digitalProductPublish: digitalProductPublish,
      trainerActive: trainerActive,
    );
