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

import 'dart:async';
import 'dart:developer' as devtools show log;
import 'package:flutter/foundation.dart' show kDebugMode;

class CalendarBookingDisplay extends StatefulWidget {
  const CalendarBookingDisplay({
    super.key,
    this.width,
    this.height,
    required this.tableName,
    required this.dateFieldName,
    this.trainerField,
    this.trainerValue,
    this.cancelledField,
    this.payedField,
    this.trainingTypeField,
    this.timeSlotField,
    this.userIdField,
  });

  final double? width;
  final double? height;
  final String tableName;
  final String dateFieldName;
  final String? trainerField;
  final String? trainerValue;
  final String? cancelledField;
  final String? payedField;
  final String? trainingTypeField;
  final String? timeSlotField;
  final String? userIdField;

  @override
  State<CalendarBookingDisplay> createState() => _CalendarBookingDisplayState();
}

class _CalendarBookingDisplayState extends State<CalendarBookingDisplay> {
  DateTime? _currentDate;
  List<Map<String, dynamic>> _bookings = [];
  bool _isLoading = false;
  String? _errorMessage;
  Timer? _dateMonitor;
  Timer? _debounceTimer;

  // Constants for better maintainability
  static const _pollingInterval = Duration(seconds: 2);
  static const _debounceDelay = Duration(milliseconds: 300);
  static const _defaultTimeSlot = '09:00';
  static const _defaultTrainingType = 'Тренировка';

  @override
  void initState() {
    super.initState();
    _currentDate = FFAppState().selectedCalendarDate ?? DateTime.now();
    _loadBookingData();
    _startPolling();
  }

  @override
  void dispose() {
    _dateMonitor?.cancel();
    _debounceTimer?.cancel();
    super.dispose();
  }

