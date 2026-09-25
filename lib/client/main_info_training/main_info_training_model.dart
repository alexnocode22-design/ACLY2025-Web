import '/backend/supabase/supabase.dart';
import '/components_client/tap_bar_client_main_train/tap_bar_client_main_train_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_info_training_widget.dart' show MainInfoTrainingWidget;
import 'package:flutter/material.dart';

class MainInfoTrainingModel extends FlutterFlowModel<MainInfoTrainingWidget> {
  ///  Local state fields for this page.

  bool descriptionReview = true;

  bool allReviews = false;

  bool reviewExists = false;

  List<FavouriteTrainingsRow> trainingFavourites = [];
  void addToTrainingFavourites(FavouriteTrainingsRow item) =>
      trainingFavourites.add(item);
  void removeFromTrainingFavourites(FavouriteTrainingsRow item) =>
      trainingFavourites.remove(item);
  void removeAtIndexFromTrainingFavourites(int index) =>
      trainingFavourites.removeAt(index);
  void insertAtIndexInTrainingFavourites(
          int index, FavouriteTrainingsRow item) =>
      trainingFavourites.insert(index, item);
  void updateTrainingFavouritesAtIndex(
          int index, Function(FavouriteTrainingsRow) updateFn) =>
      trainingFavourites[index] = updateFn(trainingFavourites[index]);

  int count = 0;

  String? sessionId;

  int? trainingDetails;

  List<TrainingSlotsRow> availableSlotsRaw = [];
  void addToAvailableSlotsRaw(TrainingSlotsRow item) =>
      availableSlotsRaw.add(item);
  void removeFromAvailableSlotsRaw(TrainingSlotsRow item) =>
      availableSlotsRaw.remove(item);
  void removeAtIndexFromAvailableSlotsRaw(int index) =>
      availableSlotsRaw.removeAt(index);
  void insertAtIndexInAvailableSlotsRaw(int index, TrainingSlotsRow item) =>
      availableSlotsRaw.insert(index, item);
  void updateAvailableSlotsRawAtIndex(
          int index, Function(TrainingSlotsRow) updateFn) =>
      availableSlotsRaw[index] = updateFn(availableSlotsRaw[index]);

  dynamic availableSlotsFormatted;

  List<TrainingSlotsRow> availableSlotsGrouped = [];
  void addToAvailableSlotsGrouped(TrainingSlotsRow item) =>
      availableSlotsGrouped.add(item);
  void removeFromAvailableSlotsGrouped(TrainingSlotsRow item) =>
      availableSlotsGrouped.remove(item);
  void removeAtIndexFromAvailableSlotsGrouped(int index) =>
      availableSlotsGrouped.removeAt(index);
  void insertAtIndexInAvailableSlotsGrouped(int index, TrainingSlotsRow item) =>
      availableSlotsGrouped.insert(index, item);
  void updateAvailableSlotsGroupedAtIndex(
          int index, Function(TrainingSlotsRow) updateFn) =>
      availableSlotsGrouped[index] = updateFn(availableSlotsGrouped[index]);

  List<TrainingsBookedTempRow> tempBookings = [];
  void addToTempBookings(TrainingsBookedTempRow item) => tempBookings.add(item);
  void removeFromTempBookings(TrainingsBookedTempRow item) =>
      tempBookings.remove(item);
  void removeAtIndexFromTempBookings(int index) => tempBookings.removeAt(index);
  void insertAtIndexInTempBookings(int index, TrainingsBookedTempRow item) =>
      tempBookings.insert(index, item);
  void updateTempBookingsAtIndex(
          int index, Function(TrainingsBookedTempRow) updateFn) =>
      tempBookings[index] = updateFn(tempBookings[index]);

  int? totalSelected = 0;

  List<TrainingsBookedTempRow> selectedSlotsList = [];
  void addToSelectedSlotsList(TrainingsBookedTempRow item) =>
      selectedSlotsList.add(item);
  void removeFromSelectedSlotsList(TrainingsBookedTempRow item) =>
      selectedSlotsList.remove(item);
  void removeAtIndexFromSelectedSlotsList(int index) =>
      selectedSlotsList.removeAt(index);
  void insertAtIndexInSelectedSlotsList(
          int index, TrainingsBookedTempRow item) =>
      selectedSlotsList.insert(index, item);
  void updateSelectedSlotsListAtIndex(
          int index, Function(TrainingsBookedTempRow) updateFn) =>
      selectedSlotsList[index] = updateFn(selectedSlotsList[index]);

  CombinedTrainingsViewRow? trainingViewRow;

  List<String> trainingPhotos = [];
  void addToTrainingPhotos(String item) => trainingPhotos.add(item);
  void removeFromTrainingPhotos(String item) => trainingPhotos.remove(item);
  void removeAtIndexFromTrainingPhotos(int index) =>
      trainingPhotos.removeAt(index);
  void insertAtIndexInTrainingPhotos(int index, String item) =>
      trainingPhotos.insert(index, item);
  void updateTrainingPhotosAtIndex(int index, Function(String) updateFn) =>
      trainingPhotos[index] = updateFn(trainingPhotos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTraining widget.
  List<CombinedTrainingsViewRow>? trainingViewRowQuery;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTraining widget.
  List<TrainingsMarketRow>? photoArrayQuery;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTraining widget.
  List<FavouriteTrainingsRow>? trainingsFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTraining widget.
  List<ReviewsRow>? reviewExist;
  // Stores action output result for [Custom Action - generateSessionId] action in MainInfoTraining widget.
  String? sessionID;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTraining widget.
  List<TrainingSlotsRow>? availableSlotsQuery;
  // Stores action output result for [Custom Action - formatSlotsForCalendar] action in MainInfoTraining widget.
  dynamic availableSlotsFormattedOUTPUT;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTraining widget.
  List<TrainingsBookedTempRow>? tempBookingsQuery;
  // Stores action output result for [Custom Action - removeBookedSlotsFromAvailableList] action in MainInfoTraining widget.
  List<TrainingSlotsRow>? filteredSlots;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingsRow? newFavoriteTrainingResult;
  // Stores action output result for [Backend Call - Query Rows] action in SelectSlotRow widget.
  List<TrainingSlotsRow>? availableSlotsQuery1;
  // Stores action output result for [Custom Action - formatSlotsForCalendar] action in SelectSlotRow widget.
  dynamic availableSlotsFormattedOUT1;
  // Stores action output result for [Backend Call - Query Rows] action in SelectSlotRow widget.
  List<TrainingsBookedTempRow>? tempBookingsQuery1;
  // Stores action output result for [Custom Action - removeBookedSlotsFromAvailableList] action in SelectSlotRow widget.
  List<TrainingSlotsRow>? filteredSlots1;
  // Stores action output result for [Backend Call - Query Rows] action in DeleteSlotButton widget.
  List<TrainingsBookedTempRow>? tempBookingsQueryDel;
  // Stores action output result for [Backend Call - Query Rows] action in BuyTraining widget.
  List<TrainingsBookedTempRow>? trainingsSelected;
  // Model for TapBarClientMainTrain component.
  late TapBarClientMainTrainModel tapBarClientMainTrainModel;

  @override
  void initState(BuildContext context) {
    tapBarClientMainTrainModel =
        createModel(context, () => TapBarClientMainTrainModel());
  }

  @override
  void dispose() {
    tapBarClientMainTrainModel.dispose();
  }
}
