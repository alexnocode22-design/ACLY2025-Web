// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrainingPlansDataStruct extends BaseStruct {
  TrainingPlansDataStruct({
    String? userName,
    String? userSurname,
    String? userPhoto,
    String? trainingPlanName,
    String? trainingPlanDescription,
    String? trainingPlanPhoto1,
    int? trainingPlanPrice,
    int? id,
    bool? trainingPlanStatus,
    bool? trainingPlanPublish,
    bool? trainerActive,
  })  : _userName = userName,
        _userSurname = userSurname,
        _userPhoto = userPhoto,
        _trainingPlanName = trainingPlanName,
        _trainingPlanDescription = trainingPlanDescription,
        _trainingPlanPhoto1 = trainingPlanPhoto1,
        _trainingPlanPrice = trainingPlanPrice,
        _id = id,
        _trainingPlanStatus = trainingPlanStatus,
        _trainingPlanPublish = trainingPlanPublish,
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

  // "training_plan_name" field.
  String? _trainingPlanName;
  String get trainingPlanName => _trainingPlanName ?? '';
  set trainingPlanName(String? val) => _trainingPlanName = val;

  bool hasTrainingPlanName() => _trainingPlanName != null;

  // "training_plan_description" field.
  String? _trainingPlanDescription;
  String get trainingPlanDescription => _trainingPlanDescription ?? '';
  set trainingPlanDescription(String? val) => _trainingPlanDescription = val;

  bool hasTrainingPlanDescription() => _trainingPlanDescription != null;

  // "training_plan_photo1" field.
  String? _trainingPlanPhoto1;
  String get trainingPlanPhoto1 => _trainingPlanPhoto1 ?? '';
  set trainingPlanPhoto1(String? val) => _trainingPlanPhoto1 = val;

  bool hasTrainingPlanPhoto1() => _trainingPlanPhoto1 != null;

  // "training_plan_price" field.
  int? _trainingPlanPrice;
  int get trainingPlanPrice => _trainingPlanPrice ?? 0;
  set trainingPlanPrice(int? val) => _trainingPlanPrice = val;

  void incrementTrainingPlanPrice(int amount) =>
      trainingPlanPrice = trainingPlanPrice + amount;

  bool hasTrainingPlanPrice() => _trainingPlanPrice != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "training_plan_status" field.
  bool? _trainingPlanStatus;
  bool get trainingPlanStatus => _trainingPlanStatus ?? false;
  set trainingPlanStatus(bool? val) => _trainingPlanStatus = val;

  bool hasTrainingPlanStatus() => _trainingPlanStatus != null;

  // "training_plan_publish" field.
  bool? _trainingPlanPublish;
  bool get trainingPlanPublish => _trainingPlanPublish ?? false;
  set trainingPlanPublish(bool? val) => _trainingPlanPublish = val;

  bool hasTrainingPlanPublish() => _trainingPlanPublish != null;

  // "trainer_active" field.
  bool? _trainerActive;
  bool get trainerActive => _trainerActive ?? false;
  set trainerActive(bool? val) => _trainerActive = val;

  bool hasTrainerActive() => _trainerActive != null;

  static TrainingPlansDataStruct fromMap(Map<String, dynamic> data) =>
      TrainingPlansDataStruct(
        userName: data['user_name'] as String?,
        userSurname: data['user_surname'] as String?,
        userPhoto: data['user_photo'] as String?,
        trainingPlanName: data['training_plan_name'] as String?,
        trainingPlanDescription: data['training_plan_description'] as String?,
        trainingPlanPhoto1: data['training_plan_photo1'] as String?,
        trainingPlanPrice: castToType<int>(data['training_plan_price']),
        id: castToType<int>(data['id']),
        trainingPlanStatus: data['training_plan_status'] as bool?,
        trainingPlanPublish: data['training_plan_publish'] as bool?,
        trainerActive: data['trainer_active'] as bool?,
      );

  static TrainingPlansDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TrainingPlansDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_name': _userName,
        'user_surname': _userSurname,
        'user_photo': _userPhoto,
        'training_plan_name': _trainingPlanName,
        'training_plan_description': _trainingPlanDescription,
        'training_plan_photo1': _trainingPlanPhoto1,
        'training_plan_price': _trainingPlanPrice,
        'id': _id,
        'training_plan_status': _trainingPlanStatus,
        'training_plan_publish': _trainingPlanPublish,
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
        'training_plan_name': serializeParam(
          _trainingPlanName,
          ParamType.String,
        ),
        'training_plan_description': serializeParam(
          _trainingPlanDescription,
          ParamType.String,
        ),
        'training_plan_photo1': serializeParam(
          _trainingPlanPhoto1,
          ParamType.String,
        ),
        'training_plan_price': serializeParam(
          _trainingPlanPrice,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'training_plan_status': serializeParam(
          _trainingPlanStatus,
          ParamType.bool,
        ),
        'training_plan_publish': serializeParam(
          _trainingPlanPublish,
          ParamType.bool,
        ),
        'trainer_active': serializeParam(
          _trainerActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TrainingPlansDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TrainingPlansDataStruct(
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
        trainingPlanName: deserializeParam(
          data['training_plan_name'],
          ParamType.String,
          false,
        ),
        trainingPlanDescription: deserializeParam(
          data['training_plan_description'],
          ParamType.String,
          false,
        ),
        trainingPlanPhoto1: deserializeParam(
          data['training_plan_photo1'],
          ParamType.String,
          false,
        ),
        trainingPlanPrice: deserializeParam(
          data['training_plan_price'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        trainingPlanStatus: deserializeParam(
          data['training_plan_status'],
          ParamType.bool,
          false,
        ),
        trainingPlanPublish: deserializeParam(
          data['training_plan_publish'],
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
  String toString() => 'TrainingPlansDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrainingPlansDataStruct &&
        userName == other.userName &&
        userSurname == other.userSurname &&
        userPhoto == other.userPhoto &&
        trainingPlanName == other.trainingPlanName &&
        trainingPlanDescription == other.trainingPlanDescription &&
        trainingPlanPhoto1 == other.trainingPlanPhoto1 &&
        trainingPlanPrice == other.trainingPlanPrice &&
        id == other.id &&
        trainingPlanStatus == other.trainingPlanStatus &&
        trainingPlanPublish == other.trainingPlanPublish &&
        trainerActive == other.trainerActive;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userName,
        userSurname,
        userPhoto,
        trainingPlanName,
        trainingPlanDescription,
        trainingPlanPhoto1,
        trainingPlanPrice,
        id,
        trainingPlanStatus,
        trainingPlanPublish,
        trainerActive
      ]);
}

TrainingPlansDataStruct createTrainingPlansDataStruct({
  String? userName,
  String? userSurname,
  String? userPhoto,
  String? trainingPlanName,
  String? trainingPlanDescription,
  String? trainingPlanPhoto1,
  int? trainingPlanPrice,
  int? id,
  bool? trainingPlanStatus,
  bool? trainingPlanPublish,
  bool? trainerActive,
}) =>
    TrainingPlansDataStruct(
      userName: userName,
      userSurname: userSurname,
      userPhoto: userPhoto,
      trainingPlanName: trainingPlanName,
      trainingPlanDescription: trainingPlanDescription,
      trainingPlanPhoto1: trainingPlanPhoto1,
      trainingPlanPrice: trainingPlanPrice,
      id: id,
      trainingPlanStatus: trainingPlanStatus,
      trainingPlanPublish: trainingPlanPublish,
      trainerActive: trainerActive,
    );
