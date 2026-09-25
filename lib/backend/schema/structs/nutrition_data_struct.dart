// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionDataStruct extends BaseStruct {
  NutritionDataStruct({
    String? userName,
    String? userSurname,
    String? userPhoto,
    String? nutritionPlanName,
    String? nutritionPlanDescription,
    String? nutritionPlanPhoto1,
    int? nutritionPlanPrice,
    int? id,
    bool? nutritionPlanStatus,
    bool? nutritionPlanPublish,
    bool? trainerActive,
  })  : _userName = userName,
        _userSurname = userSurname,
        _userPhoto = userPhoto,
        _nutritionPlanName = nutritionPlanName,
        _nutritionPlanDescription = nutritionPlanDescription,
        _nutritionPlanPhoto1 = nutritionPlanPhoto1,
        _nutritionPlanPrice = nutritionPlanPrice,
        _id = id,
        _nutritionPlanStatus = nutritionPlanStatus,
        _nutritionPlanPublish = nutritionPlanPublish,
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

  // "nutrition_plan_name" field.
  String? _nutritionPlanName;
  String get nutritionPlanName => _nutritionPlanName ?? '';
  set nutritionPlanName(String? val) => _nutritionPlanName = val;

  bool hasNutritionPlanName() => _nutritionPlanName != null;

  // "nutrition_plan_description" field.
  String? _nutritionPlanDescription;
  String get nutritionPlanDescription => _nutritionPlanDescription ?? '';
  set nutritionPlanDescription(String? val) => _nutritionPlanDescription = val;

  bool hasNutritionPlanDescription() => _nutritionPlanDescription != null;

  // "nutrition_plan_photo1" field.
  String? _nutritionPlanPhoto1;
  String get nutritionPlanPhoto1 => _nutritionPlanPhoto1 ?? '';
  set nutritionPlanPhoto1(String? val) => _nutritionPlanPhoto1 = val;

  bool hasNutritionPlanPhoto1() => _nutritionPlanPhoto1 != null;

  // "nutrition_plan_price" field.
  int? _nutritionPlanPrice;
  int get nutritionPlanPrice => _nutritionPlanPrice ?? 0;
  set nutritionPlanPrice(int? val) => _nutritionPlanPrice = val;

  void incrementNutritionPlanPrice(int amount) =>
      nutritionPlanPrice = nutritionPlanPrice + amount;

  bool hasNutritionPlanPrice() => _nutritionPlanPrice != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nutrition_plan_status" field.
  bool? _nutritionPlanStatus;
  bool get nutritionPlanStatus => _nutritionPlanStatus ?? false;
  set nutritionPlanStatus(bool? val) => _nutritionPlanStatus = val;

  bool hasNutritionPlanStatus() => _nutritionPlanStatus != null;

  // "nutrition_plan_publish" field.
  bool? _nutritionPlanPublish;
  bool get nutritionPlanPublish => _nutritionPlanPublish ?? false;
  set nutritionPlanPublish(bool? val) => _nutritionPlanPublish = val;

  bool hasNutritionPlanPublish() => _nutritionPlanPublish != null;

  // "trainer_active" field.
  bool? _trainerActive;
  bool get trainerActive => _trainerActive ?? false;
  set trainerActive(bool? val) => _trainerActive = val;

  bool hasTrainerActive() => _trainerActive != null;

  static NutritionDataStruct fromMap(Map<String, dynamic> data) =>
      NutritionDataStruct(
        userName: data['user_name'] as String?,
        userSurname: data['user_surname'] as String?,
        userPhoto: data['user_photo'] as String?,
        nutritionPlanName: data['nutrition_plan_name'] as String?,
        nutritionPlanDescription: data['nutrition_plan_description'] as String?,
        nutritionPlanPhoto1: data['nutrition_plan_photo1'] as String?,
        nutritionPlanPrice: castToType<int>(data['nutrition_plan_price']),
        id: castToType<int>(data['id']),
        nutritionPlanStatus: data['nutrition_plan_status'] as bool?,
        nutritionPlanPublish: data['nutrition_plan_publish'] as bool?,
        trainerActive: data['trainer_active'] as bool?,
      );

  static NutritionDataStruct? maybeFromMap(dynamic data) => data is Map
      ? NutritionDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_name': _userName,
        'user_surname': _userSurname,
        'user_photo': _userPhoto,
        'nutrition_plan_name': _nutritionPlanName,
        'nutrition_plan_description': _nutritionPlanDescription,
        'nutrition_plan_photo1': _nutritionPlanPhoto1,
        'nutrition_plan_price': _nutritionPlanPrice,
        'id': _id,
        'nutrition_plan_status': _nutritionPlanStatus,
        'nutrition_plan_publish': _nutritionPlanPublish,
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
        'nutrition_plan_name': serializeParam(
          _nutritionPlanName,
          ParamType.String,
        ),
        'nutrition_plan_description': serializeParam(
          _nutritionPlanDescription,
          ParamType.String,
        ),
        'nutrition_plan_photo1': serializeParam(
          _nutritionPlanPhoto1,
          ParamType.String,
        ),
        'nutrition_plan_price': serializeParam(
          _nutritionPlanPrice,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nutrition_plan_status': serializeParam(
          _nutritionPlanStatus,
          ParamType.bool,
        ),
        'nutrition_plan_publish': serializeParam(
          _nutritionPlanPublish,
          ParamType.bool,
        ),
        'trainer_active': serializeParam(
          _trainerActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NutritionDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      NutritionDataStruct(
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
        nutritionPlanName: deserializeParam(
          data['nutrition_plan_name'],
          ParamType.String,
          false,
        ),
        nutritionPlanDescription: deserializeParam(
          data['nutrition_plan_description'],
          ParamType.String,
          false,
        ),
        nutritionPlanPhoto1: deserializeParam(
          data['nutrition_plan_photo1'],
          ParamType.String,
          false,
        ),
        nutritionPlanPrice: deserializeParam(
          data['nutrition_plan_price'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nutritionPlanStatus: deserializeParam(
          data['nutrition_plan_status'],
          ParamType.bool,
          false,
        ),
        nutritionPlanPublish: deserializeParam(
          data['nutrition_plan_publish'],
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
  String toString() => 'NutritionDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NutritionDataStruct &&
        userName == other.userName &&
        userSurname == other.userSurname &&
        userPhoto == other.userPhoto &&
        nutritionPlanName == other.nutritionPlanName &&
        nutritionPlanDescription == other.nutritionPlanDescription &&
        nutritionPlanPhoto1 == other.nutritionPlanPhoto1 &&
        nutritionPlanPrice == other.nutritionPlanPrice &&
        id == other.id &&
        nutritionPlanStatus == other.nutritionPlanStatus &&
        nutritionPlanPublish == other.nutritionPlanPublish &&
        trainerActive == other.trainerActive;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userName,
        userSurname,
        userPhoto,
        nutritionPlanName,
        nutritionPlanDescription,
        nutritionPlanPhoto1,
        nutritionPlanPrice,
        id,
        nutritionPlanStatus,
        nutritionPlanPublish,
        trainerActive
      ]);
}

NutritionDataStruct createNutritionDataStruct({
  String? userName,
  String? userSurname,
  String? userPhoto,
  String? nutritionPlanName,
  String? nutritionPlanDescription,
  String? nutritionPlanPhoto1,
  int? nutritionPlanPrice,
  int? id,
  bool? nutritionPlanStatus,
  bool? nutritionPlanPublish,
  bool? trainerActive,
}) =>
    NutritionDataStruct(
      userName: userName,
      userSurname: userSurname,
      userPhoto: userPhoto,
      nutritionPlanName: nutritionPlanName,
      nutritionPlanDescription: nutritionPlanDescription,
      nutritionPlanPhoto1: nutritionPlanPhoto1,
      nutritionPlanPrice: nutritionPlanPrice,
      id: id,
      nutritionPlanStatus: nutritionPlanStatus,
      nutritionPlanPublish: nutritionPlanPublish,
      trainerActive: trainerActive,
    );
