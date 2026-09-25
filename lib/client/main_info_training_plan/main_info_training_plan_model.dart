import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_main_draft_info/app_bar_main_draft_info_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_info_training_plan_widget.dart' show MainInfoTrainingPlanWidget;
import 'package:flutter/material.dart';

class MainInfoTrainingPlanModel
    extends FlutterFlowModel<MainInfoTrainingPlanWidget> {
  ///  Local state fields for this page.

  bool descriptionReview = true;

  bool allReviews = false;

  bool reviewExists = false;

  List<FavouriteTrainingPlansRow> trainingPlanFavourites = [];
  void addToTrainingPlanFavourites(FavouriteTrainingPlansRow item) =>
      trainingPlanFavourites.add(item);
  void removeFromTrainingPlanFavourites(FavouriteTrainingPlansRow item) =>
      trainingPlanFavourites.remove(item);
  void removeAtIndexFromTrainingPlanFavourites(int index) =>
      trainingPlanFavourites.removeAt(index);
  void insertAtIndexInTrainingPlanFavourites(
          int index, FavouriteTrainingPlansRow item) =>
      trainingPlanFavourites.insert(index, item);
  void updateTrainingPlanFavouritesAtIndex(
          int index, Function(FavouriteTrainingPlansRow) updateFn) =>
      trainingPlanFavourites[index] = updateFn(trainingPlanFavourites[index]);

  int count = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTrainingPlan widget.
  List<FavouriteTrainingPlansRow>? trainingPlansFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoTrainingPlan widget.
  List<ReviewsRow>? reviewExist;
  // Model for AppBarMainDraftInfo component.
  late AppBarMainDraftInfoModel appBarMainDraftInfoModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingPlansRow? newFavoriteTrainingPlansResult;
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
