import 'package:fastor_app_ui_widget/customWidget/TabBar/simple/TabBarFastor.dart';
import 'package:flutter/material.dart';

extension TabBarController on TabBarFastorState {

  Color getColorBySelectedStatus(int positionOfCurrentItem){
    if( selectedIndex ==  positionOfCurrentItem) {
      return widget.indicatorColor;
    } else {
      return widget.unselectedLabelColor;
    }
  }


  bool isSelectedIndex(int positionOfCurrentItem){
    return selectedIndex ==  positionOfCurrentItem;
  }



  Color getColorUnderline(int positionOfCurrentItem){
    if( selectedIndex ==  positionOfCurrentItem) {
      return widget.indicatorColor;
    } else if( widget.underlineShownBelowAllTabs! ){
      return widget.unselectedLabelColor;

    /// the default TabBar flutter sdk not show underline in case not selected
    } else {
      return Colors.transparent;
    }
  }


}