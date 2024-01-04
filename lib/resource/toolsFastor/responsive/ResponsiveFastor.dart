import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:flutter/material.dart';

class ResponsiveFastor {

  //-------------------------------------------------------------------- checker

  static isTabletPortraitOrIsPhoneNormalSize(BuildContext context ) {
    // Log.i("isTabletPortraitOrIsPhoneNormalSize() - isPhoneNormalSize(context): ${isPhoneNormalSize(context)}");
    return isTabletPortrait(context) || isPhoneNormalSize(context);
  }

  //-------------------------------------------------------------------- tablet

  static isTabletLandscape(BuildContext context ) {
    bool isTablet =    isPhoneNormalSize(context) == false ;
    return  isTablet && DeviceTools.isLandscape(context);
  }


  static isTabletPortrait(BuildContext context ) {
    bool isTablet =    isPhoneNormalSize(context) == false ;
    return  isTablet && DeviceTools.isPortrait(context);
  }


  static isTablet(BuildContext context ) {
    return ! isPhoneNormalSize(context);
  }

  //--------------------------------------------------------- phone

  static isPhoneNormalSize(BuildContext context ){
    if( _chooseSmallestDeviceSize(context) < 600 ) {
      return true;
    } else {
      return false;
    }
  }

  //--------------------------------------------------------------- helper

  static _chooseSmallestDeviceSize (BuildContext context ) {
    var smallest = DeviceTools.getWidth(context);
    if(DeviceTools.getHeight(context) < smallest ) {
      smallest = DeviceTools.getHeight(context);
    }
    return smallest;
  }


  //------------------------------------------------------ size

  static isPhoneSmall(BuildContext context ) {
    if( _chooseSmallestDeviceSize(context) < 400 ) {
      return true;
    } else {
      return false;
    }
  }

}