
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/listview/ListViewApp.dart';
import 'package:fastor_app_ui_widget/core/web/ResponsiveConstant.dart';
import 'package:flutter/material.dart';
/**
 Here the defaule page type is "portrait", what to do when responsive to landscape
 */
class ResponsiveToLandscape {



  static double getDeviceWidthInCaseLandscape(BuildContext context){
    if( DeviceTools.isLandscape(context) ) {
      return ResponsiveConstant.widthChangeInCaseLandscape;
    }
    return DeviceTools.getWidth( context );
  }


  static double getDeviceHeightInCaseLandscape(BuildContext context){
    if( DeviceTools.isLandscape(context) ) {
      return ResponsiveConstant.heightChangeInCaseLandscape;
    }
    return DeviceTools.getHeight( context );
  }


  /**
      - rule:
      +portrait:
      child1,
      child2
      +landscape:
      child1, child2

   - pages:
      "PaginateWidget" in page type "Portrait" make the direction of axis is vertical,
      while in page type is "Landscape"  make the direction of axis is vertical.

   */
  static portraitVertical_to_landscapeHorizontal(BuildContext context, {
    List<Widget> children = const <Widget>[]
  }) {
      if( DeviceTools.isPortrait( context) ) {
        return ListViewApp.t(context: context, children: children, axis: Axis.vertical);
      } else {
        return ListViewApp.t(context: context, children: children, axis: Axis.horizontal);
      }
  }


}