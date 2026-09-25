import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_user_favuorites/app_bar_user_favuorites_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_favourites_widget.dart' show ClientFavouritesWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ClientFavouritesModel extends FlutterFlowModel<ClientFavouritesWidget> {
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

  int countTrainFav = 0;

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

  int countTrainPlanFav = 0;

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

  int countNutrPlanFav = 0;

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

  int countDigiProdFav = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ClientFavourites widget.
  List<FavouriteTrainingsRow>? trainingFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientFavourites widget.
  List<FavouriteTrainingPlansRow>? trainingPlanFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientFavourites widget.
  List<FavouriteNutritionplanRow>? nutritionPlanFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientFavourites widget.
  List<FavouriteDigiptalroductRow>? digiprodFavouritesResult;
  // Model for AppBarUserFavuorites component.
  late AppBarUserFavuoritesModel appBarUserFavuoritesModel;
  Completer<List<FavouriteTrainingsRow>>? requestCompleter4;
  Completer<List<FavouriteTrainingPlansRow>>? requestCompleter3;
  Completer<List<FavouriteNutritionplanRow>>? requestCompleter1;
  Completer<List<FavouriteDigiptalroductRow>>? requestCompleter2;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarUserFavuoritesModel =
        createModel(context, () => AppBarUserFavuoritesModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarUserFavuoritesModel.dispose();
    tapBarClientModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
