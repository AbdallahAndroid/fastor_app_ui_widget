
import 'dart:math';


import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/portrait_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/responsive_calculator_figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/scale_text.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/cupertino.dart';

import 'ProjectFigmaScreenInitializer.dart';


double currentDeviceWidth = 0;
double currentDeviceHeight = 0;
double textScaleFactorFigma = 1.0;
bool isTablet = false;

/**
 * case website semi box shape the width value near by the height value
 * like Width: 984 /height: 757
 */
bool isSemiBoxShape = false;


/// Figma is symbole of ResponsiveFigmaProject
class Figma   {

//==================================================================================
//                                               setup
//==================================================================================

  /// call from splash
  static setup(BuildContext context ) {
    currentDeviceWidth = DeviceTools.getWidth(context);
    currentDeviceHeight = DeviceTools.getHeight(context);

    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    textScaleFactorFigma  = MediaQueryData.fromView(view).textScaleFactor;
    // Log.i("figma - setup() - textScaleFactorFigma: $textScaleFactorFigma");

    /// init tablet
    /// tablet issues with aspect resolution ratio
    var shortestSide = MediaQuery.of(context).size.shortestSide ;
    isTablet = shortestSide >= 570;

    /// init semi box shape
    var longestSide = MediaQuery.of(context).size.longestSide ;
    var dif = longestSide - shortestSide;
    isSemiBoxShape = dif < 300;
    Log.i("Figma - setup() - currentDeviceWidth: $currentDeviceWidth /currentDeviceHeight: $currentDeviceHeight /isTablet: $isTablet / isSemiBoxShape: $isSemiBoxShape");
  }


//==================================================================================
//                                               easy to use static class methods
//==================================================================================

  /// w is symbole of width
  static double w(double figmaSize) => ResponsiveCalculatorFigma.responsiveWidth(figmaSize);


  /// h is symoble of height
  static double h(double figmaSize) => ResponsiveCalculatorFigma.responsiveHeight( figmaSize);

  /// pw is symoble of percentage width
  static double percentageWidth(double per) {return currentDeviceWidth * (per/100); }

  /// ph is symoble of percentage height
  static double percentageHeight(double per) {return currentDeviceHeight * (per/100); }

}


//==================================================================================
//                         easy to use extensions
//==================================================================================

extension FigmaSizeDouble on num  {

  double get w => ResponsiveCalculatorFigma.responsiveWidth(numToDouble());
  double get h => ResponsiveCalculatorFigma.responsiveHeight(numToDouble());

  /// why use "wr" instead of "w" ?
  ///  fix import issue with another plugin responsive_package
  double get wr => w;
  double get hr => h ;

  /// radius
  double get r =>  scaleRadius() * numToDouble();

  /// radius
  double get sp => ResponsiveCalculatorFigma.responsiveSp(numToDouble());

}