  /// Start monitoring for date changes with optimized polling
  void _startPolling() {
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

  /// Check if two dates are different (comparing only year, month, day)
  bool _isDifferentDate(DateTime? a, DateTime? b) {
    if (a == null && b == null) return false;
    if (a == null || b == null) return true;
    return a.year != b.year || a.month != b.month || a.day != b.day;
  }

  /// Load booking data from Supabase with debouncing
  Future<void> _loadBookingData() async {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDelay, () async {
      if (!mounted) return;

      if (_currentDate == null) {
        if (mounted) {
          setState(() {
            _bookings = [];
            _isLoading = false;
            _errorMessage = null;
          });
        }
        return;
      }

      final DateTime safeDate = _currentDate!;

      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        // Filter by slot_start_datetime UTC range covering the full Moscow day.
        // Moscow = UTC+3, so Moscow midnight = 21:00 UTC previous day.
        final startOfDayUtc = DateTime.utc(
          safeDate.year,
          safeDate.month,
          safeDate.day,
        ).subtract(const Duration(hours: 3));
        final endOfDayUtc = startOfDayUtc.add(const Duration(hours: 24));

        var query = SupaFlow.client.from(widget.tableName).select();
        query = query
            .gte('slot_start_datetime', startOfDayUtc.toIso8601String())
            .lt('slot_start_datetime', endOfDayUtc.toIso8601String());

        if (widget.trainerField != null && widget.trainerValue != null) {
          query = query.eq(widget.trainerField!, widget.trainerValue!);
        }
        if (widget.cancelledField != null) {
          query = query.eq(widget.cancelledField!, false);
        }
        if (widget.payedField != null) {
          query = query.eq(widget.payedField!, true);
        }

        final response = await query;
        final bookings =
            (response as List?)?.cast<Map<String, dynamic>>().toList() ?? [];

        if (mounted) {
          setState(() {
            _bookings = bookings;
            _isLoading = false;
          });
        }
      } catch (e) {
        if (kDebugMode) {
          devtools.log('Error loading bookings: $e');
        }
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

  /// Fetch user info including photo
  Future<Map<String, dynamic>?> _getUserInfo(String userId) async {
    try {
      final response = await SupaFlow.client
          .from('user_profile')
          .select('user_name, user_surname, user_photo')
          .eq('user_id', userId)
          .single();

      final userName =
          (response['user_name'] as String?)?.trim() ?? 'Неизвестно';
      final userSurname = (response['user_surname'] as String?)?.trim() ?? '';
      final userPhoto = response['user_photo'] as String?;

      return {
        'user_name': userName,
        'user_surname': userSurname,
        'user_photo': userPhoto,
      };
    } catch (e) {
      if (kDebugMode) {
        devtools.log('User not found by user_id ($userId): $e');
      }
      return null;
    }
  }

  /// Show popup with user info and photo
  void _showUserInfoPopup(
      BuildContext context, Map<String, dynamic> booking) async {
    final userId = _getUserId(booking);
    if (userId == null || userId.isEmpty) {
      _showSimpleDialog(
          context, 'Ошибка', 'Не найден ID пользователя в бронировании');
      return;
    }

    final timeSlot = _getTimeSlot(booking);

    showDialog(
      context: context,
      builder: (context) => _UserInfoDialog(
        userId: userId,
        timeSlot: timeSlot,
        getUserInfo: _getUserInfo,
      ),
    );
  }

  /// Show simple error dialog
  void _showSimpleDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style:
                TextButton.styleFrom(foregroundColor: const Color(0xFF6B46C1)),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Extract user_id (UUID) from booking
  String? _getUserId(Map<String, dynamic> booking) {
    final candidates = [
      widget.userIdField,
      'user_id',
      'userId',
      'client_id',
      'clientId',
      'user',
    ];

    for (final field in candidates.where((f) => f != null)) {
      final value = booking[field];
      if (value == null) continue;
      final valueStr = value.toString().trim();
      if (valueStr.isEmpty) continue;

      // Skip integer IDs (not UUIDs)
      if (valueStr.split('-').length == 1 && int.tryParse(valueStr) != null) {
        if (kDebugMode) {
          devtools.log(
              'WARNING: Skipping integer ID ($valueStr) — expected UUID format');
        }
        continue;
      }

      return valueStr;
    }
    return null;
  }

  String _getTrainingType(Map<String, dynamic> booking) {
    return booking[widget.trainingTypeField ?? 'training_type'] ??
        booking['category'] ??
        booking['type'] ??
        booking['training_name'] ??
        _defaultTrainingType;
  }

  String _getTimeSlot(Map<String, dynamic> booking) {
    final raw = booking[widget.timeSlotField ?? 'time_slot'] ??
        booking['slot_time'] ??
        booking['time'] ??
        booking['start_time'];

    if (raw == null) return _defaultTimeSlot;

    final rawStr = raw.toString();

    // Handle ISO 8601 datetime strings
    if (rawStr.contains('T')) {
      try {
        // slot_start_datetime is stored in UTC — convert to Moscow (UTC+3)
        final moscow =
            DateTime.parse(rawStr).toUtc().add(const Duration(hours: 3));
        return '${moscow.hour.toString().padLeft(2, '0')}:${moscow.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        if (kDebugMode) {
          devtools.log('Failed to parse datetime: $rawStr');
        }
      }
    }

    // Handle time-only strings (HH:MM)
    final parts = rawStr.split(':');
    if (parts.length >= 2) {
      try {
        final h = int.parse(parts[0].trim());
        final m = int.parse(parts[1].trim());
        if (h >= 0 && h < 24 && m >= 0 && m < 60) {
          return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
        }
      } catch (e) {
        if (kDebugMode) {
          devtools.log('Failed to parse time: $rawStr');
        }
      }
    }

    return _defaultTimeSlot;
  }

  DateTime _getTimeForSorting(Map<String, dynamic> booking) {
    final raw = booking[widget.timeSlotField ?? 'time_slot'] ??
        booking['slot_time'] ??
        booking['time'] ??
        booking['start_time'];

    final today = DateTime.now();
    final defaultTime = DateTime(today.year, today.month, today.day, 9, 0);

    if (raw == null) return defaultTime;

    final rawStr = raw.toString();

    // Handle ISO 8601 datetime
    if (rawStr.contains('T')) {
      try {
        // slot_start_datetime is stored in UTC — convert to Moscow (UTC+3)
        return DateTime.parse(rawStr).toUtc().add(const Duration(hours: 3));
      } catch (e) {
        return defaultTime;
      }
    }

    // Handle time-only strings
    final parts = rawStr.split(':');
    if (parts.length >= 2) {
      try {
        final h = int.parse(parts[0]);
        final m = int.parse(parts[1]);
        return DateTime(today.year, today.month, today.day, h, m);
      } catch (e) {
        return defaultTime;
      }
    }

    return defaultTime;
  }

  Map<String, List<Map<String, dynamic>>> _groupBookingsByType() {
    final grouped = <String, List<Map<String, dynamic>>>{};

    for (final booking in _bookings) {
      final type = _getTrainingType(booking);
      grouped.putIfAbsent(type, () => []);
      grouped[type]!.add(booking);
    }

    // Sort bookings within each group by time
    for (final bookings in grouped.values) {
      bookings.sort(
          (a, b) => _getTimeForSorting(a).compareTo(_getTimeForSorting(b)));
    }

    return grouped;
  }

  List<Widget> _buildGroupedBookingCards() {
    final grouped = _groupBookingsByType();

    // Sort training types by earliest booking time
    final sortedTypes = grouped.keys.toList()
      ..sort((a, b) {
        final timeA = _getTimeForSorting(grouped[a]!.first);
        final timeB = _getTimeForSorting(grouped[b]!.first);
        return timeA.compareTo(timeB);
      });

    return sortedTypes
        .map((type) => _BookingCard(
              trainingType: type,
              bookings: grouped[type]!,
              getTimeSlot: _getTimeSlot,
              onTapBooking: (booking) => _showUserInfoPopup(context, booking),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
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

/// Extracted widget for booking card to improve performance
class _BookingCard extends StatelessWidget {
  const _BookingCard({
    required this.trainingType,
    required this.bookings,
    required this.getTimeSlot,
    required this.onTapBooking,
  });

  final String trainingType;
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
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trainingType.toLowerCase(),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Забронированные слоты',
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

/// Extracted widget for time slot chip
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
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3.0,
              offset: const Offset(0, 2),
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

/// Extracted widget for user info dialog
class _UserInfoDialog extends StatelessWidget {
  const _UserInfoDialog({
    required this.userId,
    required this.timeSlot,
    required this.getUserInfo,
  });

  final String userId;
  final String timeSlot;
  final Future<Map<String, dynamic>?> Function(String) getUserInfo;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: getUserInfo(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            title: const Text("Ошибка"),
            content: const Text("Не удалось загрузить данные пользователя."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF6B46C1)),
                child: const Text("Закрыть"),
              ),
            ],
          );
        }

        final data = snapshot.data!;
        final userName = data['user_name'] as String;
        final userSurname = data['user_surname'] as String;
        final userPhoto = data['user_photo'] as String?;
        final fullName =
            userSurname.isEmpty ? userName : '$userName $userSurname';

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
          titlePadding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
          actionsPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
          title: Text(
            'Информация о бронировании',
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
                  // Profile photo
                  ClipOval(
                    child: Container(
                      width: 56,
                      height: 56,
                      color: Colors.grey.shade300,
                      child: userPhoto != null && userPhoto.isNotEmpty
                          ? Image.network(
                              userPhoto,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.person, size: 30),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                    child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2)));
                              },
                            )
                          : const Icon(Icons.person,
                              size: 30, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Клиент: $fullName',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                color: Color(0xFF6B46C1), size: 16.0),
                            const SizedBox(width: 6.0),
                            Text(
                              timeSlot,
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.grey.shade700,
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF6B46C1)),
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }
}
