// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SlotboughtStruct extends BaseStruct {
  SlotboughtStruct({
    int? slotId,
    DateTime? slotStartDatetime,
    String? userId,
    String? trainerId,
    int? trainingId,
    int? slotDuration,
    int? trainingQuantity,
    int? trainingPrice,
    int? trainingBoughtID,
    String? trainingName,
  })  : _slotId = slotId,
        _slotStartDatetime = slotStartDatetime,
        _userId = userId,
        _trainerId = trainerId,
        _trainingId = trainingId,
        _slotDuration = slotDuration,
        _trainingQuantity = trainingQuantity,
        _trainingPrice = trainingPrice,
        _trainingBoughtID = trainingBoughtID,
        _trainingName = trainingName;

  // "slot_id" field.
  int? _slotId;
  int get slotId => _slotId ?? 0;
  set slotId(int? val) => _slotId = val;

  void incrementSlotId(int amount) => slotId = slotId + amount;

  bool hasSlotId() => _slotId != null;

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

  // "trainingBoughtID" field.
  int? _trainingBoughtID;
  int get trainingBoughtID => _trainingBoughtID ?? 0;
  set trainingBoughtID(int? val) => _trainingBoughtID = val;

  void incrementTrainingBoughtID(int amount) =>
      trainingBoughtID = trainingBoughtID + amount;

  bool hasTrainingBoughtID() => _trainingBoughtID != null;

  // "training_name" field.
  String? _trainingName;
  String get trainingName => _trainingName ?? '';
  set trainingName(String? val) => _trainingName = val;

  bool hasTrainingName() => _trainingName != null;

  static SlotboughtStruct fromMap(Map<String, dynamic> data) =>
      SlotboughtStruct(
        slotId: castToType<int>(data['slot_id']),
        slotStartDatetime: data['slot_start_datetime'] as DateTime?,
        userId: data['user_id'] as String?,
        trainerId: data['trainer_id'] as String?,
        trainingId: castToType<int>(data['training_id']),
        slotDuration: castToType<int>(data['slot_duration']),
        trainingQuantity: castToType<int>(data['training_quantity']),
        trainingPrice: castToType<int>(data['training_price']),
        trainingBoughtID: castToType<int>(data['trainingBoughtID']),
        trainingName: data['training_name'] as String?,
      );

  static SlotboughtStruct? maybeFromMap(dynamic data) => data is Map
      ? SlotboughtStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'slot_id': _slotId,
        'slot_start_datetime': _slotStartDatetime,
        'user_id': _userId,
        'trainer_id': _trainerId,
        'training_id': _trainingId,
        'slot_duration': _slotDuration,
        'training_quantity': _trainingQuantity,
        'training_price': _trainingPrice,
        'trainingBoughtID': _trainingBoughtID,
        'training_name': _trainingName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slot_id': serializeParam(
          _slotId,
          ParamType.int,
        ),
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
        'trainingBoughtID': serializeParam(
          _trainingBoughtID,
          ParamType.int,
        ),
        'training_name': serializeParam(
          _trainingName,
          ParamType.String,
        ),
      }.withoutNulls;

  static SlotboughtStruct fromSerializableMap(Map<String, dynamic> data) =>
      SlotboughtStruct(
        slotId: deserializeParam(
          data['slot_id'],
          ParamType.int,
          false,
        ),
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
        trainingBoughtID: deserializeParam(
          data['trainingBoughtID'],
          ParamType.int,
          false,
        ),
        trainingName: deserializeParam(
          data['training_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SlotboughtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SlotboughtStruct &&
        slotId == other.slotId &&
        slotStartDatetime == other.slotStartDatetime &&
        userId == other.userId &&
        trainerId == other.trainerId &&
        trainingId == other.trainingId &&
        slotDuration == other.slotDuration &&
        trainingQuantity == other.trainingQuantity &&
        trainingPrice == other.trainingPrice &&
        trainingBoughtID == other.trainingBoughtID &&
        trainingName == other.trainingName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        slotId,
        slotStartDatetime,
        userId,
        trainerId,
        trainingId,
        slotDuration,
        trainingQuantity,
        trainingPrice,
        trainingBoughtID,
        trainingName
      ]);
}

SlotboughtStruct createSlotboughtStruct({
  int? slotId,
  DateTime? slotStartDatetime,
  String? userId,
  String? trainerId,
  int? trainingId,
  int? slotDuration,
  int? trainingQuantity,
  int? trainingPrice,
  int? trainingBoughtID,
  String? trainingName,
}) =>
    SlotboughtStruct(
      slotId: slotId,
      slotStartDatetime: slotStartDatetime,
      userId: userId,
      trainerId: trainerId,
      trainingId: trainingId,
      slotDuration: slotDuration,
      trainingQuantity: trainingQuantity,
      trainingPrice: trainingPrice,
      trainingBoughtID: trainingBoughtID,
      trainingName: trainingName,
    );
