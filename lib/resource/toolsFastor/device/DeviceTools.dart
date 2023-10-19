
import 'package:flutter/material.dart';
import 'package:log_debug/log_debug.dart';

import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/** ----------- english syntax
 *
    We write:	We say:
    ½	a half OR one half
    ¼	a quarter OR one quarter
    ¾	three quarters
    ⅓	a third OR one third
    ⅔	two thirds
    ⅕	a fifth OR one fifth
    ⅗	three fifths
    ⅛	an eighth OR one eighth
    ⅝	five eighths
    1½	one and a half
    5¾	five and three quarters
 */

class DeviceTools {


  // /-------------------------------------------------------------- variable

  static double widthFullSize = 0;
  static double heightFullSize = 0;

  //-------------------------------------------------------------- platform

  static bool isPlatformWeb(){
    return kIsWeb;
  }


  static bool isMobile() {
    //check mobile
    if (Platform.isAndroid) {
      return true;
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
      return true;
    }
    return false;
  }


  static bool isAndroid() {
    return Platform.isAndroid;
  }


  static bool isIOS() {
    return Platform.isIOS;
  }

  /**
   * open from safari or chrome from android or ios
   */
  static bool isBrowserMobile() {
    bool isWeb = DeviceTools.isPlatformWeb();
    bool isMobile = DeviceTools.isMobile();
    return isWeb && isMobile;
  }


  static bool isBrowserAndroid() {
    bool isWeb = DeviceTools.isPlatformWeb();
    bool isMobile = DeviceTools.isAndroid();
    return isWeb && isMobile;
  }


  static bool isBrowserIOS() {
    bool isWeb = DeviceTools.isPlatformWeb();
    bool isMobile = DeviceTools.isIOS();
    return isWeb && isMobile;
  }

  //----------------------------------------------------------------- orientation

  static bool isPortrait(BuildContext  context ) {
    return DeviceTools.getWidth( context ) < DeviceTools.getHeight(context );
  }


  static bool isLandscape(BuildContext  context, ) {
    return ! DeviceTools.isPortrait(context);
  }


  static bool isMobile_portrait( BuildContext  context ) {
    //check mobile
    return isMobile( ) && isPortrait(context);
  }

  //------------------------------------------------------------- screens size

  // ++++++++++++++++ customer

  static double  getCostumeWidth(BuildContext  context, double d) {
    var result =  getWidth(context ) * (d/100.0);
    // Log.i( "DeviceTools - getThirdWidth() - result: $result ");
    return result;
  }


  static double  getCostumeHeight(BuildContext  context, double d) {
    var result =  getHeight( context ) * (d/100.0);
    // Log.i( "DeviceTools - getHalfHeight() - result: $result ");
    return result;
  }


  // /**
  //  call when website responsive
  //  */
  // static void initFullSize(BuildContext  context ) {
  //   //make it zero
  //   widthFullSize = 0;
  //   heightFullSize = 0;
  //
  //   //get again
  //   getWidth(context);
  //   getHeight(context);
  // }


  static double getWidth (BuildContext  context, { String? className  }) {
    try {
      if( isMobile() &&  widthFullSize != 0 ) {
        return widthFullSize;
      }
      widthFullSize =  MediaQuery.of(context).size.width;
     // Log.i( "DeviceTools - getScreenWidth() - result: $result ");
      return widthFullSize;
    }  catch (err) {
      if( className  != null ){
        //Log.e( "DeviceTools - getWidth() - err - className: $className ");
        return 500;
      }
   //   LogDebug.e( "DeviceTools - getWidth() - err: $err ");
      return 500;
    }
  }


  static double getHeight (BuildContext  context, { String? className }) {
    try {
      if( isMobile() &&  heightFullSize != 0 ) {
        return heightFullSize;
      }
      heightFullSize =  MediaQuery.of(context).size.height;
      //Log.i( "DeviceTools - getHeight() - result: $result ");
      return heightFullSize;
    }  catch (err) {
      if( className  != null ){
        //Log.e( "DeviceTools - getHeight() - err - className: $className ");
        return 1000;
      }
     // LogDebug.e( "DeviceTools - getHeight() - err: $err ");
      return 1000;
    }
  }

  //++++++++++++++++ by percentage

  static double getPercentageWidth(BuildContext  context, double p) {
    var result =  getWidth(context) *  p;
    return result/100.0;
  }


  static double getPercentageHeight(BuildContext  context, double p) {
    var result =  getHeight(context) *  p;
    return result/100.0;
  }

  //+++++++ 0.75

  static double  get75PercentageWidth(BuildContext  context) {
    var result =  getWidth(context) * 0.75;
    // Log.i( "DeviceTools - getThirdWidth() - result: $result ");
    return result;
  }


  static double get75PercentageHeight(BuildContext  context) {
    var result =  getHeight(context) * 0.75;
    // Log.i( "DeviceTools - getHalfHeight() - result: $result ");
    return result;
  }

  //+++++++ 0.5

  static double  getHalfWidth(BuildContext  context) {
    var result =  getWidth(context) / 2.0;
    // Log.i( "DeviceTools - getThirdWidth() - result: $result ");
    return result;
  }


  static double getHalfHeight(BuildContext  context) {
    var result =  getHeight(context) / 2.0;
    // Log.i( "DeviceTools - getHalfHeight() - result: $result ");
    return result;
  }

  //+++++++ 0.33

  static double  getThirdWidth(BuildContext  context) {
    var result =  getWidth(context) / 3.0;
    // Log.i( "DeviceTools - getThirdWidth() - result: $result ");
    return result;
  }


  static double  getThirdHeight(BuildContext  context) {
    var result =  getHeight(context) / 3.0;
    // Log.i( "DeviceTools - getThirdWidth() - result: $result ");
    return result;
  }

  //+++++++ 0.25

  static double getQuarterWidth(BuildContext  context) {
    var result =  getWidth(context) / 4.0;
    // Log.i( "DeviceTools - getQuarterHeight() - result: $result ");
    return result;
  }


  static double getQuarterHeight(BuildContext  context) {
    var result =  getHeight(context) / 4.0;
   // Log.i( "DeviceTools - getQuarterHeight() - result: $result ");
    return result;
  }

  //+++++++  1 / 5

  static double getFifthWidth(BuildContext  context) {
    var result =  getWidth(context) / 5.0;
    // Log.i( "DeviceTools - getQuarterHeight() - result: $result ");
    return result;
  }


  static double getFifthHeight(BuildContext  context) {
    var result =  getHeight(context) / 5.0;
    // Log.i( "DeviceTools - getQuarterHeight() - result: $result ");
    return result;
  }

  //+++++++ Sixth 1 /6

  static double getSixthWidth(BuildContext  context) {
    var result =  getWidth(   context) / 6.0;
    return result;
  }


  static double getSixthHeight(BuildContext  context) {
    var result =  getHeight(   context) / 6.0;
    return result;
  }

  //++++++++ eighth 1/8

  static double getEighthWidth(BuildContext  context) {
    var result =  getWidth(   context) / 8.0;
    return result;
  }


  static double getEighthHeight(BuildContext  context) {
    var result =  getHeight(context) / 8.0;
    return result;
  }






}

