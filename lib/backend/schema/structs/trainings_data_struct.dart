// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrainingsDataStruct extends BaseStruct {
  TrainingsDataStruct({
    String? trainingName,
    String? trainingDescription,
    String? userName,
    String? userSurname,
    String? userPhoto,
    String? trainingPhoto1,
    int? id,
    int? trainingPrice,
    String? trainerId,
    bool? trainingStatus,
    bool? trainingPublish,
    bool? trainerActive,
  })  : _trainingName = trainingName,
        _trainingDescription = trainingDescription,
        _userName = userName,
        _userSurname = userSurname,
        _userPhoto = userPhoto,
        _trainingPhoto1 = trainingPhoto1,
        _id = id,
        _trainingPrice = trainingPrice,
        _trainerId = trainerId,
        _trainingStatus = trainingStatus,
        _trainingPublish = trainingPublish,
        _trainerActive = trainerActive;

  // "training_name" field.
  String? _trainingName;
  String get trainingName => _trainingName ?? '';
  set trainingName(String? val) => _trainingName = val;

  bool hasTrainingName() => _trainingName != null;

  // "training_description" field.
  String? _trainingDescription;
  String get trainingDescription => _trainingDescription ?? '';
  set trainingDescription(String? val) => _trainingDescription = val;

  bool hasTrainingDescription() => _trainingDescription != null;

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

  // "training_photo1" field.
  String? _trainingPhoto1;
  String get trainingPhoto1 => _trainingPhoto1 ?? '';
  set trainingPhoto1(String? val) => _trainingPhoto1 = val;

  bool hasTrainingPhoto1() => _trainingPhoto1 != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "training_price" field.
  int? _trainingPrice;
  int get trainingPrice => _trainingPrice ?? 0;
  set trainingPrice(int? val) => _trainingPrice = val;

  void incrementTrainingPrice(int amount) =>
      trainingPrice = trainingPrice + amount;

  bool hasTrainingPrice() => _trainingPrice != null;

  // "trainer_id" field.
  String? _trainerId;
  String get trainerId => _trainerId ?? '';
  set trainerId(String? val) => _trainerId = val;

  bool hasTrainerId() => _trainerId != null;

  // "training_status" field.
  bool? _trainingStatus;
  bool get trainingStatus => _trainingStatus ?? false;
  set trainingStatus(bool? val) => _trainingStatus = val;

  bool hasTrainingStatus() => _trainingStatus != null;

  // "training_publish" field.
  bool? _trainingPublish;
  bool get trainingPublish => _trainingPublish ?? false;
  set trainingPublish(bool? val) => _trainingPublish = val;

  bool hasTrainingPublish() => _trainingPublish != null;

  // "trainer_active" field.
  bool? _trainerActive;
  bool get trainerActive => _trainerActive ?? false;
  set trainerActive(bool? val) => _trainerActive = val;

  bool hasTrainerActive() => _trainerActive != null;

  static TrainingsDataStruct fromMap(Map<String, dynamic> data) =>
      TrainingsDataStruct(
        trainingName: data['training_name'] as String?,
        trainingDescription: data['training_description'] as String?,
        userName: data['user_name'] as String?,
        userSurname: data['user_surname'] as String?,
        userPhoto: data['user_photo'] as String?,
        trainingPhoto1: data['training_photo1'] as String?,
        id: castToType<int>(data['id']),
        trainingPrice: castToType<int>(data['training_price']),
        trainerId: data['trainer_id'] as String?,
        trainingStatus: data['training_status'] as bool?,
        trainingPublish: data['training_publish'] as bool?,
        trainerActive: data['trainer_active'] as bool?,
      );

  static TrainingsDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TrainingsDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'training_name': _trainingName,
        'training_description': _trainingDescription,
        'user_name': _userName,
        'user_surname': _userSurname,
        'user_photo': _userPhoto,
        'training_photo1': _trainingPhoto1,
        'id': _id,
        'training_price': _trainingPrice,
        'trainer_id': _trainerId,
        'training_status': _trainingStatus,
        'training_publish': _trainingPublish,
        'trainer_active': _trainerActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'training_name': serializeParam(
          _trainingName,
          ParamType.String,
        ),
        'training_description': serializeParam(
          _trainingDescription,
          ParamType.String,
        ),
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
        'training_photo1': serializeParam(
          _trainingPhoto1,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'training_price': serializeParam(
          _trainingPrice,
          ParamType.int,
        ),
        'trainer_id': serializeParam(
          _trainerId,
          ParamType.String,
        ),
        'training_status': serializeParam(
          _trainingStatus,
          ParamType.bool,
        ),
        'training_publish': serializeParam(
          _trainingPublish,
          ParamType.bool,
        ),
        'trainer_active': serializeParam(
          _trainerActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TrainingsDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TrainingsDataStruct(
        trainingName: deserializeParam(
          data['training_name'],
          ParamType.String,
          false,
        ),
        trainingDescription: deserializeParam(
          data['training_description'],
          ParamType.String,
          false,
        ),
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
        trainingPhoto1: deserializeParam(
          data['training_photo1'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        trainingPrice: deserializeParam(
          data['training_price'],
          ParamType.int,
          false,
        ),
        trainerId: deserializeParam(
          data['trainer_id'],
          ParamType.String,
          false,
        ),
        trainingStatus: deserializeParam(
          data['training_status'],
          ParamType.bool,
          false,
        ),
        trainingPublish: deserializeParam(
          data['training_publish'],
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
  String toString() => 'TrainingsDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrainingsDataStruct &&
        trainingName == other.trainingName &&
        trainingDescription == other.trainingDescription &&
        userName == other.userName &&
        userSurname == other.userSurname &&
        userPhoto == other.userPhoto &&
        trainingPhoto1 == other.trainingPhoto1 &&
        id == other.id &&
        trainingPrice == other.trainingPrice &&
        trainerId == other.trainerId &&
        trainingStatus == other.trainingStatus &&
        trainingPublish == other.trainingPublish &&
        trainerActive == other.trainerActive;
  }

  @override
  int get hashCode => const ListEquality().hash([
        trainingName,
        trainingDescription,
        userName,
        userSurname,
        userPhoto,
        trainingPhoto1,
        id,
        trainingPrice,
        trainerId,
        trainingStatus,
        trainingPublish,
        trainerActive
      ]);
}

TrainingsDataStruct createTrainingsDataStruct({
  String? trainingName,
  String? trainingDescription,
  String? userName,
  String? userSurname,
  String? userPhoto,
  String? trainingPhoto1,
  int? id,
  int? trainingPrice,
  String? trainerId,
  bool? trainingStatus,
  bool? trainingPublish,
  bool? trainerActive,
}) =>
    TrainingsDataStruct(
      trainingName: trainingName,
      trainingDescription: trainingDescription,
      userName: userName,
      userSurname: userSurname,
      userPhoto: userPhoto,
      trainingPhoto1: trainingPhoto1,
      id: id,
      trainingPrice: trainingPrice,
      trainerId: trainerId,
      trainingStatus: trainingStatus,
      trainingPublish: trainingPublish,
      trainerActive: trainerActive,
    );
