import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';

Color statusBarColorBackgroundBlackSecond = Colors.black;

class StatusBarSizeHelper {

  //-------------------------------------------------------------- variable

  //colors
  static var colorBackground =  statusBarColorBackgroundBlackSecond;

  /**
   * //text color
   * Brightness.dark
      Brightness.light
   */
  static var colorText_brightness = Brightness.light;


  static double? paddingTop ;

  //-------------------------------------------------------------- methods

  // static void initStatusBarValues(BuildContext context) {
  //   paddingTop = null;
  //
  //   //get again
  //   getHeight(context);
  // }


  //size
  static double getHeight( BuildContext context ) {
    try {

      if( paddingTop != null ) return paddingTop!;

      paddingTop =  MediaQuery.of(context).padding.top;
      //Log.i( "StatusBarConstant - getHeight() - result: $result ");
      return paddingTop!;
    }  catch (err) {
      Log.e( "StatusBarConstant - getHeight() - err: $err ");
      return 65;
    }

  }

}