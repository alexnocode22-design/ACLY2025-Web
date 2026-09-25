// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:intl/intl.dart';

class PopUpSlotSelectionCalendar extends StatefulWidget {
  const PopUpSlotSelectionCalendar({
    Key? key,
    this.width,
    this.height,
    this.availableSlots,
    this.selectedSlots,
    required this.trainingId,
    required this.trainerId,
    required this.sessionId,
    required this.trainingName,
    required this.trainingPhoto1,
    required this.trainingPrice,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic availableSlots;
  final List<TrainingsBookedTempRow>? selectedSlots;
  final int trainingId;
  final String trainerId;
  final String sessionId;
  final String trainingName;
  final String trainingPhoto1;
  final int trainingPrice;

  @override
  State<PopUpSlotSelectionCalendar> createState() =>
      _PopUpSlotSelectionCalendarState();
}

class _PopUpSlotSelectionCalendarState
    extends State<PopUpSlotSelectionCalendar> {
  DateTime _currentMonth = DateTime.now();
  DateTime? _selectedDate;
  bool _monthBooking = false;
  bool _isProcessingCheckbox = false;

  // ✅ CHANGE 1: Add ScrollController
  final ScrollController _scrollController = ScrollController();

  Map<String, List<dynamic>> _availableSlots = {};
  List<dynamic> _selectedSlots = [];

  late final DateTime _minDate;
  late final DateTime _maxDate;

  // Design colors
  static const Color selectedDateColor = Color(0xFFFF740F);
  static const Color todayDateColor = Color(0xFAF6C0A0);
  static const Color slotBorderColor = Color(0xFF7B43CE);
  static const Color slotSelectedColor = Color(0xFF7B43CE);
  static const Color weekendColor = Color(0xFFFF740F);
  static const Color widgetBackgroundColor = Color(0xFFFFFCFC);
  static const Color slotsZoneBackgroundColor = Color(0xFFFFF9F5);
  static const Color freeSlotsBorderColor = Color(0xFF39D2C0);
  static const Color durationTextColor = Color(0xFF2C2C2C);
  static const Color monthTextColor = Color(0xFF344054);
  static const Color arrowColor = Color(0xFFFF740F);

  @override
  void initState() {
    super.initState();

    _minDate = DateTime.now();
    _maxDate = DateTime.now().add(Duration(days: 90));

    _initializeState();
  }

  // ✅ CHANGE 2: Dispose ScrollController
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(PopUpSlotSelectionCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.availableSlots != oldWidget.availableSlots ||
        widget.selectedSlots != oldWidget.selectedSlots) {
      _initializeState();
    }
  }

  void _initializeState() {
    _availableSlots = widget.availableSlots is Map
        ? Map<String, List<dynamic>>.from(
            (widget.availableSlots as Map).map(
              (key, value) => MapEntry(
                key.toString(),
                value is List ? List<dynamic>.from(value) : [],
              ),
            ),
          )
        : {};

    _selectedSlots = [];
    if (widget.selectedSlots != null && widget.selectedSlots!.isNotEmpty) {
      for (var booking in widget.selectedSlots!) {
        if (booking.slotDate != null && booking.slotStartDatetime != null) {
          final moscowTime =
              booking.slotStartDatetime!.toUtc().add(Duration(hours: 3));
          _selectedSlots.add({
            'date': booking.slotDate!,
            'time': DateFormat('HH:mm').format(moscowTime),
            'duration': booking.slotDuration ?? 60,
            'slotId': booking.slotId,
          });

          final dateKey = DateFormat('yyyy-MM-dd').format(booking.slotDate!);
          if (_availableSlots.containsKey(dateKey)) {
            _availableSlots[dateKey]!.removeWhere((slot) {
              return slot['slotId'] == booking.slotId;
            });
          }
        }
      }

      print('✅ Initialized with ${_selectedSlots.length} pre-selected slots');
    }
  }

  // ✅ CHANGE 3: Add _scrollToBottom helper
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _handleSlotSelection(dynamic slot) async {
    print('🎯 Widget: Slot selected - ${slot['slotId']} at ${slot['time']}');

    final previousSlots = List<dynamic>.from(_selectedSlots);

    setState(() {
      _selectedSlots.add({
        'date': _selectedDate!,
        'time': slot['time'],
        'duration': slot['duration'],
        'slotId': slot['slotId'],
      });

      final dateKey = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      if (_availableSlots.containsKey(dateKey)) {
        _availableSlots[dateKey]!.remove(slot);
      }
    });

    // ✅ CHANGE 4: Scroll to bottom after slot selected
    _scrollToBottom();

    print('🎯 Widget: Calling handleSlotSelectionChanged...');

    try {
      await handleSlotSelectionChanged(
        _selectedSlots,
        previousSlots,
        widget.trainingId,
        widget.trainerId,
        widget.sessionId,
        widget.trainingName,
        widget.trainingPhoto1,
        widget.trainingPrice,
      );

      print('✅ Widget: handleSlotSelectionChanged completed successfully');
    } catch (e, stackTrace) {
      print('❌ Widget: Error in handleSlotSelectionChanged: $e');
      print('Stack trace: $stackTrace');

      setState(() {
        _selectedSlots = previousSlots;
        _initializeState();
      });
    }
  }

  Future<void> _handleSlotRemoval(int index) async {
    print('🎯 Widget: Removing slot at index $index');

    final removedSlot = _selectedSlots[index];
    final previousSlots = List<dynamic>.from(_selectedSlots);

    setState(() {
      _selectedSlots.removeAt(index);

      final dateKey = DateFormat('yyyy-MM-dd').format(removedSlot['date']);
      if (_availableSlots.containsKey(dateKey)) {
        _availableSlots[dateKey]!.add({
          'time': removedSlot['time'],
          'duration': removedSlot['duration'],
          'slotId': removedSlot['slotId'],
        });

        _availableSlots[dateKey]!.sort((a, b) {
          try {
            final timeA =
                DateFormat('HH:mm').parse(a['time']?.toString() ?? '00:00');
            final timeB =
                DateFormat('HH:mm').parse(b['time']?.toString() ?? '00:00');
            return timeA.compareTo(timeB);
          } catch (e) {
            return 0;
          }
        });
      } else {
        _availableSlots[dateKey] = [
          {
            'time': removedSlot['time'],
            'duration': removedSlot['duration'],
            'slotId': removedSlot['slotId'],
          }
        ];
      }
    });

    print('🎯 Widget: Calling handleSlotSelectionChanged for removal...');

    try {
      await handleSlotSelectionChanged(
        _selectedSlots,
        previousSlots,
        widget.trainingId,
        widget.trainerId,
        widget.sessionId,
        widget.trainingName,
        widget.trainingPhoto1,
        widget.trainingPrice,
      );

      print('✅ Widget: handleSlotSelectionChanged completed for removal');
    } catch (e, stackTrace) {
      print('❌ Widget: Error in handleSlotSelectionChanged: $e');
      print('Stack trace: $stackTrace');

      setState(() {
        _selectedSlots = previousSlots;
        _initializeState();
      });
    }
  }

  Future<void> _addRecurringSlots() async {
    if (_selectedSlots.isEmpty) {
      print('⚠️ No slots selected to create recurring bookings');
      return;
    }

    print('🔄 Adding recurring slots for 3 weeks...');

    final originalSlots = List<dynamic>.from(_selectedSlots);
    final previousSlots = List<dynamic>.from(_selectedSlots);

    try {
      for (var originalSlot in originalSlots) {
        final originalDate = originalSlot['date'] as DateTime;
        final time = originalSlot['time'];
        final duration = originalSlot['duration'];

        for (int week = 1; week <= 3; week++) {
          final newDate = originalDate.add(Duration(days: 7 * week));
          final dateKey = DateFormat('yyyy-MM-dd').format(newDate);

          if (_availableSlots.containsKey(dateKey)) {
            final matchingSlot = _availableSlots[dateKey]!.firstWhere(
              (slot) => slot['time'] == time,
              orElse: () => null,
            );

            if (matchingSlot != null) {
              _selectedSlots.add({
                'date': newDate,
                'time': time,
                'duration': duration,
                'slotId': matchingSlot['slotId'],
              });

              _availableSlots[dateKey]!.remove(matchingSlot);

              print(
                  '✅ Added recurring slot: $time on ${DateFormat('yyyy-MM-dd').format(newDate)}');
            } else {
              print(
                  '⚠️ No matching slot at $time on ${DateFormat('yyyy-MM-dd').format(newDate)}');
            }
          } else {
            print(
                '⚠️ No available slots on ${DateFormat('yyyy-MM-dd').format(newDate)}');
          }
        }
      }

      print(
          '✅ Added ${_selectedSlots.length - originalSlots.length} recurring slots');

      await handleSlotSelectionChanged(
        _selectedSlots,
        previousSlots,
        widget.trainingId,
        widget.trainerId,
        widget.sessionId,
        widget.trainingName,
        widget.trainingPhoto1,
        widget.trainingPrice,
      );
    } catch (e, stackTrace) {
      print('❌ Error adding recurring slots: $e');
      print('Stack trace: $stackTrace');

      setState(() {
        _selectedSlots = previousSlots;
        _initializeState();
      });
    }
  }

  Future<void> _removeRecurringSlots() async {
    if (_selectedSlots.isEmpty) {
      return;
    }

    print('🔄 Removing recurring slots...');

    final previousSlots = List<dynamic>.from(_selectedSlots);

    try {
      Map<String, List<dynamic>> slotsByTime = {};

      for (var slot in _selectedSlots) {
        final time = slot['time'] as String;
        if (!slotsByTime.containsKey(time)) {
          slotsByTime[time] = [];
        }
        slotsByTime[time]!.add(slot);
      }

      List<dynamic> slotsToKeep = [];
      List<dynamic> slotsToRemove = [];

      for (var timeGroup in slotsByTime.values) {
        timeGroup.sort((a, b) {
          final dateA = a['date'] as DateTime;
          final dateB = b['date'] as DateTime;
          return dateA.compareTo(dateB);
        });

        slotsToKeep.add(timeGroup.first);
        if (timeGroup.length > 1) {
          slotsToRemove.addAll(timeGroup.sublist(1));
        }
      }

      for (var slot in slotsToRemove) {
        final dateKey = DateFormat('yyyy-MM-dd').format(slot['date']);

        if (_availableSlots.containsKey(dateKey)) {
          _availableSlots[dateKey]!.add({
            'time': slot['time'],
            'duration': slot['duration'],
            'slotId': slot['slotId'],
          });

          _availableSlots[dateKey]!.sort((a, b) {
            try {
              final timeA =
                  DateFormat('HH:mm').parse(a['time']?.toString() ?? '00:00');
              final timeB =
                  DateFormat('HH:mm').parse(b['time']?.toString() ?? '00:00');
              return timeA.compareTo(timeB);
            } catch (e) {
              return 0;
            }
          });
        } else {
          _availableSlots[dateKey] = [
            {
              'time': slot['time'],
              'duration': slot['duration'],
              'slotId': slot['slotId'],
            }
          ];
        }
      }

      print(
          '✅ Keeping ${slotsToKeep.length} slots, removing ${slotsToRemove.length} recurring slots');

      setState(() {
        _selectedSlots = slotsToKeep;
      });

      await handleSlotSelectionChanged(
        _selectedSlots,
        previousSlots,
        widget.trainingId,
        widget.trainerId,
        widget.sessionId,
        widget.trainingName,
        widget.trainingPhoto1,
        widget.trainingPrice,
      );
    } catch (e, stackTrace) {
      print('❌ Error removing recurring slots: $e');
      print('Stack trace: $stackTrace');

      setState(() {
        _selectedSlots = previousSlots;
        _initializeState();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(16),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.96,
          maxWidth: 600,
        ),
        decoration: BoxDecoration(
          color: widgetBackgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMonthSelector(),
            Divider(height: 1, color: Colors.grey[300]),
            Expanded(
              // ✅ CHANGE 5: Pass ScrollController to SingleChildScrollView
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    _buildWeekdayHeaders(),
                    _buildCalendarGrid(),
                    Container(
                      color: slotsZoneBackgroundColor,
                      child: Column(
                        children: [
                          _buildAvailableSlots(),
                          _buildSelectedSlots(),
                          _buildMonthBookingCheckbox(),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left, size: 32, color: arrowColor),
            onPressed: () {
              setState(() {
                _currentMonth =
                    DateTime(_currentMonth.year, _currentMonth.month - 1);
                _selectedDate = null;
              });
            },
          ),
          Text(
            _capitalizeFirst(
                DateFormat('LLLL yyyy', 'ru_RU').format(_currentMonth)),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: monthTextColor,
              letterSpacing: 0.5,
            ),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, size: 32, color: arrowColor),
            onPressed: () {
              setState(() {
                _currentMonth =
                    DateTime(_currentMonth.year, _currentMonth.month + 1);
                _selectedDate = null;
              });
            },
          ),
        ],
      ),
    );
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  Widget _buildWeekdayHeaders() {
    final weekdays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weekdays.asMap().entries.map((entry) {
          final index = entry.key;
          final day = entry.value;
          final isWeekend = index >= 5;
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isWeekend ? weekendColor : Colors.grey[600],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    int firstWeekday = firstDayOfMonth.weekday;

    List<Widget> dayWidgets = [];

    for (int i = 0; i < firstWeekday - 1; i++) {
      dayWidgets.add(Container());
    }

    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, day);
      final dateKey = DateFormat('yyyy-MM-dd').format(date);
      final hasSlots = _availableSlots.containsKey(dateKey) &&
          _availableSlots[dateKey]!.isNotEmpty;
      final isSelected = _selectedDate != null &&
          _selectedDate!.year == date.year &&
          _selectedDate!.month == date.month &&
          _selectedDate!.day == date.day;
      final isToday = DateTime.now().year == date.year &&
          DateTime.now().month == date.month &&
          DateTime.now().day == date.day;
      final isDisabled = date.isBefore(_minDate) || date.isAfter(_maxDate);
      final isWeekend = date.weekday == 6 || date.weekday == 7;

      dayWidgets.add(
        InkWell(
          onTap: isDisabled || !hasSlots
              ? null
              : () {
                  setState(() {
                    _selectedDate = date;
                  });
                },
          child: Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isSelected
                  ? selectedDateColor
                  : isToday
                      ? todayDateColor
                      : Colors.transparent,
              shape: BoxShape.circle,
              border: hasSlots && !isSelected && !isToday
                  ? Border.all(color: freeSlotsBorderColor, width: 2)
                  : null,
            ),
            child: Center(
              child: Text(
                '$day',
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected || isToday
                      ? Colors.white
                      : isDisabled
                          ? Colors.grey[300]
                          : isWeekend
                              ? weekendColor
                              : hasSlots
                                  ? Colors.black
                                  : Colors.grey[400],
                  fontWeight: hasSlots ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 7,
        children: dayWidgets,
      ),
    );
  }

  Widget _buildAvailableSlots() {
    if (_selectedDate == null) return SizedBox.shrink();

    final dateKey = DateFormat('yyyy-MM-dd').format(_selectedDate!);
    final availableSlotsForDate = _availableSlots[dateKey] ?? [];

    if (availableSlotsForDate.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Нет доступных слотов',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
          child: Text(
            'Свободные слоты:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              children: availableSlotsForDate.map((slot) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => _handleSlotSelection(slot),
                      child: Container(
                        width: 68,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: slotBorderColor, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          slot['time']?.toString() ?? '',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: slotBorderColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${slot['duration']} минут',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: durationTextColor,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedSlots() {
    if (_selectedSlots.isEmpty) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
          child: Text(
            'Выбрано:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8,
              runSpacing: 12,
              alignment: WrapAlignment.start,
              children: _selectedSlots.asMap().entries.map((entry) {
                final index = entry.key;
                final slot = entry.value;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd').format(slot['date']),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: durationTextColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                        color: slotSelectedColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            slot['time']?.toString() ?? '',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFF9F5),
                            ),
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () => _handleSlotRemoval(index),
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: Color(0xFFFFF9F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${slot['duration']} минут',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: durationTextColor,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMonthBookingCheckbox() {
    if (_selectedSlots.isEmpty) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: _monthBooking,
              onChanged: _isProcessingCheckbox
                  ? null
                  : (value) async {
                      if (_isProcessingCheckbox) return;

                      setState(() {
                        _isProcessingCheckbox = true;
                      });

                      try {
                        final newValue = value ?? false;

                        if (newValue) {
                          await _addRecurringSlots();
                        } else {
                          await _removeRecurringSlots();
                        }

                        setState(() {
                          _monthBooking = newValue;
                        });
                      } finally {
                        setState(() {
                          _isProcessingCheckbox = false;
                        });
                      }
                    },
              activeColor: slotSelectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: _isProcessingCheckbox
                ? null
                : () async {
                    if (_isProcessingCheckbox) return;

                    setState(() {
                      _isProcessingCheckbox = true;
                    });

                    try {
                      final newValue = !_monthBooking;

                      if (newValue) {
                        await _addRecurringSlots();
                      } else {
                        await _removeRecurringSlots();
                      }

                      setState(() {
                        _monthBooking = newValue;
                      });
                    } finally {
                      setState(() {
                        _isProcessingCheckbox = false;
                      });
                    }
                  },
            child: Row(
              children: [
                Text(
                  'Купить абонемент на месяц',
                  style: TextStyle(
                    fontSize: 14,
                    color: _isProcessingCheckbox ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [selectedDateColor, slotSelectedColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            'Сохранить →',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
