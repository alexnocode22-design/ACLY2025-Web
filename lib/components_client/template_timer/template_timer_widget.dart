import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'template_timer_model.dart';
export 'template_timer_model.dart';

class TemplateTimerWidget extends StatefulWidget {
  const TemplateTimerWidget({
    super.key,
    bool? start,
    required this.startStop,
  }) : this.start = start ?? false;

  final bool start;
  final Future Function()? startStop;

  @override
  State<TemplateTimerWidget> createState() => _TemplateTimerWidgetState();
}

class _TemplateTimerWidgetState extends State<TemplateTimerWidget> {
  late TemplateTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemplateTimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.start == true) {
        _model.timerController.onStartTimer();
      } else {
        _model.timerController.onStopTimer();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowTimer(
      initialTime: _model.timerInitialTimeMs,
      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
        value,
        hours: false,
        milliSecond: false,
      ),
      controller: _model.timerController,
      updateStateInterval: Duration(milliseconds: 1000),
      onChanged: (value, displayTime, shouldUpdate) {
        _model.timerMilliseconds = value;
        _model.timerValue = displayTime;
        if (shouldUpdate) safeSetState(() {});
      },
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).headlineSmall.override(
            font: GoogleFonts.inter(
              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
            ),
            color: Color(0xFF7B43CE),
            fontSize: 36.0,
            letterSpacing: 0.0,
            fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
          ),
    );
  }
}
