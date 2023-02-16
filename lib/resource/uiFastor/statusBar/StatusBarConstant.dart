import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:log_debug/log_debug.dart';

class StatusBarConstant {
  //colors
  static var colorBackground =   HexColor( "#75aeb9");

  /**
   * //text color
   * Brightness.dark
      Brightness.light
   */
  static var colorText_brightness = Brightness.light;


  static double? paddingTop ;

  static void initStatusBarValues(BuildContext context) {
    paddingTop = null;

    //get again
    getHeight(context);
  }


  //size
  static double getHeight( BuildContext context ) {
    try {

      if( paddingTop != null ) return paddingTop!;

      paddingTop =  MediaQuery.of(context).padding.top;
      //Log.i( "StatusBarConstant - getHeight() - result: $result ");
      return paddingTop!;
    }  catch (err) {
      LogDebug.e( "StatusBarConstant - getHeight() - err: $err ");
      return 65;
    }

  }

}