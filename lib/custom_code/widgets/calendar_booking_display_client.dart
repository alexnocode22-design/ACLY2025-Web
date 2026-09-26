// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
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

import 'dart:async';

/// CalendarBookingDisplayClient - A widget that shows the current user's
/// booking information below the calendar in a card format.
///
/// This widget monitors the selected calendar date and displays only the
/// authenticated user's bookings with training name information.
class CalendarBookingDisplayClient extends StatefulWidget {
  const CalendarBookingDisplayClient({
    super.key,
    this.width,
    this.height,
  });

  /// Width of the display area
  final double? width;

  /// Height of the display area
  final double? height;

  @override
  State<CalendarBookingDisplayClient> createState() =>
      _CalendarBookingDisplayClientState();
}

class _CalendarBookingDisplayClientState
    extends State<CalendarBookingDisplayClient> {
  /// Current selected date being monitored
  DateTime? _currentDate;

  /// List of bookings for the selected date
  List<Map<String, dynamic>> _bookings = [];

  /// Loading state
  bool _isLoading = false;

  /// Error message
  String? _errorMessage;

  /// Timer for monitoring date changes
  Timer? _dateMonitor;

  /// Debounce timer for API calls
  Timer? _debounceTimer;

  /// Current authenticated user ID
  String? _currentUserId;

  // Constants for better maintainability
  static const _pollingInterval = Duration(seconds: 2);
  static const _debounceDelay = Duration(milliseconds: 300);
  static const _defaultTimeSlot = '09:00';
  static const _defaultTrainingName = 'Тренировка';

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _currentDate = FFAppState().selectedCalendarDate ?? DateTime.now();
    _loadBookingData();
    _startDateMonitoring();
  }

  @override
  void dispose() {
    _dateMonitor?.cancel();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _getCurrentUser() {
    final user = SupaFlow.client.auth.currentUser;
    if (user != null) {
      _currentUserId = user.id;
      print('Current user ID: $_currentUserId');
    } else {
      print('No authenticated user found');
    }
  }

  void _startDateMonitoring() {
    _dateMonitor = Timer.periodic(_pollingInterval, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      final newDate = FFAppState().selectedCalendarDate;

      if (_isDifferentDate(_currentDate, newDate)) {
        _currentDate = newDate;
        _loadBookingData();
      }
    });
  }

  bool _isDifferentDate(DateTime? date1, DateTime? date2) {
    if (date1 == null && date2 == null) return false;
    if (date1 == null || date2 == null) return true;
    return date1.year != date2.year ||
        date1.month != date2.month ||
        date1.day != date2.day;
  }

  Future<void> _loadBookingData() async {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDelay, () async {
      if (!mounted || _currentUserId == null) return;

      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final dateString = _currentDate?.toIso8601String().split('T').first;
        print('Loading bookings for user: $_currentUserId, date: $dateString');

        // Filter by slot_start_datetime UTC range covering the full Moscow day.
        // Moscow = UTC+3, so Moscow midnight = 21:00 UTC previous day,
        // Moscow end of day = 20:59 UTC same day.
        final startOfDayUtc = DateTime.utc(
          _currentDate!.year,
          _currentDate!.month,
          _currentDate!.day,
        ).subtract(const Duration(hours: 3));
        final endOfDayUtc = startOfDayUtc.add(const Duration(hours: 24));

        final response = await SupaFlow.client
            .from('trainingsBought')
            .select('*')
            .eq('user_id', _currentUserId!)
            .eq('training_payed', true)
            .eq('slot_cancelled', false)
            .gte('slot_start_datetime', startOfDayUtc.toIso8601String())
            .lt('slot_start_datetime', endOfDayUtc.toIso8601String());

        if (mounted) {
          final bookings = List<Map<String, dynamic>>.from(response ?? []);

          print('Found ${bookings.length} bookings for selected date');

          setState(() {
            _bookings = bookings;
            _isLoading = false;
          });
        }
      } catch (e) {
        print('Error loading booking data: $e');
        if (mounted) {
          setState(() {
            _bookings = [];
            _isLoading = false;
            _errorMessage = 'Не удалось загрузить бронирования';
          });
        }
      }
    });
  }

  void _showTrainingInfoPopup(
      BuildContext context, Map<String, dynamic> booking) {
    final trainingName = _getTrainingName(booking);
    final timeSlot = _getTimeSlot(booking);
    final duration = _getSlotDuration(booking);

    showDialog(
      context: context,
      builder: (BuildContext context) => _TrainingInfoDialog(
        trainingName: trainingName,
        timeSlot: timeSlot,
        duration: duration,
      ),
    );
  }

  String _getTrainingName(Map<String, dynamic> booking) {
    return booking['training_name'] as String? ?? _defaultTrainingName;
  }

  String _getTimeSlot(Map<String, dynamic> booking) {
    final slotStartDatetime = booking['slot_start_datetime'] as String?;

    if (slotStartDatetime != null && slotStartDatetime.isNotEmpty) {
      try {
        // slot_start_datetime is stored in UTC — convert to Moscow (UTC+3)
        final moscow = DateTime.parse(slotStartDatetime)
            .toUtc()
            .add(const Duration(hours: 3));
        return '${moscow.hour.toString().padLeft(2, '0')}:${moscow.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        print('Error parsing slot_start_datetime: $e');
      }
    }

    return _defaultTimeSlot;
  }

  int _getSlotDuration(Map<String, dynamic> booking) {
    final duration = booking['slot_duration'];
    if (duration != null) {
      return duration is int
          ? duration
          : int.tryParse(duration.toString()) ?? 0;
    }
    return 0;
  }

  DateTime _getTimeForSorting(Map<String, dynamic> booking) {
    final slotStartDatetime = booking['slot_start_datetime'] as String?;

    if (slotStartDatetime != null && slotStartDatetime.isNotEmpty) {
      try {
        // slot_start_datetime is stored in UTC — convert to Moscow (UTC+3)
        return DateTime.parse(slotStartDatetime)
            .toUtc()
            .add(const Duration(hours: 3));
      } catch (e) {
        print('Error parsing datetime for sorting: $e');
      }
    }

    final today = DateTime.now();
    return DateTime(today.year, today.month, today.day, 9, 0);
  }

  Map<String, List<Map<String, dynamic>>> _groupBookingsByTraining() {
    final grouped = <String, List<Map<String, dynamic>>>{};

    for (final booking in _bookings) {
      final trainingName = _getTrainingName(booking);
      grouped.putIfAbsent(trainingName, () => []);
      grouped[trainingName]!.add(booking);
    }

    for (final bookings in grouped.values) {
      bookings.sort((a, b) {
        final timeA = _getTimeForSorting(a);
        final timeB = _getTimeForSorting(b);
        return timeA.compareTo(timeB);
      });
    }

    return grouped;
  }

  List<Widget> _buildGroupedBookingCards() {
    final groupedBookings = _groupBookingsByTraining();

    final sortedTrainings = groupedBookings.keys.toList()
      ..sort((a, b) {
        final earliestTimeA = _getTimeForSorting(groupedBookings[a]![0]);
        final earliestTimeB = _getTimeForSorting(groupedBookings[b]![0]);
        return earliestTimeA.compareTo(earliestTimeB);
      });

    return sortedTrainings
        .map((trainingName) => _BookingCard(
              trainingName: trainingName,
              bookings: groupedBookings[trainingName]!,
              getTimeSlot: _getTimeSlot,
              onTapBooking: (booking) =>
                  _showTrainingInfoPopup(context, booking),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUserId == null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: const Center(
          child: Text(
            'Необходимо войти в систему',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: _isLoading
          ? const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          : _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error_outline,
                            color: Colors.red.shade300, size: 48),
                        const SizedBox(height: 12),
                        Text(
                          _errorMessage!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: _loadBookingData,
                          child: const Text('Повторить'),
                        ),
                      ],
                    ),
                  ),
                )
              : _bookings.isEmpty
                  ? const SizedBox.shrink()
                  : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildGroupedBookingCards(),
                      ),
                    ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  const _BookingCard({
    required this.trainingName,
    required this.bookings,
    required this.getTimeSlot,
    required this.onTapBooking,
  });

  final String trainingName;
  final List<Map<String, dynamic>> bookings;
  final String Function(Map<String, dynamic>) getTimeSlot;
  final void Function(Map<String, dynamic>) onTapBooking;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trainingName,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Ваши забронированные слоты',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey.shade600,
              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
            ),
          ),
          const SizedBox(height: 12.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: bookings
                .map((booking) => _TimeSlotChip(
                      timeSlot: getTimeSlot(booking),
                      onTap: () => onTapBooking(booking),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TimeSlotChip extends StatelessWidget {
  const _TimeSlotChip({
    required this.timeSlot,
    required this.onTap,
  });

  final String timeSlot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF6B46C1),
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2.0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          timeSlot,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _TrainingInfoDialog extends StatelessWidget {
  const _TrainingInfoDialog({
    required this.trainingName,
    required this.timeSlot,
    required this.duration,
  });

  final String trainingName;
  final String timeSlot;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
      titlePadding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
      actionsPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
      title: Text(
        'Информация о тренировке',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.fitness_center,
                color: Color(0xFF6B46C1),
                size: 18.0,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  'Тренировка: $trainingName',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: Color(0xFF6B46C1),
                size: 18.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Время: $timeSlot',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                ),
              ),
            ],
          ),
          if (duration > 0) ...[
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(
                  Icons.timer,
                  color: Color(0xFF6B46C1),
                  size: 18.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'Продолжительность: $duration мин',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF6B46C1),
          ),
          child: const Text('Закрыть'),
        ),
      ],
    );
  }
}
