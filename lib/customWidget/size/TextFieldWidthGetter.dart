

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:flutter/material.dart';

/**
 * How to know the width of this "Text" Widget
 */
class TextWidthGetter {



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
    padding ??= 8;
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