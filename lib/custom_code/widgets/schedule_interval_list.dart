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

import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;

const int _moscowOffsetHours = 3;

/// Convert Moscow HH:MM → UTC timetz string stored in DB.
/// Handles negative UTC (e.g. MSK 01:00 → UTC 22:00): wraps with +24.
String _moscowToUtcString(int moscowH, int moscowM) {
  int utcH = moscowH - _moscowOffsetHours;
  if (utcH < 0) utcH += 24;
  return '${utcH.toString().padLeft(2, '0')}:${moscowM.toString().padLeft(2, '0')}:00+00';
}

/// Convert UTC timetz string → [moscowHour, moscowMinute].
/// Returns [8, 0] on parse failure.
List<int> _utcStringToMoscow(String? utcStr) {
  if (utcStr == null || utcStr.isEmpty) return [8, 0];
  final clean =
      utcStr.contains('+') ? utcStr.substring(0, utcStr.indexOf('+')) : utcStr;
  final parts = clean.split(':');
  final utcH = int.tryParse(parts[0]) ?? 0;
  final utcM = parts.length > 1 ? (int.tryParse(parts[1]) ?? 0) : 0;
  int moscowH = utcH + _moscowOffsetHours;
  if (moscowH >= 24) moscowH -= 24;
  return [moscowH, utcM];
}

