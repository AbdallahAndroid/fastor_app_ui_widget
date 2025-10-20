

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/listview/ListViewApp.dart';
import 'package:flutter/material.dart';

/**
 Here the defaule scaffold type is "portrait", what to do when responsive to landscape
 */
class PortraitToLandscapeUtilsResponsiveApp {



  ///  - rule:
  ///  +portrait:
  ///   child1,
  ///   child2
  ///   +landscape:
  ///   child1, child2
  /// - pages:
  ///    "PaginateWidget" in scaffold type "Portrait" make the direction of axis is vertical,
  ///   while in scaffold type is "Landscape"  make the direction of axis is vertical.
  static convertChildrenFromPortraitVerticalToBeLandscapeHorizontal(
      {required BuildContext context,
        required  List<Widget> children,
        required bool isPutInsideScrollbar
      }) {
    var listView = null;

    if( DeviceTools.isPortrait( context) ) {
      listView =  ListViewApp.t(context: context, children: children, axis: Axis.vertical);
    } else {
      listView =  ListViewApp.t(context: context, children: children, axis: Axis.horizontal);
    }

    if( isPutInsideScrollbar ) {
      return SingleChildScrollView( child: listView, );
    }
    return listView;
  }


}