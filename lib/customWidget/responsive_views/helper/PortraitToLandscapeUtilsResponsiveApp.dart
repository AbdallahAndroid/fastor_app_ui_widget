

import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/listview/ListViewApp.dart';
import 'package:flutter/material.dart';

/**
 Here the defaule page type is "portrait", what to do when responsive to landscape
 */
class PortraitToLandscapeUtilsResponsiveApp {



  ///  - rule:
  ///  +portrait:
  ///   child1,
  ///   child2
  ///   +landscape:
  ///   child1, child2
  /// - pages:
  ///    "PaginateWidget" in page type "Portrait" make the direction of axis is vertical,
  ///   while in page type is "Landscape"  make the direction of axis is vertical.
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