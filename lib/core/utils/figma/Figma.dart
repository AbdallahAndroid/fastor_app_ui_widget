
import 'dart:math';

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/ProjectFigmaScreenInitializer.dart';
import 'package:flutter/cupertino.dart';

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

  /// w is symbole of width
  static double w(double figmaSize) {return  width(figmaSize); }


  /// h is symoble of height
  static double h(double figmaSize) {return  height(figmaSize); }


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



extension FigmaSizeDouble on double {


  w(){
    return Figma.w( this );
  }


  h(){
    return Figma.h( this );
  }

  /// radius
  double get r => FigmaSizeDouble.scaleRadius() * this;
  static double scaleRadius() => min(scaleWidth(), scaleHeight());
  static double scaleText() => min(scaleWidth(), scaleHeight());
  static double scaleWidth() =>
      _currentDeviceWidth / ProjectFigmaScreenInitializer.figmaScreenWidth;
  static double scaleHeight() =>
      _currentDeviceHeight / ProjectFigmaScreenInitializer.figmaScreenHeight;

  /// text
  double get sp => scaleText() * this;

}


extension FigmaSizeInt on int {

  double get w => Figma.w( double.parse(   "$this.0") );
  double get wr => Figma.h( double.parse(   "$this.0") );


  double get h => Figma.h( double.parse(   "$this.0") );

  double get hr => Figma.h( double.parse(   "$this.0") );


  /// radius
  double get r => FigmaSizeDouble.scaleRadius() * this;

  /// text
  double get sp => FigmaSizeDouble.scaleText() * this;

}
