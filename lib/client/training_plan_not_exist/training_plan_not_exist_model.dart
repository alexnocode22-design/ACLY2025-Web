import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_main_draft_info/app_bar_main_draft_info_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_plan_not_exist_widget.dart' show TrainingPlanNotExistWidget;
import 'package:flutter/material.dart';

class TrainingPlanNotExistModel
    extends FlutterFlowModel<TrainingPlanNotExistWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in TrainingPlanNotExist widget.
  List<FavouriteTrainingsRow>? trainingsFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in TrainingPlanNotExist widget.
  List<ReviewsRow>? reviewExist;
  // Model for AppBarMainDraftInfo component.
  late AppBarMainDraftInfoModel appBarMainDraftInfoModel;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarMainDraftInfoModel =
        createModel(context, () => AppBarMainDraftInfoModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarMainDraftInfoModel.dispose();
    tapBarClientModel.dispose();
  }
}
