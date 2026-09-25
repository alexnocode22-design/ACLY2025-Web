import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_main_draft_info/app_bar_main_draft_info_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_info_nutrition_plan_widget.dart' show MainInfoNutritionPlanWidget;
import 'package:flutter/material.dart';

class MainInfoNutritionPlanModel
    extends FlutterFlowModel<MainInfoNutritionPlanWidget> {
  ///  Local state fields for this page.

  bool descriptionReview = true;

  bool allReviews = false;

  bool reviewExists = false;

  List<FavouriteNutritionplanRow> nutritionPlanFavourites = [];
  void addToNutritionPlanFavourites(FavouriteNutritionplanRow item) =>
      nutritionPlanFavourites.add(item);
  void removeFromNutritionPlanFavourites(FavouriteNutritionplanRow item) =>
      nutritionPlanFavourites.remove(item);
  void removeAtIndexFromNutritionPlanFavourites(int index) =>
      nutritionPlanFavourites.removeAt(index);
  void insertAtIndexInNutritionPlanFavourites(
          int index, FavouriteNutritionplanRow item) =>
      nutritionPlanFavourites.insert(index, item);
  void updateNutritionPlanFavouritesAtIndex(
          int index, Function(FavouriteNutritionplanRow) updateFn) =>
      nutritionPlanFavourites[index] = updateFn(nutritionPlanFavourites[index]);

  int count = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in MainInfoNutritionPlan widget.
  List<FavouriteNutritionplanRow>? nutritionPlanFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoNutritionPlan widget.
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
  FavouriteNutritionplanRow? newNutritionFavoritePlansResult;
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
