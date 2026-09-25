import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_main_draft_full_profile/app_bar_main_draft_full_profile_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_coach_full_profile_widget.dart'
    show ClientCoachFullProfileWidget;
import 'package:flutter/material.dart';

class ClientCoachFullProfileModel
    extends FlutterFlowModel<ClientCoachFullProfileWidget> {
  ///  Local state fields for this page.

  bool allReviews = false;

  List<FavouriteTrainingsRow> trainingsFavourites = [];
  void addToTrainingsFavourites(FavouriteTrainingsRow item) =>
      trainingsFavourites.add(item);
  void removeFromTrainingsFavourites(FavouriteTrainingsRow item) =>
      trainingsFavourites.remove(item);
  void removeAtIndexFromTrainingsFavourites(int index) =>
      trainingsFavourites.removeAt(index);
  void insertAtIndexInTrainingsFavourites(
          int index, FavouriteTrainingsRow item) =>
      trainingsFavourites.insert(index, item);
  void updateTrainingsFavouritesAtIndex(
          int index, Function(FavouriteTrainingsRow) updateFn) =>
      trainingsFavourites[index] = updateFn(trainingsFavourites[index]);

  /// TrainingFavourites
  int count1 = 0;

  bool nolReviews = false;

  List<FavouriteTrainingPlansRow> trainingPlansFavourites = [];
  void addToTrainingPlansFavourites(FavouriteTrainingPlansRow item) =>
      trainingPlansFavourites.add(item);
  void removeFromTrainingPlansFavourites(FavouriteTrainingPlansRow item) =>
      trainingPlansFavourites.remove(item);
  void removeAtIndexFromTrainingPlansFavourites(int index) =>
      trainingPlansFavourites.removeAt(index);
  void insertAtIndexInTrainingPlansFavourites(
          int index, FavouriteTrainingPlansRow item) =>
      trainingPlansFavourites.insert(index, item);
  void updateTrainingPlansFavouritesAtIndex(
          int index, Function(FavouriteTrainingPlansRow) updateFn) =>
      trainingPlansFavourites[index] = updateFn(trainingPlansFavourites[index]);

  /// TrainingPlanFavourites
  int count2 = 0;

  /// NutritionPlanFavourites
  int count3 = 0;

  /// DigiProdFavourites
  int count4 = 0;

  List<FavouriteNutritionplanRow> nutritionPlansFavourites = [];
  void addToNutritionPlansFavourites(FavouriteNutritionplanRow item) =>
      nutritionPlansFavourites.add(item);
  void removeFromNutritionPlansFavourites(FavouriteNutritionplanRow item) =>
      nutritionPlansFavourites.remove(item);
  void removeAtIndexFromNutritionPlansFavourites(int index) =>
      nutritionPlansFavourites.removeAt(index);
  void insertAtIndexInNutritionPlansFavourites(
          int index, FavouriteNutritionplanRow item) =>
      nutritionPlansFavourites.insert(index, item);
  void updateNutritionPlansFavouritesAtIndex(
          int index, Function(FavouriteNutritionplanRow) updateFn) =>
      nutritionPlansFavourites[index] =
          updateFn(nutritionPlansFavourites[index]);

  List<FavouriteDigiptalroductRow> digiProdFavourites = [];
  void addToDigiProdFavourites(FavouriteDigiptalroductRow item) =>
      digiProdFavourites.add(item);
  void removeFromDigiProdFavourites(FavouriteDigiptalroductRow item) =>
      digiProdFavourites.remove(item);
  void removeAtIndexFromDigiProdFavourites(int index) =>
      digiProdFavourites.removeAt(index);
  void insertAtIndexInDigiProdFavourites(
          int index, FavouriteDigiptalroductRow item) =>
      digiProdFavourites.insert(index, item);
  void updateDigiProdFavouritesAtIndex(
          int index, Function(FavouriteDigiptalroductRow) updateFn) =>
      digiProdFavourites[index] = updateFn(digiProdFavourites[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ClientCoachFullProfile widget.
  List<TrainingsMarketRow>? queryTrainingsResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientCoachFullProfile widget.
  List<FavouriteTrainingsRow>? trainingFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientCoachFullProfile widget.
  List<FavouriteTrainingPlansRow>? trainingPlanFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientCoachFullProfile widget.
  List<FavouriteNutritionplanRow>? nutritionPlanFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientCoachFullProfile widget.
  List<FavouriteDigiptalroductRow>? digiprodFavouritesResult;
  // Model for AppBarMainDraftFullProfile component.
  late AppBarMainDraftFullProfileModel appBarMainDraftFullProfileModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Query Rows] action in MessageToTrainer widget.
  List<ChatsRow>? chatWithTrainerExist;
  // Stores action output result for [Backend Call - Insert Row] action in MessageToTrainer widget.
  ChatsRow? chatWithTrainerCreated;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingsRow? newFavoriteTrainingResult;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingPlansRow? newFavoriteTrainingPlanResult;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteNutritionplanRow? newFavoriteNutritionPlanResult;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteDigiptalroductRow? newFavoriteDigiProdResult;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarMainDraftFullProfileModel =
        createModel(context, () => AppBarMainDraftFullProfileModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarMainDraftFullProfileModel.dispose();
    tapBarClientModel.dispose();
  }
}
