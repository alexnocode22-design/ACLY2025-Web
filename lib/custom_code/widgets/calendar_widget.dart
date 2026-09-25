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

import 'package:table_calendar/table_calendar.dart';

/// CalendarWidget - A custom Flutter widget that displays an interactive
/// calendar with support for booked dates, visual animations, and date
/// selection.
///
/// Features: - Displays a monthly calendar view in Russian locale - Shows
/// booked dates with special green styling and pulsing animation - Highlights
/// today's date with distinct orange coloring - Allows date selection with
/// visual feedback - Updates app state when dates are selected - Supports
/// custom width and height sizing - Weekend days (Saturday & Sunday) are
/// styled in orange color - Month navigation arrows are styled in orange
/// color - Booked dates have animated pulsing effect with green glow -
/// Prevents selection of past dates entirely - Optimized animation lifecycle
/// management
class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
    this.width,
    this.height,
    this.bookedDates,
  });

  /// Optional width constraint for the calendar widget
  final double? width;

  /// Optional height constraint for the calendar widget
  final double? height;

  /// List of dates that are marked as "booked" and will be highlighted
  /// in green with a pulsing animation effect
  final List<DateTime>? bookedDates;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

/// State class for CalendarWidget that manages calendar interactions,
/// animations, and visual styling
class _CalendarWidgetState extends State<CalendarWidget>
    with SingleTickerProviderStateMixin {
  /// Tracks which day is currently in focus (visible month)
  late final ValueNotifier<DateTime> _focusedDay;

  /// Tracks the currently selected date by the user
  DateTime? _selectedDay;

  /// Animation controller for the pulsing effect on booked dates
  late AnimationController _animationController;

  /// Animation that creates a scaling pulse effect for booked dates
  late Animation<double> _pulseAnimation;

  /// Orange color constant used for weekend styling and navigation arrows
  static const Color _orangeColor = Color(0xFFff740f);

  @override
  void initState() {
    super.initState();

    // Initialize the focused day to today's date
    _focusedDay = ValueNotifier(DateTime.now());

    // Set the initially selected day to today
    final now = DateTime.now();
    _selectedDay = now;

    // Setup animation controller for 2-second repeating pulse animation
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create a scaling animation that pulses between 1.0 and 1.1 scale
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start animation if there are booked dates
    if (widget.bookedDates != null && widget.bookedDates!.isNotEmpty) {
      _animationController.repeat(reverse: true);
    }

    // Update app state with initial selection
    _updateAppState(now);
  }

  @override
  void didUpdateWidget(CalendarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if bookedDates have changed
    if (_hasBookedDatesChanged(oldWidget.bookedDates, widget.bookedDates)) {
      // Manage animation based on booked dates presence
      if (widget.bookedDates != null && widget.bookedDates!.isNotEmpty) {
        if (!_animationController.isAnimating) {
          _animationController.repeat(reverse: true);
        }
      } else {
        _animationController.stop();
      }

      // Trigger rebuild to show updated booked dates
      if (mounted) {
        setState(() {});
      }
    }
  }

  /// Checks if booked dates have actually changed
  bool _hasBookedDatesChanged(
      List<DateTime>? oldDates, List<DateTime>? newDates) {
    // If one is null and other isn't, they're different
    if (oldDates == null && newDates != null) return true;
    if (oldDates != null && newDates == null) return true;
    if (oldDates == null && newDates == null) return false;

    // Both are non-null, compare lengths
    if (oldDates!.length != newDates!.length) return true;

    // Same length, check if dates are actually the same
    final oldSet = oldDates.map(_dateToString).toSet();
    final newSet = newDates.map(_dateToString).toSet();

    return oldSet.difference(newSet).isNotEmpty;
  }

  /// Converts a DateTime to a comparable string (YYYY-MM-DD)
  String _dateToString(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  @override
  void dispose() {
    // Stop animation before disposing
    _animationController.stop();
    _animationController.dispose();
    _focusedDay.dispose();
    super.dispose();
  }

  /// Checks if a given day is marked as booked in the provided booked dates list
  /// Only returns true for future dates (today and onwards)
  bool _isBooked(DateTime day) {
    if (widget.bookedDates == null || widget.bookedDates!.isEmpty) {
      return false;
    }

    // Don't highlight past days as booked
    if (_isPastDay(day)) return false;

    return widget.bookedDates!.any((booked) =>
        booked.year == day.year &&
        booked.month == day.month &&
        booked.day == day.day);
  }

  /// Checks if a given day is in the past (before today)
  bool _isPastDay(DateTime day) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final checkDay = DateTime(day.year, day.month, day.day);
    return checkDay.isBefore(today);
  }

  /// Checks if a given day is today's date
  bool _isToday(DateTime day) {
    final now = DateTime.now();
    return now.year == day.year && now.month == day.month && now.day == day.day;
  }

  /// Updates the global app state with the selected date
  /// Simplified to use only FlutterFlow's standard update mechanism
  void _updateAppState(DateTime selectedDay) {
    try {
      FFAppState().update(() {
        FFAppState().selectedCalendarDate = selectedDay;
      });
    } catch (e) {
      debugPrint('Error updating app state: $e');
    }
  }

  /// Handles date selection with simplified state management
  void _onDateSelected(DateTime selectedDay) {
    // Prevent selection of past dates
    if (_isPastDay(selectedDay)) {
      return;
    }

    // Update local state
    if (mounted) {
      setState(() {
        _selectedDay = selectedDay;
      });
    }

    // Update global app state
    _updateAppState(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TableCalendar(
        // Calendar starts the week on Monday (common in Europe/Russia)
        startingDayOfWeek: StartingDayOfWeek.monday,

        // Set calendar to Russian locale for proper month/day names
        locale: 'ru_RU',

        // Define the range of dates the calendar can display
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),

        // Current month being displayed
        focusedDay: _focusedDay.value,

        // Predicate to determine which day is selected
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

        // Day selection handler with past date prevention
        onDaySelected: (selectedDay, focusedDay) {
          if (!mounted) return;

          // Prevent selection of past dates
          if (_isPastDay(selectedDay)) {
            return;
          }

          // Update focused day
          _focusedDay.value = focusedDay;

          // Handle date selection
          _onDateSelected(selectedDay);
        },

        // Handle page changes (month navigation)
        onPageChanged: (focusedDay) {
          if (!mounted) return;
          _focusedDay.value = focusedDay;

          // If the current selected day is not in the new month,
          // update selection to the first valid day of the new month
          if (_selectedDay != null &&
              (_selectedDay!.month != focusedDay.month ||
                  _selectedDay!.year != focusedDay.year)) {
            final firstDayOfMonth =
                DateTime(focusedDay.year, focusedDay.month, 1);

            // If first day is in the past, select today instead
            if (_isPastDay(firstDayOfMonth)) {
              _onDateSelected(DateTime.now());
            } else {
              _onDateSelected(firstDayOfMonth);
            }
          }
        },

        // Only show month view format
        availableCalendarFormats: const {
          CalendarFormat.month: 'Месяц',
        },

        // Basic calendar styling
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
        ),

        // Styling for the days of week header (Mon, Tue, Wed, etc.)
        daysOfWeekStyle: DaysOfWeekStyle(
          // Style for Monday through Friday
          weekdayStyle: TextStyle(
            fontSize: 12.0,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          // Style for Saturday and Sunday - orange colored
          weekendStyle: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: _orangeColor,
          ),
        ),

        // Styling for the calendar header
        headerStyle: HeaderStyle(
          // Hide the format button
          formatButtonVisible: false,

          // Center the month/year title
          titleCentered: true,

          // Style the month/year title text
          titleTextStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                fontSize: 22,
                color: FlutterFlowTheme.of(context).primaryText,
              ),

          // Custom formatter for Russian month names
          titleTextFormatter: (date, locale) {
            const monthNames = [
              'январь',
              'февраль',
              'март',
              'апрель',
              'май',
              'июнь',
              'июль',
              'август',
              'сентябрь',
              'октябрь',
              'ноябрь',
              'декабрь'
            ];
            final monthName = monthNames[date.month - 1];
            final capitalizedMonth =
                monthName[0].toUpperCase() + monthName.substring(1);
            return '$capitalizedMonth ${date.year}';
          },

          // Style the navigation arrows in orange
          leftChevronIcon: const Icon(
            Icons.chevron_left,
            color: _orangeColor,
          ),
          rightChevronIcon: const Icon(
            Icons.chevron_right,
            color: _orangeColor,
          ),
        ),

        // Custom builders for different day states
        calendarBuilders: CalendarBuilders(
          // Builder for selected days
          selectedBuilder: (context, day, focusedDay) {
            final isBooked = _isBooked(day);
            final isPast = _isPastDay(day);

            // Past days should not be selectable
            if (isPast) {
              return _buildPastDay(day);
            }

            if (isBooked) {
              return _buildSelectedBookedDay(day);
            } else {
              return _buildFixedCircle(day, _orangeColor);
            }
          },

          // Builder for regular (non-selected, non-today) days
          defaultBuilder: (context, day, focusedDay) {
            final isBooked = _isBooked(day);
            final isToday = _isToday(day);
            final isPast = _isPastDay(day);

            // Check if this day is a weekend
            final isWeekend = day.weekday == DateTime.saturday ||
                day.weekday == DateTime.sunday;

            // Determine text style based on day type
            TextStyle dayStyle;

            if (isPast) {
              dayStyle = TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
              );
            } else if (isWeekend) {
              dayStyle = const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _orangeColor,
              );
            } else {
              dayStyle = const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              );
            }

            // Handle different day states
            if (isPast) {
              return _buildPastDay(day);
            }

            if (isBooked) {
              if (isToday) {
                return _buildTodayBookedDay(day);
              } else {
                return _buildBookedDay(day);
              }
            } else if (isToday) {
              return _buildFixedCircle(day, const Color(0x88ff740f));
            }

            // Default day: just text
            return Center(
              child: Text(
                '${day.day}',
                style: dayStyle,
              ),
            );
          },

          // Builder specifically for today's date
          todayBuilder: (context, day, focusedDay) {
            final isBooked = _isBooked(day);

            if (isBooked) {
              return _buildTodayBookedDay(day);
            } else {
              return _buildFixedCircle(day, const Color(0x88ff740f));
            }
          },
        ),
      ),
    );
  }

  /// Builds styling for past days (disabled state)
  Widget _buildPastDay(DateTime day) {
    return Center(
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  /// Builds a fixed circular background for days
  Widget _buildFixedCircle(DateTime day, Color color) {
    return Center(
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  /// Builds the visual representation for booked days with pulsing animation
  Widget _buildBookedDay(DateTime day) {
    return Center(
      child: ScaleTransition(
        scale: _pulseAnimation,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF00AA00),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00AA00).withOpacity(0.6),
                blurRadius: 12,
                spreadRadius: 2,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the visual representation for days that are both today and booked
  Widget _buildTodayBookedDay(DateTime day) {
    return Center(
      child: ScaleTransition(
        scale: _pulseAnimation,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0x88ff740f),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00AA00).withOpacity(0.6),
                blurRadius: 12,
                spreadRadius: 2,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the visual representation for selected booked days
  Widget _buildSelectedBookedDay(DateTime day) {
    return Center(
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00AA00).withOpacity(0.6),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: _orangeColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
