import 'package:fastor_app_ui_widget/resource/template/TabBar/simple/TabBarFastor.dart';
import 'package:flutter/material.dart';

extension TabBarController on TabBarFastorState {

  Color getColorBySelectedStatus(int positionOfCurrentItem){
    if( selectedIndex ==  positionOfCurrentItem) {
      return widget.indicatorColor;
    } else {
      return widget.unselectedLabelColor;
    }
  }

}