import 'package:fastor_app_ui_widget/core/navigate/RouterAdmin.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'page_selection_state.dart';

class PageSelectionDashboardHalfHalfShapeCubit extends Cubit<PageSelectionState> {


  ///------------------------------------------------------------ variable

  int indexPage = 0;
  List<Widget> pages = [];

  ///------------------------------------------------------------ constructor

  PageSelectionDashboardHalfHalfShapeCubit() : super(  PageSelectionInitState());


  static PageSelectionDashboardHalfHalfShapeCubit get(BuildContext context ) {
    return BlocProvider.of<PageSelectionDashboardHalfHalfShapeCubit>(context);
  }

  ///------------------------------------------------------------ update index page

  /**
   * used when you navigate to another menu tab page
   */
  void resetPages(){
    indexPage = 0;
    Log.i("PageSelectionDashboardHalfHalfShapeCubit - resetPages()");
    emit( PageSelectionInitState());
  }


  /// Update the currently selected page index.
  void updatePageSelectedState(int indexNew) {
    indexPage = indexNew;
    fixDecrementOrIncrementIssues();
    // Log.i("updatePageSelectedState() - indexNew: $indexNew /fianl indexPage: $indexPage ");
    emit( UpdatePageSelectionState(indexPage));
  }


  showNextPage() {
    indexPage++;
    updatePageSelectedState(indexPage);
  }


  showPreviousPage() {
      indexPage--;
      updatePageSelectedState(indexPage);
  }


  fixDecrementOrIncrementIssues(){
    if (indexPage < 0) indexPage = 0;
    if( indexPage >= pages.length ) indexPage = pages.length - 1;
  }

  ///------------------------------------------------------------------- handle pages   data

  initPagesWidget() {
    pages = [];
  }

  addPageWidget(Widget pageNew){
    pages.add( pageNew);
  }


  ///------------------------------------------------------------------- checker pages


  bool isFirstPageViewedOnly(BuildContext context) {
    return indexPage == 0 && DeviceTools.isPortraitNotSemiBox(context);
  }

  bool isShapeHalfHalf(BuildContext context) {
    return  DeviceTools.isLandscapeNotSemiBox(context);
  }

  bool isFirstPageViewed(BuildContext context) {
    return  indexPage == 0;
  }

  ///------------------------------------------------------------------- actions

  onBackClicked(BuildContext context){
    /// case: half/half
    if (DeviceTools.isLandscapeNotSemiBox(context)) {
      Log.i("ResponsiveHalfFormHalfListAdminPanel - onPopInvoked() - case isLandscape ");
      // Navigator.pop(context);
      RouterAdmin.homeDashboard(context);
      return;
    }

    /// case : show only first page
    if (  isFirstPageViewed(context) ) {
      Log.i("ResponsiveHalfFormHalfListAdminPanel - onPopInvoked() - case isFirstPageViewed ");
      // Navigator.pop(context);
      RouterAdmin.homeDashboard(context);
      return;
    }

    /// case : show second or more page
    // bool isSecondOrMorePageViewed = indexPage >= 1;
    Log.i("ResponsiveHalfFormHalfListAdminPanel - onPopInvoked() - case isSecondOrMorePageViewed ");
    showPreviousPage();
  }


}