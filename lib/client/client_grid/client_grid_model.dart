import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_user_main/app_bar_user_main_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'client_grid_widget.dart' show ClientGridWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ClientGridModel extends FlutterFlowModel<ClientGridWidget> {
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

  int count2 = 0;

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

  int count3 = 0;

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

  int count4 = 0;

  bool isSearching = false;

  String? term = '*';

  int? limit;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ClientGrid widget.
  List<FavouriteTrainingsRow>? trainingsFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientGrid widget.
  List<FavouriteTrainingPlansRow>? trainingPlanFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientGrid widget.
  List<FavouriteNutritionplanRow>? nutritionPlanFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientGrid widget.
  List<FavouriteDigiptalroductRow>? digiprodFavouritesResult;
  // Model for AppBarUserMain component.
  late AppBarUserMainModel appBarUserMainModel;
  // State field(s) for SearchProducts widget.
  FocusNode? searchProductsFocusNode;
  TextEditingController? searchProductsTextController;
  String? Function(BuildContext, String?)?
      searchProductsTextControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingsRow? newFavoriteTrainingResult;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteNutritionplanRow? newFavouriteNutritionPlanResult;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingPlansRow? newFavouriteTrainingPlanResult;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteDigiptalroductRow? newFavouriteDigiProdResult;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;

  @override
  void initState(BuildContext context) {
    appBarUserMainModel = createModel(context, () => AppBarUserMainModel());
    tapBarClientModel = createModel(context, () => TapBarClientModel());
  }

  @override
  void dispose() {
    appBarUserMainModel.dispose();
    searchProductsFocusNode?.dispose();
    searchProductsTextController?.dispose();

    tapBarClientModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
