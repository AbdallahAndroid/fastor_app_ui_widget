import 'package:fastor_app_ui_widget/core/size/NotchBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/core/size/StatusBarSizeHelper.dart';
import 'package:flutter/material.dart';
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

  static double _widthFullSize = 0;
  static double _heightFullSize = 0;
  static Orientation? _orientationPrevous = null;

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
    bool isAndroid = DeviceTools.isAndroid();
    return isWeb && isAndroid;
  }


  static bool isBrowserIOS() {
    bool isWeb = DeviceTools.isPlatformWeb();
    bool isIOS = DeviceTools.isIOS();
    return isWeb && isIOS;
  }

  //----------------------------------------------------------------- orientation

  static bool isPortrait(BuildContext  context ) {
    return DeviceTools.getWidth( context ) < DeviceTools.getHeight(context );
  }


  static bool isLandscape(BuildContext  context, ) {
    return ! DeviceTools.isPortrait(context);
  }


  static bool isPortraitMobile( BuildContext  context ) {
    return isMobile( ) && isPortrait(context);
  }


  static bool isLandscapeMobile( BuildContext  context ) {
    return isMobile( ) && isLandscape(context);
  }


  //------------------------------------------------------------- screens size

  // ++++++++++++++++ custome

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

  //++++++++++++++++++++ fix cache device size

  static void _clearCacheDiviceSizeWhenOrientationChange(BuildContext context){
    // case first time open app
    if( _orientationPrevous == false ) {
      return;
    }

    // case same orientation not change
    var currentOrientation = MediaQuery.of(context).orientation;
    bool isOrientationNotChange = currentOrientation == _orientationPrevous;
    if( isOrientationNotChange ) {
      return ;
    }

    //update oriantation
    _orientationPrevous = currentOrientation;
    _clearCacheSaveDeviceSizeNow();
   // print("Fastor - detect oriantation change");
  }

  /**
      call when website responsive
   */
  static void _clearCacheSaveDeviceSizeNow(  ) {
    //make it zero
    _widthFullSize = 0;
    _heightFullSize = 0;
  }


  static double getWidthGlobal ( ) {
    return getWidth( getContextGlobal()! );
  }


  static double getHeightGlobal ( ) {
    return getHeight( getContextGlobal()! );
  }


  static double getWidth (BuildContext  context, { String? className  }) {
    try {

      _clearCacheDiviceSizeWhenOrientationChange(context);

      if( isMobile() &&  _widthFullSize != 0 ) {
        return _widthFullSize;
      }
      _widthFullSize =  MediaQuery.of(context).size.width;
      // Log.i( "DeviceTools - getScreenWidth() - result: $result ");
      return _widthFullSize;
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

      _clearCacheDiviceSizeWhenOrientationChange(context);

      if( isMobile() &&  _heightFullSize != 0 ) {
        return _heightFullSize;
      }
      _heightFullSize =  MediaQuery.of(context).size.height;
      //Log.i( "DeviceTools - getHeight() - result: $result ");
      return _heightFullSize;
    }  catch (err) {
      if( className  != null ){
        //Log.e( "DeviceTools - getHeight() - err - className: $className ");
        return 1000;
      }
      // LogDebug.e( "DeviceTools - getHeight() - err: $err ");
      return 1000;
    }
  }

  //+++++++++++++++++ mines safe area



  double getHeightInsideSafeArea(BuildContext context){
    return DeviceTools.getHeight(context)
        - NotchBarSizeHelper.getHeightTopAndDown(context)
        - StatusBarSizeHelper.getHeight(context) ;
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

