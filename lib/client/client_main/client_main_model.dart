import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_user_main/app_bar_user_main_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'client_main_widget.dart' show ClientMainWidget;
import 'package:flutter/material.dart';

class ClientMainModel extends FlutterFlowModel<ClientMainWidget> {
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

  int count = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ClientMain widget.
  List<UserProfileRow>? userQuery;
  // Stores action output result for [Backend Call - Query Rows] action in ClientMain widget.
  List<FavouriteTrainingsRow>? trainingsFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in ClientMain widget.
  List<ChatMessagesRow>? checkUnreadMessages;
  // Model for AppBarUserMain component.
  late AppBarUserMainModel appBarUserMainModel;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteTrainingsRow? newFavoriteTrainingResult;
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
    tapBarClientModel.dispose();
  }
}
