import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:flutter/material.dart';

class EmptyView {

  static Widget zero(){
    return EmptyView.empty(0, 0);
  }


  static Widget colored(double width, double height, Color backgroundColor  ) {
    var childEmpty = EmptyView.empty(width, height);
    return Container( width:  width, height: height, color: backgroundColor , child: childEmpty );
  }


  static Widget empty (double width, double height) {
    return Placeholder(strokeWidth: 0, color: Colors.transparent , fallbackWidth: width, fallbackHeight: height);
  }


  static Widget allDeviceScreen ( BuildContext context, {Color? color }) {
    color ??= Colors.transparent;
    return colored( DeviceTools.getWidth(context), DeviceTools.getHeight(context), color );
  }


  static Widget allDeviceWidth (BuildContext context, {Color? color }) {
    color ??= Colors.transparent;
    return colored( DeviceTools.getWidth(context), 0 , color);
  }

  static Widget allDeviceHeight (BuildContext context, {Color? color }) {
    color ??= Colors.transparent;
    return colored( 0, DeviceTools.getHeight(context) , color);
  }


  static Widget test (double width, double height) {
    return Placeholder(strokeWidth: 0, color: Colors.red , fallbackWidth: width, fallbackHeight: height);
  }



}