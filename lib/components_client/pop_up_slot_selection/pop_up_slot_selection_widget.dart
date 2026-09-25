import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'pop_up_slot_selection_model.dart';
export 'pop_up_slot_selection_model.dart';

class PopUpSlotSelectionWidget extends StatefulWidget {
  const PopUpSlotSelectionWidget({
    super.key,
    required this.trainingId,
    this.availableSlots,
    required this.selectedSlots,
    required this.trainerId,
    required this.sessionId,
    required this.trainingName,
    required this.trainingPhoto1,
    required this.trainingPrice,
  });

  final int? trainingId;
  final dynamic availableSlots;
  final List<TrainingsBookedTempRow>? selectedSlots;
  final String? trainerId;
  final String? sessionId;
  final String? trainingName;
  final String? trainingPhoto1;
  final int? trainingPrice;

  @override
  State<PopUpSlotSelectionWidget> createState() =>
      _PopUpSlotSelectionWidgetState();
}

class _PopUpSlotSelectionWidgetState extends State<PopUpSlotSelectionWidget> {
  late PopUpSlotSelectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpSlotSelectionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: custom_widgets.PopUpSlotSelectionCalendar(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                availableSlots: widget.availableSlots!,
                selectedSlots: widget.selectedSlots,
                trainingId: widget.trainingId!,
                trainerId: widget.trainerId!,
                sessionId: widget.sessionId!,
                trainingName: widget.trainingName!,
                trainingPhoto1: widget.trainingPhoto1!,
                trainingPrice: widget.trainingPrice!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
