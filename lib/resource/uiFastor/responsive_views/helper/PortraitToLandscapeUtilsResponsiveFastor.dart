
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';

import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:flutter/material.dart';

import 'ResponsiveFastorConstant.dart';

/**
 Here the defaule page type is "portrait", what to do when responsive to landscape
 */
class PortraitToLandscapeUtilsResponsiveFastor {



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
      listView =  ListViewTemplate.t(context: context, children: children, axis: Axis.vertical);
    } else {
      listView =  ListViewTemplate.t(context: context, children: children, axis: Axis.horizontal);
    }

    if( isPutInsideScrollbar ) {
      return SingleChildScrollView( child: listView, );
    }
    return listView;
  }


}