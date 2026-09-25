import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userRole = prefs.getStringList('ff_userRole') ?? _userRole;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _userRole = [];
  List<String> get userRole => _userRole;
  set userRole(List<String> value) {
    _userRole = value;
    prefs.setStringList('ff_userRole', value);
  }

  void addToUserRole(String value) {
    userRole.add(value);
    prefs.setStringList('ff_userRole', _userRole);
  }

  void removeFromUserRole(String value) {
    userRole.remove(value);
    prefs.setStringList('ff_userRole', _userRole);
  }

  void removeAtIndexFromUserRole(int index) {
    userRole.removeAt(index);
    prefs.setStringList('ff_userRole', _userRole);
  }

  void updateUserRoleAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userRole[index] = updateFn(_userRole[index]);
    prefs.setStringList('ff_userRole', _userRole);
  }

  void insertAtIndexInUserRole(int index, String value) {
    userRole.insert(index, value);
    prefs.setStringList('ff_userRole', _userRole);
  }

  bool _monthAbonement = false;
  bool get monthAbonement => _monthAbonement;
  set monthAbonement(bool value) {
    _monthAbonement = value;
  }

  List<SlotboughtStruct> _slotBoughtTemp = [];
  List<SlotboughtStruct> get slotBoughtTemp => _slotBoughtTemp;
  set slotBoughtTemp(List<SlotboughtStruct> value) {
    _slotBoughtTemp = value;
  }

  void addToSlotBoughtTemp(SlotboughtStruct value) {
    slotBoughtTemp.add(value);
  }

  void removeFromSlotBoughtTemp(SlotboughtStruct value) {
    slotBoughtTemp.remove(value);
  }

  void removeAtIndexFromSlotBoughtTemp(int index) {
    slotBoughtTemp.removeAt(index);
  }

  void updateSlotBoughtTempAtIndex(
    int index,
    SlotboughtStruct Function(SlotboughtStruct) updateFn,
  ) {
    slotBoughtTemp[index] = updateFn(_slotBoughtTemp[index]);
  }

  void insertAtIndexInSlotBoughtTemp(int index, SlotboughtStruct value) {
    slotBoughtTemp.insert(index, value);
  }

  int _tabIconColor = 0;
  int get tabIconColor => _tabIconColor;
  set tabIconColor(int value) {
    _tabIconColor = value;
  }

  String _chatUserName = '';
  String get chatUserName => _chatUserName;
  set chatUserName(String value) {
    _chatUserName = value;
  }

  int _unreadChatID = 0;
  int get unreadChatID => _unreadChatID;
  set unreadChatID(int value) {
    _unreadChatID = value;
  }

  String _unreadChatuserID = '';
  String get unreadChatuserID => _unreadChatuserID;
  set unreadChatuserID(String value) {
    _unreadChatuserID = value;
  }

  int _unreadChatsQuantity = 0;
  int get unreadChatsQuantity => _unreadChatsQuantity;
  set unreadChatsQuantity(int value) {
    _unreadChatsQuantity = value;
  }

  DateTime? _MonthYearSelected =
      DateTime.fromMillisecondsSinceEpoch(1706565600000);
  DateTime? get MonthYearSelected => _MonthYearSelected;
  set MonthYearSelected(DateTime? value) {
    _MonthYearSelected = value;
  }

  String _apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.ewogICJyb2xlIjogImFub24iLAogICJpc3MiOiAic3VwYWJhc2UiLAogICJpYXQiOiAxNzE5NDM1NjAwLAogICJleHAiOiAxODc3MjAyMDAwCn0.YhTMdRh-QdDta2VmVGoPZs3BxwqyFVmbjdYbF9JSidk';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
  }

  bool _timerOn = false;
  bool get timerOn => _timerOn;
  set timerOn(bool value) {
    _timerOn = value;
  }

  bool _unreadChatMessages = false;
  bool get unreadChatMessages => _unreadChatMessages;
  set unreadChatMessages(bool value) {
    _unreadChatMessages = value;
  }

  /// DateFromCustomCalendar
  DateTime? _selectedCalendarDate;
  DateTime? get selectedCalendarDate => _selectedCalendarDate;
  set selectedCalendarDate(DateTime? value) {
    _selectedCalendarDate = value;
  }

  int _currentMonth = 0;
  int get currentMonth => _currentMonth;
  set currentMonth(int value) {
    _currentMonth = value;
  }

  bool _stopNotificationRequested = false;
  bool get stopNotificationRequested => _stopNotificationRequested;
  set stopNotificationRequested(bool value) {
    _stopNotificationRequested = value;
  }

  String _draftJson = '';
  String get draftJson => _draftJson;
  set draftJson(String value) {
    _draftJson = value;
  }

  int _draftTempId = 0;
  int get draftTempId => _draftTempId;
  set draftTempId(int value) {
    _draftTempId = value;
  }

  String _draftName = '';
  String get draftName => _draftName;
  set draftName(String value) {
    _draftName = value;
  }

  String _draftDescription = '';
  String get draftDescription => _draftDescription;
  set draftDescription(String value) {
    _draftDescription = value;
  }

  String _draftPrice = '';
  String get draftPrice => _draftPrice;
  set draftPrice(String value) {
    _draftPrice = value;
  }

  int _draftSlotDuration = 0;
  int get draftSlotDuration => _draftSlotDuration;
  set draftSlotDuration(int value) {
    _draftSlotDuration = value;
  }

  int _draftPlanTempId = 0;
  int get draftPlanTempId => _draftPlanTempId;
  set draftPlanTempId(int value) {
    _draftPlanTempId = value;
  }

  String _draftPlanName = '';
  String get draftPlanName => _draftPlanName;
  set draftPlanName(String value) {
    _draftPlanName = value;
  }

  String _draftPlanDescription = '';
  String get draftPlanDescription => _draftPlanDescription;
  set draftPlanDescription(String value) {
    _draftPlanDescription = value;
  }

  String _draftPlanPrice = '';
  String get draftPlanPrice => _draftPlanPrice;
  set draftPlanPrice(String value) {
    _draftPlanPrice = value;
  }

  String _draftNutrition = '';
  String get draftNutrition => _draftNutrition;
  set draftNutrition(String value) {
    _draftNutrition = value;
  }

  String _draftDigiProd = '';
  String get draftDigiProd => _draftDigiProd;
  set draftDigiProd(String value) {
    _draftDigiProd = value;
  }

  int _draftNutritionTempId = 0;
  int get draftNutritionTempId => _draftNutritionTempId;
  set draftNutritionTempId(int value) {
    _draftNutritionTempId = value;
  }

  String _draftNutritionName = '';
  String get draftNutritionName => _draftNutritionName;
  set draftNutritionName(String value) {
    _draftNutritionName = value;
  }

  String _draftNutritionDescription = '';
  String get draftNutritionDescription => _draftNutritionDescription;
  set draftNutritionDescription(String value) {
    _draftNutritionDescription = value;
  }

  int _draftDigiProdTempId = 0;
  int get draftDigiProdTempId => _draftDigiProdTempId;
  set draftDigiProdTempId(int value) {
    _draftDigiProdTempId = value;
  }

  String _draftDigiProdName = '';
  String get draftDigiProdName => _draftDigiProdName;
  set draftDigiProdName(String value) {
    _draftDigiProdName = value;
  }

  String _draftDigiProdDescription = '';
  String get draftDigiProdDescription => _draftDigiProdDescription;
  set draftDigiProdDescription(String value) {
    _draftDigiProdDescription = value;
  }

  String _draftNutritionPrice = '';
  String get draftNutritionPrice => _draftNutritionPrice;
  set draftNutritionPrice(String value) {
    _draftNutritionPrice = value;
  }

  String _draftDigiProdPrice = '';
  String get draftDigiProdPrice => _draftDigiProdPrice;
  set draftDigiProdPrice(String value) {
    _draftDigiProdPrice = value;
  }

  bool _isCreatingPlanDraft = false;
  bool get isCreatingPlanDraft => _isCreatingPlanDraft;
  set isCreatingPlanDraft(bool value) {
    _isCreatingPlanDraft = value;
  }

  bool _isCreatingNutritionDraft = false;
  bool get isCreatingNutritionDraft => _isCreatingNutritionDraft;
  set isCreatingNutritionDraft(bool value) {
    _isCreatingNutritionDraft = value;
  }

  bool _isCreatingDigiProdDraft = false;
  bool get isCreatingDigiProdDraft => _isCreatingDigiProdDraft;
  set isCreatingDigiProdDraft(bool value) {
    _isCreatingDigiProdDraft = value;
  }

  bool _isCreatingTraining = false;
  bool get isCreatingTraining => _isCreatingTraining;
  set isCreatingTraining(bool value) {
    _isCreatingTraining = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
