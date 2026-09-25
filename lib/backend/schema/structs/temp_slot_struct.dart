// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TempSlotStruct extends BaseStruct {
  TempSlotStruct({
    DateTime? slotStartDatetime,
    String? userId,
    String? trainerId,
    int? trainingId,
    int? slotDuration,
    int? trainingQuantity,
    int? trainingPrice,
    String? trainingName,
    String? slotDate,
  })  : _slotStartDatetime = slotStartDatetime,
        _userId = userId,
        _trainerId = trainerId,
        _trainingId = trainingId,
        _slotDuration = slotDuration,
        _trainingQuantity = trainingQuantity,
        _trainingPrice = trainingPrice,
        _trainingName = trainingName,
        _slotDate = slotDate;

  // "slot_start_datetime" field.
  DateTime? _slotStartDatetime;
  DateTime? get slotStartDatetime => _slotStartDatetime;
  set slotStartDatetime(DateTime? val) => _slotStartDatetime = val;

  bool hasSlotStartDatetime() => _slotStartDatetime != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "trainer_id" field.
  String? _trainerId;
  String get trainerId => _trainerId ?? '';
  set trainerId(String? val) => _trainerId = val;

  bool hasTrainerId() => _trainerId != null;

  // "training_id" field.
  int? _trainingId;
  int get trainingId => _trainingId ?? 0;
  set trainingId(int? val) => _trainingId = val;

  void incrementTrainingId(int amount) => trainingId = trainingId + amount;

  bool hasTrainingId() => _trainingId != null;

  // "slot_duration" field.
  int? _slotDuration;
  int get slotDuration => _slotDuration ?? 0;
  set slotDuration(int? val) => _slotDuration = val;

  void incrementSlotDuration(int amount) =>
      slotDuration = slotDuration + amount;

  bool hasSlotDuration() => _slotDuration != null;

  // "training_quantity" field.
  int? _trainingQuantity;
  int get trainingQuantity => _trainingQuantity ?? 0;
  set trainingQuantity(int? val) => _trainingQuantity = val;

  void incrementTrainingQuantity(int amount) =>
      trainingQuantity = trainingQuantity + amount;

  bool hasTrainingQuantity() => _trainingQuantity != null;

  // "training_price" field.
  int? _trainingPrice;
  int get trainingPrice => _trainingPrice ?? 0;
  set trainingPrice(int? val) => _trainingPrice = val;

  void incrementTrainingPrice(int amount) =>
      trainingPrice = trainingPrice + amount;

  bool hasTrainingPrice() => _trainingPrice != null;

  // "training_name" field.
  String? _trainingName;
  String get trainingName => _trainingName ?? '';
  set trainingName(String? val) => _trainingName = val;

  bool hasTrainingName() => _trainingName != null;

  // "slot_date" field.
  String? _slotDate;
  String get slotDate => _slotDate ?? '';
  set slotDate(String? val) => _slotDate = val;

  bool hasSlotDate() => _slotDate != null;

  static TempSlotStruct fromMap(Map<String, dynamic> data) => TempSlotStruct(
        slotStartDatetime: data['slot_start_datetime'] as DateTime?,
        userId: data['user_id'] as String?,
        trainerId: data['trainer_id'] as String?,
        trainingId: castToType<int>(data['training_id']),
        slotDuration: castToType<int>(data['slot_duration']),
        trainingQuantity: castToType<int>(data['training_quantity']),
        trainingPrice: castToType<int>(data['training_price']),
        trainingName: data['training_name'] as String?,
        slotDate: data['slot_date'] as String?,
      );

  static TempSlotStruct? maybeFromMap(dynamic data) =>
      data is Map ? TempSlotStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'slot_start_datetime': _slotStartDatetime,
        'user_id': _userId,
        'trainer_id': _trainerId,
        'training_id': _trainingId,
        'slot_duration': _slotDuration,
        'training_quantity': _trainingQuantity,
        'training_price': _trainingPrice,
        'training_name': _trainingName,
        'slot_date': _slotDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slot_start_datetime': serializeParam(
          _slotStartDatetime,
          ParamType.DateTime,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'trainer_id': serializeParam(
          _trainerId,
          ParamType.String,
        ),
        'training_id': serializeParam(
          _trainingId,
          ParamType.int,
        ),
        'slot_duration': serializeParam(
          _slotDuration,
          ParamType.int,
        ),
        'training_quantity': serializeParam(
          _trainingQuantity,
          ParamType.int,
        ),
        'training_price': serializeParam(
          _trainingPrice,
          ParamType.int,
        ),
        'training_name': serializeParam(
          _trainingName,
          ParamType.String,
        ),
        'slot_date': serializeParam(
          _slotDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static TempSlotStruct fromSerializableMap(Map<String, dynamic> data) =>
      TempSlotStruct(
        slotStartDatetime: deserializeParam(
          data['slot_start_datetime'],
          ParamType.DateTime,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        trainerId: deserializeParam(
          data['trainer_id'],
          ParamType.String,
          false,
        ),
        trainingId: deserializeParam(
          data['training_id'],
          ParamType.int,
          false,
        ),
        slotDuration: deserializeParam(
          data['slot_duration'],
          ParamType.int,
          false,
        ),
        trainingQuantity: deserializeParam(
          data['training_quantity'],
          ParamType.int,
          false,
        ),
        trainingPrice: deserializeParam(
          data['training_price'],
          ParamType.int,
          false,
        ),
        trainingName: deserializeParam(
          data['training_name'],
          ParamType.String,
          false,
        ),
        slotDate: deserializeParam(
          data['slot_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TempSlotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TempSlotStruct &&
        slotStartDatetime == other.slotStartDatetime &&
        userId == other.userId &&
        trainerId == other.trainerId &&
        trainingId == other.trainingId &&
        slotDuration == other.slotDuration &&
        trainingQuantity == other.trainingQuantity &&
        trainingPrice == other.trainingPrice &&
        trainingName == other.trainingName &&
        slotDate == other.slotDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        slotStartDatetime,
        userId,
        trainerId,
        trainingId,
        slotDuration,
        trainingQuantity,
        trainingPrice,
        trainingName,
        slotDate
      ]);
}

TempSlotStruct createTempSlotStruct({
  DateTime? slotStartDatetime,
  String? userId,
  String? trainerId,
  int? trainingId,
  int? slotDuration,
  int? trainingQuantity,
  int? trainingPrice,
  String? trainingName,
  String? slotDate,
}) =>
    TempSlotStruct(
      slotStartDatetime: slotStartDatetime,
      userId: userId,
      trainerId: trainerId,
      trainingId: trainingId,
      slotDuration: slotDuration,
      trainingQuantity: trainingQuantity,
      trainingPrice: trainingPrice,
      trainingName: trainingName,
      slotDate: slotDate,
    );
