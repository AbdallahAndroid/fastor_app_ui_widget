
import 'dart:collection';




import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/values/UniqueIdTools.dart';
import 'package:flutter/material.dart';

typedef DeviceSizeChangeCallBack = Function(double w, double h );


class DeviceSizeChangeBase {

  static String tag = "DeviceSizeChange";


  //------------------------------------------------------------------- widget

  static LinkedHashMap<String, DeviceSizeChangeCallBack> _mapListener = LinkedHashMap(); //key: is widget listener, value: callback

  static double _device_width = 0;
  static double _device_height = 0;

  static bool _firstOnceStop = false;

  static void updateListenerChangeSize( BuildContext  context, { bool? error_hide} ){

   // Log.k( tag, 'updateListenerChangeSize() ' +  context.toString() );

    double new_width = DeviceTools.getWidth( context, className: tag );
    double new_height = DeviceTools.getHeight(   context, className: tag);

    if(validate(new_width, new_height)) {

      _device_width = new_width;
      _device_height = new_height;

      _invokeCallBackWaiting();
      return;
    } else {
      return;
    }


    //  Log.k( tag, 'updateListenerChangeSize() ' +  _device_width.toString() );

    _invokeCallBackWaiting();

  }

  static bool validate(double new_width, double new_height){

    // not need once viwe created first time
    if( _firstOnceStop ) {
      _firstOnceStop  = true;
      return false;
    }


    //check width not change Nor height
    bool isWidthChange = new_width != _device_width;
    bool isHeightChange = new_height != _device_height;
    bool anySizeChange =  isWidthChange || isHeightChange;
    // Log.k( tag,  "validate() anySizeChange: " + anySizeChange.toString() );
    // Log.k( tag,  "validate() new_width: " + new_width.toString()  + " /old: " + _device_width.toString() );
    return anySizeChange;
  }

  static void addListenerToChange( {
    String? key,
    required DeviceSizeChangeCallBack callBack
    } ) {

    //check if
    key ??= UniqueIdTools.getNumberOnly().toString();


     _mapListener[key] = callBack;
  }

  //--------------------------------------------------------------------- private

  static void _invokeCallBackWaiting(){
    _mapListener.forEach((key, value) {
    //  Log.k( tag, '_invokeCallBackWaiting() - key: ' +  key  );
      value( _device_width, _device_height);
    });
  }


}