// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrainerNameSurnameDescrStruct extends BaseStruct {
  TrainerNameSurnameDescrStruct({
    String? userSurname,
    String? trainerDescription,
    String? userName,
    String? trainerSpecs,
    double? trainerRating,
    String? trainerId,
    String? userPhoto,
    bool? trainerActive,
  })  : _userSurname = userSurname,
        _trainerDescription = trainerDescription,
        _userName = userName,
        _trainerSpecs = trainerSpecs,
        _trainerRating = trainerRating,
        _trainerId = trainerId,
        _userPhoto = userPhoto,
        _trainerActive = trainerActive;

  // "user_surname" field.
  String? _userSurname;
  String get userSurname => _userSurname ?? '';
  set userSurname(String? val) => _userSurname = val;

  bool hasUserSurname() => _userSurname != null;

  // "trainer_description" field.
  String? _trainerDescription;
  String get trainerDescription => _trainerDescription ?? '';
  set trainerDescription(String? val) => _trainerDescription = val;

  bool hasTrainerDescription() => _trainerDescription != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "trainer_specs" field.
  String? _trainerSpecs;
  String get trainerSpecs => _trainerSpecs ?? '';
  set trainerSpecs(String? val) => _trainerSpecs = val;

  bool hasTrainerSpecs() => _trainerSpecs != null;

  // "trainer_rating" field.
  double? _trainerRating;
  double get trainerRating => _trainerRating ?? 0.0;
  set trainerRating(double? val) => _trainerRating = val;

  void incrementTrainerRating(double amount) =>
      trainerRating = trainerRating + amount;

  bool hasTrainerRating() => _trainerRating != null;

  // "trainer_id" field.
  String? _trainerId;
  String get trainerId => _trainerId ?? '';
  set trainerId(String? val) => _trainerId = val;

  bool hasTrainerId() => _trainerId != null;

  // "user_photo" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  set userPhoto(String? val) => _userPhoto = val;

  bool hasUserPhoto() => _userPhoto != null;

  // "trainer_active" field.
  bool? _trainerActive;
  bool get trainerActive => _trainerActive ?? false;
  set trainerActive(bool? val) => _trainerActive = val;

  bool hasTrainerActive() => _trainerActive != null;

  static TrainerNameSurnameDescrStruct fromMap(Map<String, dynamic> data) =>
      TrainerNameSurnameDescrStruct(
        userSurname: data['user_surname'] as String?,
        trainerDescription: data['trainer_description'] as String?,
        userName: data['user_name'] as String?,
        trainerSpecs: data['trainer_specs'] as String?,
        trainerRating: castToType<double>(data['trainer_rating']),
        trainerId: data['trainer_id'] as String?,
        userPhoto: data['user_photo'] as String?,
        trainerActive: data['trainer_active'] as bool?,
      );

  static TrainerNameSurnameDescrStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? TrainerNameSurnameDescrStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'user_surname': _userSurname,
        'trainer_description': _trainerDescription,
        'user_name': _userName,
        'trainer_specs': _trainerSpecs,
        'trainer_rating': _trainerRating,
        'trainer_id': _trainerId,
        'user_photo': _userPhoto,
        'trainer_active': _trainerActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_surname': serializeParam(
          _userSurname,
          ParamType.String,
        ),
        'trainer_description': serializeParam(
          _trainerDescription,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'trainer_specs': serializeParam(
          _trainerSpecs,
          ParamType.String,
        ),
        'trainer_rating': serializeParam(
          _trainerRating,
          ParamType.double,
        ),
        'trainer_id': serializeParam(
          _trainerId,
          ParamType.String,
        ),
        'user_photo': serializeParam(
          _userPhoto,
          ParamType.String,
        ),
        'trainer_active': serializeParam(
          _trainerActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TrainerNameSurnameDescrStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TrainerNameSurnameDescrStruct(
        userSurname: deserializeParam(
          data['user_surname'],
          ParamType.String,
          false,
        ),
        trainerDescription: deserializeParam(
          data['trainer_description'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        trainerSpecs: deserializeParam(
          data['trainer_specs'],
          ParamType.String,
          false,
        ),
        trainerRating: deserializeParam(
          data['trainer_rating'],
          ParamType.double,
          false,
        ),
        trainerId: deserializeParam(
          data['trainer_id'],
          ParamType.String,
          false,
        ),
        userPhoto: deserializeParam(
          data['user_photo'],
          ParamType.String,
          false,
        ),
        trainerActive: deserializeParam(
          data['trainer_active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TrainerNameSurnameDescrStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TrainerNameSurnameDescrStruct &&
        userSurname == other.userSurname &&
        trainerDescription == other.trainerDescription &&
        userName == other.userName &&
        trainerSpecs == other.trainerSpecs &&
        trainerRating == other.trainerRating &&
        trainerId == other.trainerId &&
        userPhoto == other.userPhoto &&
        trainerActive == other.trainerActive;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userSurname,
        trainerDescription,
        userName,
        trainerSpecs,
        trainerRating,
        trainerId,
        userPhoto,
        trainerActive
      ]);
}

TrainerNameSurnameDescrStruct createTrainerNameSurnameDescrStruct({
  String? userSurname,
  String? trainerDescription,
  String? userName,
  String? trainerSpecs,
  double? trainerRating,
  String? trainerId,
  String? userPhoto,
  bool? trainerActive,
}) =>
    TrainerNameSurnameDescrStruct(
      userSurname: userSurname,
      trainerDescription: trainerDescription,
      userName: userName,
      trainerSpecs: trainerSpecs,
      trainerRating: trainerRating,
      trainerId: trainerId,
      userPhoto: userPhoto,
      trainerActive: trainerActive,
    );