class ScheduleIntervalList extends StatefulWidget {
  const ScheduleIntervalList({
    Key? key,
    this.width,
    this.height,
    required this.trainerId,
    required this.trainingId,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String trainerId;
  final int trainingId;

  @override
  State<ScheduleIntervalList> createState() => _ScheduleIntervalListState();
}

class _ScheduleIntervalListState extends State<ScheduleIntervalList> {
  bool loading = true;
  Map<String, List<dynamic>> grouped = {};
  int slotDuration = 30;

  static const Map<String, String> ruToEn = {
    'Понедельник': 'Monday',
    'Вторник': 'Tuesday',
    'Среда': 'Wednesday',
    'Четверг': 'Thursday',
    'Пятница': 'Friday',
    'Суббота': 'Saturday',
    'Воскресенье': 'Sunday',
  };

  static const Map<String, String> enToRu = {
    'Monday': 'Понедельник',
    'Tuesday': 'Вторник',
    'Wednesday': 'Среда',
    'Thursday': 'Четверг',
    'Friday': 'Пятница',
    'Saturday': 'Суббота',
    'Sunday': 'Воскресенье',
  };

  static const List<String> ruDays = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];

  // ─── Supabase helpers ──────────────────────────────────────────────────────

  Future<List<dynamic>> _fetchIntervals() async {
    final data = await SupaFlow.client
        .from('trainer_schedule_intervals')
        .select()
        .eq('trainer_id', widget.trainerId)
        .eq('training_id', widget.trainingId)
        .order('day_of_week')
        .order('interval_number');
    return data as List<dynamic>;
  }

  Future<bool> _saveInterval({
    required String dayOfWeek,
    required int intervalNumber,
    required String startTime,
    required String endTime,
    required bool enabled,
  }) async {
    try {
      await SupaFlow.client.from('trainer_schedule_intervals').insert({
        'trainer_id': widget.trainerId,
        'training_id': widget.trainingId,
        'day_of_week': dayOfWeek,
        'interval_number': intervalNumber,
        'start_time': startTime,
        'end_time': endTime,
        'enabled': enabled,
      });
      return true;
    } catch (e) {
      if (kDebugMode) print('❌ _saveInterval error: $e');
      _showError(_friendlyError(e.toString()));
      return false;
    }
  }

  Future<bool> _deleteInterval({
    required String dayOfWeek,
    required int intervalNumber,
  }) async {
    try {
      await SupaFlow.client
          .from('trainer_schedule_intervals')
          .delete()
          .eq('trainer_id', widget.trainerId)
          .eq('training_id', widget.trainingId)
          .eq('day_of_week', dayOfWeek)
          .eq('interval_number', intervalNumber);
      return true;
    } catch (e) {
      if (kDebugMode) print('❌ _deleteInterval error: $e');
      _showError(_friendlyError(e.toString()));
      return false;
    }
  }

  Future<bool> _toggleInterval({
    required String dayOfWeek,
    required int intervalNumber,
    required bool newEnabled,
  }) async {
    // Client-side overlap check before hitting DB
    if (newEnabled) {
      final conflict = _findOverlap(dayOfWeek, intervalNumber);
      if (conflict != null) {
        _showError(
          'Пересечение с интервалом #${conflict['interval_number']} '
          '(${_fmtMoscow(conflict['start_time'])}–${_fmtMoscowEnd(conflict['start_time'], slotDuration)}). '
          'Сначала отключите его.',
        );
        return false;
      }
    }

    try {
      await SupaFlow.client
          .from('trainer_schedule_intervals')
          .update({'enabled': newEnabled})
          .eq('trainer_id', widget.trainerId)
          .eq('training_id', widget.trainingId)
          .eq('day_of_week', dayOfWeek)
          .eq('interval_number', intervalNumber);
      return true;
    } catch (e) {
      if (kDebugMode) print('❌ _toggleInterval error: $e');
      _showError(_friendlyError(e.toString()));
      return false;
    }
  }

  Future<bool> _updateIntervalTime({
    required String dayOfWeek,
    required int intervalNumber,
    required String startTime,
    required String endTime,
  }) async {
    try {
      await SupaFlow.client
          .from('trainer_schedule_intervals')
          .update({'start_time': startTime, 'end_time': endTime})
          .eq('trainer_id', widget.trainerId)
          .eq('training_id', widget.trainingId)
          .eq('day_of_week', dayOfWeek)
          .eq('interval_number', intervalNumber);
      return true;
    } catch (e) {
      if (kDebugMode) print('❌ _updateIntervalTime error: $e');
      _showError(_friendlyError(e.toString()));
      return false;
    }
  }

  Future<void> _regenerateSlots() async {
    try {
      await SupaFlow.client.rpc('regenerate_slots_for_training', params: {
        'p_trainer_id': widget.trainerId,
        'p_training_id': widget.trainingId,
      });
      if (kDebugMode) print('✅ Slots regenerated');
    } catch (e) {
      if (kDebugMode) print('⚠️ Slot regeneration failed (non-critical): $e');
    }
  }

  // ─── overlap detection ─────────────────────────────────────────────────────

  /// Returns the first currently-enabled interval that overlaps with the given
  /// one (identified by [enDay] + [intervalNumber]), or null if no conflict.
  /// Uses half-open interval logic on UTC timetz strings: [start, end) so
  /// contiguous slots are fine. UTC end is always > UTC start for ≤90 min slots.
  dynamic _findOverlap(String enDay, int intervalNumber) {
    final ruDay = enToRu[enDay] ?? enDay;
    final intervals = grouped[ruDay] ?? [];

    final target = intervals.firstWhere(
      (iv) => iv['interval_number'] == intervalNumber,
      orElse: () => null,
    );
    if (target == null) return null;

    final newStart = target['start_time'] as String? ?? '';
    final newEnd = target['end_time'] as String? ?? '';

    for (final iv in intervals) {
      if (iv['interval_number'] == intervalNumber) continue;
      if (iv['enabled'] != true) continue;

      final s = iv['start_time'] as String? ?? '';
      final e = iv['end_time'] as String? ?? '';

      // Half-open overlap: newStart < e AND newEnd > s
      if (newStart.compareTo(e) < 0 && newEnd.compareTo(s) > 0) {
        return iv;
      }
    }
    return null;
  }

  // ─── error helpers ─────────────────────────────────────────────────────────

  static String _friendlyError(String raw) {
    if (raw.contains('overlaps')) {
      return 'Интервал пересекается с уже активным. Отключите пересекающийся интервал сначала.';
    }
    if (raw.contains('unique') || raw.contains('duplicate')) {
      return 'Такой интервал уже существует.';
    }
    if (raw.contains('foreign key') || raw.contains('violates')) {
      return 'Ошибка целостности данных. Обновите страницу и попробуйте снова.';
    }
    if (raw.contains('timeout') || raw.contains('connection')) {
      return 'Нет соединения. Проверьте сеть и попробуйте снова.';
    }
    return 'Что-то пошло не так. Попробуйте ещё раз.';
  }

  // ─── init ──────────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  Future<void> _loadAll() async {
    try {
      final results = await Future.wait([
        _fetchIntervals(),
        getSlotDuration(widget.trainingId),
      ]);
      final data = results[0] as List<dynamic>;
      final duration = results[1] as int;
      setState(() {
        grouped = _groupAndSort(data);
        slotDuration = duration;
        loading = false;
      });
    } catch (e) {
      if (kDebugMode) print('❌ _loadAll error: $e');
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _loadIntervals() async {
    try {
      final data = await _fetchIntervals();
      setState(() {
        grouped = _groupAndSort(data);
      });
    } catch (e) {
      if (kDebugMode) print('❌ _loadIntervals error: $e');
    }
  }

  Map<String, List<dynamic>> _groupAndSort(List<dynamic> data) {
    final Map<String, List<dynamic>> g = {for (var d in ruDays) d: []};
    for (var iv in data) {
      final ruDay = enToRu[iv['day_of_week']] ?? iv['day_of_week'];
      g[ruDay]?.add(iv);
    }
    for (var list in g.values) {
      list.sort(
          (a, b) => (a['start_time'] ?? '').compareTo(b['start_time'] ?? ''));
    }
    return g;
  }

  // ─── actions ───────────────────────────────────────────────────────────────

  Future<void> _toggle(dynamic iv) async {
    final ok = await _toggleInterval(
      dayOfWeek: iv['day_of_week'],
      intervalNumber: iv['interval_number'],
      newEnabled: !(iv['enabled'] ?? false),
    );
    if (ok) {
      await _loadIntervals();
      _regenerateSlots();
    }
  }

  Future<void> _delete(dynamic iv) async {
    final yes = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Удалить интервал?', style: TextStyle(fontSize: 16)),
        content: Text(
          '${_fmtMoscow(iv['start_time'])} – ${_fmtMoscowEnd(iv['start_time'], slotDuration)}',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Отмена', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Удалить',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
    if (yes != true) return;
    final ok = await _deleteInterval(
      dayOfWeek: iv['day_of_week'],
      intervalNumber: iv['interval_number'],
    );
    if (ok) {
      await _loadIntervals();
      _regenerateSlots();
    }
  }

  Future<void> _add(String ruDay) async {
    final enDay = ruToEn[ruDay]!;
    final existing = grouped[ruDay] ?? [];

    int nextNum = 1;
    for (var iv in existing) {
      final n = iv['interval_number'] as int;
      if (n >= nextNum) nextNum = n + 1;
    }

    // Suggest next start = end of last interval.
    // Cap at the latest valid start for this slot duration (so end ≤ 00:00).
    // e.g. 30min slots → max 23:30; 60min → 23:00; 90min → 22:30.
    final maxStartMin = 1440 - slotDuration; // minutes since midnight
    int startH_moscow = 8;
    int startM_moscow = 0;
    if (existing.isNotEmpty) {
      final lastStartUtc =
          existing.last['start_time'] as String? ?? '05:00:00+00';
      final lastStartMoscow = _utcStringToMoscow(lastStartUtc);
      final lastEndMin =
          lastStartMoscow[0] * 60 + lastStartMoscow[1] + slotDuration;
      final clampedMin = lastEndMin.clamp(0, maxStartMin);
      startH_moscow = clampedMin ~/ 60;
      startM_moscow = clampedMin % 60;
    }

    final totalMinutes = startH_moscow * 60 + startM_moscow + slotDuration;
    // End is guaranteed ≤ 1440 (midnight) because start is clamped above.
    final endH_moscow = totalMinutes ~/ 60 < 24 ? totalMinutes ~/ 60 : 0;
    final endM_moscow = totalMinutes ~/ 60 < 24 ? totalMinutes % 60 : 0;

    final startTime = _moscowToUtcString(startH_moscow, startM_moscow);
    final endTime = _moscowToUtcString(endH_moscow, endM_moscow);

    if (kDebugMode) {
      print(
          '➕ _add: day=$enDay num=$nextNum moscow=${startH_moscow.toString().padLeft(2, '0')}:${startM_moscow.toString().padLeft(2, '0')} utc_stored=$startTime → endUTC=$endTime');
    }

    final ok = await _saveInterval(
      dayOfWeek: enDay,
      intervalNumber: nextNum,
      startTime: startTime,
      endTime: endTime,
      enabled: false,
    );
    if (ok) {
      await _loadIntervals();
      _regenerateSlots();
    }
  }

  Future<void> _setDuration(int newDuration) async {
    if (newDuration == slotDuration) return;
    final prev = slotDuration;
    setState(() {
      slotDuration = newDuration;
    });
    final ok = await updateSlotDuration(widget.trainingId, newDuration);
    if (!ok) {
      setState(() {
        slotDuration = prev;
      });
      _showError('Ошибка сохранения длительности слота.');
    } else {
      _regenerateSlots();
    }
  }

  Future<void> _updateTime(dynamic iv, String newStartMoscow) async {
    final parsed = _parseHHMM(newStartMoscow);
    final startH_moscow = parsed[0];
    final startM_moscow = parsed[1];

    // Block any start time that would push the end past midnight.
    // Max valid start depends on slot duration:
    //   30min → 23:30, 60min → 23:00, 90min → 22:30
    final totalMin = startH_moscow * 60 + startM_moscow + slotDuration;
    if (totalMin > 1440) {
      final maxMin = 1440 - slotDuration;
      final maxH = maxMin ~/ 60;
      final maxM = maxMin % 60;
      _showError(
        'Слот выходит за полночь. При длительности $slotDuration мин '
        'выберите начало не позже ${maxH.toString().padLeft(2, '0')}:${maxM.toString().padLeft(2, '0')}.',
      );
      return;
    }

    final endH_moscow = totalMin ~/ 60 < 24 ? totalMin ~/ 60 : 0;
    final endM_moscow = totalMin ~/ 60 < 24 ? totalMin % 60 : 0;

    final formattedStart = _moscowToUtcString(startH_moscow, startM_moscow);
    final newEnd = _moscowToUtcString(endH_moscow, endM_moscow);

    if (kDebugMode) {
      print(
          '🕐 _updateTime: #${iv['interval_number']} moscow=${startH_moscow.toString().padLeft(2, '0')}:${startM_moscow.toString().padLeft(2, '0')} → utc_stored=$formattedStart endUTC=$newEnd');
    }

    final ok = await _updateIntervalTime(
      dayOfWeek: iv['day_of_week'],
      intervalNumber: iv['interval_number'],
      startTime: formattedStart,
      endTime: newEnd,
    );
    if (ok) {
      await _loadIntervals();
      _regenerateSlots();
    }
  }

  // ─── helpers ───────────────────────────────────────────────────────────────

  static List<int> _parseHHMM(String t) {
    final clean = t.contains('+') ? t.substring(0, t.indexOf('+')) : t;
    final parts = clean.split(':');
    return [
      int.tryParse(parts[0]) ?? 0,
      parts.length > 1 ? (int.tryParse(parts[1]) ?? 0) : 0,
    ];
  }

  static String _fmtMoscow(String? utcStr) {
    if (utcStr == null || utcStr.isEmpty) return '--:--';
    final moscow = _utcStringToMoscow(utcStr);
    return '${moscow[0].toString().padLeft(2, '0')}:${moscow[1].toString().padLeft(2, '0')}';
  }

  /// Format the END time in MSK, given start UTC string + duration in minutes.
  /// Clamps to 00:00 if the end would cross midnight (exact boundary allowed).
  static String _fmtMoscowEnd(String? startUtcStr, int durationMin) {
    if (startUtcStr == null || startUtcStr.isEmpty) return '--:--';
    final startMoscow = _utcStringToMoscow(startUtcStr);
    final totalMin = startMoscow[0] * 60 + startMoscow[1] + durationMin;
    if (totalMin >= 1440) return '00:00';
    final h = totalMin ~/ 60;
    final m = totalMin % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  static String _word(int n) {
    if (n % 10 == 1 && n % 100 != 11) return 'активный';
    if ([2, 3, 4].contains(n % 10) && ![12, 13, 14].contains(n % 100))
      return 'активных';
    return 'активных';
  }

  void _showError(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ),
    );
  }

  void _showWarning(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Color(0xFFFF740F),
        duration: Duration(seconds: 4),
      ),
    );
  }

