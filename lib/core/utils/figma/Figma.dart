
import 'dart:math';

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/ProjectFigmaScreenInitializer.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:flutter/cupertino.dart';

double currentDeviceWidth = 0;
double currentDeviceHeight = 0;
bool isTablet = false;

/// Figma is symbole of ResponsiveFigmaProject
class Figma   {

  /**
      testClamp(){
      double h = 80;
      h.clamp(20, 90);
      }
   */
 
  ///-------------------------------------------------- choose size phone

  /// w is symbole of width 
  static double w(double figmaSize) {
    if( isTablet ) {
      return  figmaSize.wt;
    }
    return     widthNormalPhone(figmaSize);
  }


  /// h is symoble of height 
  static double h(double figmaSize) {
    if( isTablet ) {
      return  figmaSize.ht;
    }
    return  heightNormalPhone(figmaSize);
  }

  

  static SizedBox sizeBoxWidth(double figmaSize) {
    return SizedBox( width:  widthNormalPhone(figmaSize) );
  }


  static SizedBox sizeBoxHeight(double figmaSize) {
    return SizedBox( height:  heightNormalPhone(figmaSize) );
  }



  /// call from splash
  static setup(BuildContext context ) {
    currentDeviceWidth = DeviceTools.getWidth(context);
    currentDeviceHeight = DeviceTools.getHeight(context);
    /// tablet issues with aspect resolution ratio
    var shortestSide = MediaQuery.of(context).size.shortestSide ;
    isTablet = shortestSide >= 570;
  }


  static double widthNormalPhone ( double figmaSize ) {
    double ratio = ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenWidth );
    // Log.i("figma.width() - figmaSize: $figmaSize /_figmaScreenWidth: $_figmaScreenWidth /ratio: $ratio");
    return  ratio * currentDeviceWidth;
  }


  static  double heightNormalPhone ( double figmaSize ) {
    return ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenHeight ) * currentDeviceHeight;
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
      currentDeviceWidth / ProjectFigmaScreenInitializer.figmaScreenWidth;
  static double scaleHeight() =>
      currentDeviceHeight / ProjectFigmaScreenInitializer.figmaScreenHeight;

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
