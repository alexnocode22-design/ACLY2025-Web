import '/flutter_flow/flutter_flow_util.dart';
import 'pop_up_slot_selection_widget.dart' show PopUpSlotSelectionWidget;
import 'package:flutter/material.dart';

class PopUpSlotSelectionModel
    extends FlutterFlowModel<PopUpSlotSelectionWidget> {
  ///  Local state fields for this component.

  List<int> trainingsSelected = [];
  void addToTrainingsSelected(int item) => trainingsSelected.add(item);
  void removeFromTrainingsSelected(int item) => trainingsSelected.remove(item);
  void removeAtIndexFromTrainingsSelected(int index) =>
      trainingsSelected.removeAt(index);
  void insertAtIndexInTrainingsSelected(int index, int item) =>
      trainingsSelected.insert(index, item);
  void updateTrainingsSelectedAtIndex(int index, Function(int) updateFn) =>
      trainingsSelected[index] = updateFn(trainingsSelected[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
