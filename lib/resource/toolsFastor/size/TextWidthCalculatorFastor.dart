import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:flutter/material.dart';

class TextWidthCalculatorFastor {



  static double get({
    required BuildContext context,
    required String txt,
    required double  dimenFont,
    double? frame_width_max,
    // double? frame_width_min,
    double?  padding,
    double?  margin,


  }){

    //set default
    //dimenFont ??= DSDimen.text_level_2;
    padding ??= DSDimen.textfield_auto_padding;
    frame_width_max ??= DeviceTools.getWidth(context);

    // ratio
    /**
        - android: 0.62 working ok
        - ios : 0.63
     */
    double ratio = 0.63 ;

    //get data
    int lenChar = txt.length;
    double oneCharacterNeedPixel = ratio * dimenFont;
    double needWidthFrame = oneCharacterNeedPixel * lenChar;

    //check max line
    if( needWidthFrame > frame_width_max  ){
      return frame_width_max;
    }

    return needWidthFrame;
  }
}