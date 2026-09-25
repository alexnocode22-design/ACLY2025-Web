import '/backend/supabase/supabase.dart';
import '/components_client/app_bar_main_draft_info/app_bar_main_draft_info_widget.dart';
import '/components_client/tap_bar_client/tap_bar_client_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_info_digital_product_widget.dart'
    show MainInfoDigitalProductWidget;
import 'package:flutter/material.dart';

class MainInfoDigitalProductModel
    extends FlutterFlowModel<MainInfoDigitalProductWidget> {
  ///  Local state fields for this page.

  bool descriptionReview = true;

  bool allReviews = false;

  bool reviewExists = false;

  List<FavouriteDigiptalroductRow> digiprodFavourites = [];
  void addToDigiprodFavourites(FavouriteDigiptalroductRow item) =>
      digiprodFavourites.add(item);
  void removeFromDigiprodFavourites(FavouriteDigiptalroductRow item) =>
      digiprodFavourites.remove(item);
  void removeAtIndexFromDigiprodFavourites(int index) =>
      digiprodFavourites.removeAt(index);
  void insertAtIndexInDigiprodFavourites(
          int index, FavouriteDigiptalroductRow item) =>
      digiprodFavourites.insert(index, item);
  void updateDigiprodFavouritesAtIndex(
          int index, Function(FavouriteDigiptalroductRow) updateFn) =>
      digiprodFavourites[index] = updateFn(digiprodFavourites[index]);

  int count = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in MainInfoDigitalProduct widget.
  List<FavouriteDigiptalroductRow>? digiprodFavouritesResult;
  // Stores action output result for [Backend Call - Query Rows] action in MainInfoDigitalProduct widget.
  List<ReviewsRow>? reviewExist;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Insert Row] action in Image widget.
  FavouriteDigiptalroductRow? newDigiprodFavoriteResult;
  // Model for TapBarClient component.
  late TapBarClientModel tapBarClientModel;
  // Model for AppBarMainDraftInfo component.
  late AppBarMainDraftInfoModel appBarMainDraftInfoModel;

  @override
  void initState(BuildContext context) {
    tapBarClientModel = createModel(context, () => TapBarClientModel());
    appBarMainDraftInfoModel =
        createModel(context, () => AppBarMainDraftInfoModel());
  }

  @override
  void dispose() {
    tapBarClientModel.dispose();
    appBarMainDraftInfoModel.dispose();
  }
}