  // ─── BUILD ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF740F)),
        ),
      );
    }

    return Container(
      color: Color(0xFFFFF9F5),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        itemCount: 8,
        itemBuilder: (_, i) {
          if (i == 0)
            return _DurationPicker(
              current: slotDuration,
              onSelect: _setDuration,
            );

          final ruDay = ruDays[i - 1];
          final intervals = grouped[ruDay] ?? [];
          final activeCount =
              intervals.where((iv) => iv['enabled'] == true).length;

          return Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 1,
              color: Color(0xFFFFF9F5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 12),
                  minTileHeight: 48,
                  title: Text(
                    ruDay,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF1A1A1A)),
                  ),
                  subtitle: Text(
                    '$activeCount ${_word(activeCount)}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 11),
                  ),
                  children: [
                    ...intervals.map((iv) {
                      final isOff = iv['enabled'] != true;
                      final hasConflict = isOff &&
                          _findOverlap(
                                iv['day_of_week'],
                                iv['interval_number'],
                              ) !=
                              null;
                      return _IntervalRow(
                        interval: iv,
                        slotDuration: slotDuration,
                        hasConflict: hasConflict,
                        onToggle: () => _toggle(iv),
                        onDelete: () => _delete(iv),
                        onTimeChange: (newStart) => _updateTime(iv, newStart),
                      );
                    }),
                    if (intervals.length < 10)
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 4, 10, 8),
                        child: SizedBox(
                          height: 28,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFFFF740F),
                                Color(0xFF7B43CE)
                              ]),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(6),
                                onTap: () => _add(ruDay),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add,
                                          color: Colors.white, size: 14),
                                      SizedBox(width: 4),
                                      Text('Добавить слот',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── DURATION PICKER ─────────────────────────────────────────────────────────

class _DurationPicker extends StatelessWidget {
  final int current;
  final Future<void> Function(int) onSelect;

  const _DurationPicker({
    required this.current,
    required this.onSelect,
  });

  static const List<int> options = [30, 60, 90];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6, 4, 6, 8),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 1,
        color: Color(0xFFFFF9F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Длительность слота',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF1A1A1A)),
              ),
              SizedBox(height: 8),
              Row(
                children: options.map((min) {
                  final selected = (current == min);
                  return Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: min == options.last ? 0 : 6),
                      child: SizedBox(
                        height: 28,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: selected
                                ? LinearGradient(colors: [
                                    Color(0xFFFF740F),
                                    Color(0xFF7B43CE)
                                  ])
                                : null,
                            color: selected ? null : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: selected
                                  ? Colors.transparent
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () => onSelect(min),
                              child: Center(
                                child: Text(
                                  '$min мин',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: selected
                                        ? Colors.white
                                        : Color(0xFF1A1A1A),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── INTERVAL ROW ────────────────────────────────────────────────────────────

class _IntervalRow extends StatelessWidget {
  final dynamic interval;
  final int slotDuration;
  final bool hasConflict;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final Future<void> Function(String) onTimeChange;

  const _IntervalRow({
    required this.interval,
    required this.slotDuration,
    this.hasConflict = false,
    required this.onToggle,
    required this.onDelete,
    required this.onTimeChange,
  });

  // Reuse the top-level helpers via static delegation
  static String _fmtMoscow(String? utcStr) =>
      _ScheduleIntervalListState._fmtMoscow(utcStr);

  static String _fmtEnd(String? startUtcStr, int dur) =>
      _ScheduleIntervalListState._fmtMoscowEnd(startUtcStr, dur);

  Future<void> _openTimePicker(BuildContext context) async {
    final rawUtc = interval['start_time'] as String? ?? '05:00:00+00';
    final moscow = _utcStringToMoscow(rawUtc);

    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: moscow[0], minute: moscow[1]),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (picked == null) return;

    final newStartMoscow =
        '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
    await onTimeChange(newStartMoscow);
  }

  @override
  Widget build(BuildContext context) {
    final enabled = interval['enabled'] ?? false;
    final num = interval['interval_number'];
    final start = _fmtMoscow(interval['start_time']);
    // Use _fmtEnd — clamps to 00:00 if end would cross midnight
    final end = _fmtEnd(interval['start_time'], slotDuration);

    return Container(
      height: 36,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        gradient: enabled
            ? LinearGradient(
                colors: [
                  Color(0xFFFF740F).withOpacity(0.08),
                  Color(0xFF7B43CE).withOpacity(0.08),
                ],
              )
            : null,
        color: enabled
            ? null
            : hasConflict
                ? Colors.orange.shade50
                : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: enabled
              ? Color(0xFFFF740F).withOpacity(0.4)
              : hasConflict
                  ? Colors.orange.shade300
                  : Colors.grey.shade300,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              InkWell(
                onTap: onToggle,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: enabled
                        ? LinearGradient(
                            colors: [Color(0xFFFF740F), Color(0xFF7B43CE)])
                        : null,
                    color: enabled ? null : Colors.grey.shade300,
                  ),
                  child: Icon(
                    enabled ? Icons.check : Icons.circle_outlined,
                    color: Colors.white,
                    size: 11,
                  ),
                ),
              ),
              SizedBox(width: 6),
              Text(
                '#$num',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Color(0xFF1A1A1A)),
              ),
              SizedBox(width: 6),
              Icon(Icons.access_time,
                  size: 10,
                  color: enabled ? Color(0xFFFF740F) : Colors.grey.shade400),
              SizedBox(width: 3),
              InkWell(
                onTap: () => _openTimePicker(context),
                child: Text(
                  '$start – $end',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF1A1A1A),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFF740F).withOpacity(0.5),
                  ),
                ),
              ),
              Spacer(),
              // Conflict warning icon — shown for OFF intervals that overlap
              // with an enabled one
              if (hasConflict && !enabled) ...[
                Tooltip(
                  message: 'Пересекается с активным интервалом',
                  child: Icon(
                    Icons.warning_amber_rounded,
                    size: 14,
                    color: Colors.orange.shade400,
                  ),
                ),
                SizedBox(width: 4),
              ],
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  gradient: enabled
                      ? LinearGradient(
                          colors: [Color(0xFFFF740F), Color(0xFF7B43CE)])
                      : null,
                  color: enabled ? null : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  enabled ? 'ON' : 'OFF',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 4),
              IconButton(
                icon: Icon(Icons.delete_outline, size: 16),
                color: Colors.red.shade400,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 24, minHeight: 24),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
