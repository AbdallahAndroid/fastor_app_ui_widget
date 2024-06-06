
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:flutter/cupertino.dart';

import 'ProjectFigmaScreenInitializer.dart';

double _currentDeviceWidth = 0;
double _currentDeviceHeight = 0;

/// Figma is symbole of ResponsiveFigmaProject
class Figma   {

  /**
      testClamp(){
      double h = 80;
      h.clamp(20, 90);
      }
   */

  /// the px width in flutter not same width number written in figma
  /// if you put the emulator beside figma, and make emulator same width of figma paper layout
  /// you will found that the width px pixel not same result
  static double pxWidth(double d ) {
    return d * 1.05;
  }


  /// the px height in flutter not same height number written in figma
  /// if you put the emulator beside figma, and make emulator same width of figma paper layout
  /// you will found that the height px pixel not same result
  static double pxHeight(double d ) {
    return d * 1.15;
  }


  /// the px width in flutter not same width number written in figma
  /// if you put the emulator beside figma, and make emulator same width of figma paper layout
  /// you will found that the width px pixel not same result
  static double pxText(double d ) {
    return d * 1.05;
  }

  /// w is symbole of width
  static double w(double figmaSize) {return  width(figmaSize); }


  /// h is symoble of height
  static double h(double figmaSize) {return  height(figmaSize); }

  /// pw is symoble of percentage width
  static double pw(double per) {return _currentDeviceWidth * (per/100); }

  /// ph is symoble of percentage height
  static double ph(double per) {return _currentDeviceHeight * (per/100); }

  static SizedBox sizeBoxWidth(double figmaSize) {
    return SizedBox( width:  width(figmaSize) );
  }


  static SizedBox sizeBoxHeight(double figmaSize) {
    return SizedBox( height:  height(figmaSize) );
  }



  /// call from splash
  static setup(BuildContext context ) {
    _currentDeviceWidth = DeviceTools.getWidth(context);
    _currentDeviceHeight = DeviceTools.getHeight(context);
  }


  static double width ( double figmaSize ) {
    double ratio = ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenWidth );
    // Log.i("figma.width() - figmaSize: $figmaSize /_figmaScreenWidth: $_figmaScreenWidth /ratio: $ratio");
    return  ratio * _currentDeviceWidth;
  }


  static  double height ( double figmaSize ) {
    return ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenHeight ) * _currentDeviceHeight;
  }


}