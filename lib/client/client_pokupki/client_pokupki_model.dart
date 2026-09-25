import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_user_pokupki/app_bar_user_pokupki_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_pokupki_widget.dart' show ClientPokupkiWidget;
import 'package:flutter/material.dart';

class ClientPokupkiModel extends FlutterFlowModel<ClientPokupkiWidget> {
  ///  Local state fields for this page.

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

  int count1 = 0;

  int count2 = 0;

  int count3 = 0;

  int count4 = 0;

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

  // Stores action output result for [Backend Call - Query Rows] action in ClientPokupki widget.
  List<FavouriteTrainingsRow>? trainingsFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientPokupki widget.
  List<FavouriteTrainingPlansRow>? trainingPlansFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientPokupki widget.
  List<FavouriteNutritionplanRow>? nutritionPlansFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientPokupki widget.
  List<FavouriteDigiptalroductRow>? digiprodFavouritesResult;
  // Model for AppBarUserPokupki component.
  late AppBarUserPokupkiModel appBarUserPokupkiModel;
  // Stores action output result for [Backend Call - Query Rows] action in TrainingContainer widget.
  List<TrainingsMarketRow>? trainingExistsQuery;
  // Stores action output result for [Backend Call - Query Rows] action in TrainingContainer widget.
  List<TrainerProfileRow>? trainerActive;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingsRow? newFavoriteTrainingResult;
  // Stores action output result for [Backend Call - Query Rows] action in TrainingPlansContainer widget.
  List<TrainingPlanMarketRow>? trainingPlanExists;
  // Stores action output result for [Backend Call - Query Rows] action in TrainingPlansContainer widget.
  List<TrainerProfileRow>? trainerTrainingPlanActive;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingPlansRow? newFavoriteTrainingPlanResult;
  // Stores action output result for [Backend Call - Query Rows] action in NutritionPlansContainer widget.
  List<NutritionPlanMarketRow>? nutritionPlanExists;
  // Stores action output result for [Backend Call - Query Rows] action in NutritionPlansContainer widget.
  List<TrainerProfileRow>? trainerNutrPlanActive;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteNutritionplanRow? newFavoriteNutritionPlangResult;
  // Stores action output result for [Backend Call - Query Rows] action in DigiprodContainer widget.
  List<DigitalProductMarketRow>? digiProdExists;
  // Stores action output result for [Backend Call - Query Rows] action in DigiprodContainer widget.
  List<TrainerProfileRow>? digiProdTrainerActive;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteDigiptalroductRow? newDigiProdResult;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarUserPokupkiModel =
        createModel(context, () => AppBarUserPokupkiModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarUserPokupkiModel.dispose();
    tapBarClientModel.dispose();
  }
}
