import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemFont.dart';
import 'package:flutter/material.dart';

class TextStyleTemplate {

  static TextStyle t({
    Color? colorOpt = Colors.black ,
    TextDecoration? textDecoration = TextDecoration.none,
    double dimenOpt = 0,
    String? fontFamily,
}){

    //set default dimen
    var myDimen = DSDimen.text_level_1;
    if ( dimenOpt != 0 ) {
      myDimen = dimenOpt;
    }

    //color
    Color myColor = DSColor.text_h1;
    if  ( colorOpt != null ) {
      myColor = colorOpt;
    }

    //style
    var myStyle = TextStyle(
      fontSize: myDimen,
      color: myColor,
      fontFamily: fontFamily,
      height: 1.0, //space between lines
      decoration:  textDecoration,
    );

    return myStyle;
  }

  //---------------------------------------------------------------- ff "Auto"

  //++++++++++++++++++++++++++++++++++++++++ TextView

  /**
   * DS Parent
   */
  static TextStyle get text_parent    {
    return TextStyleTemplate.t(
        colorOpt: DSColor.text_parent,
        dimenOpt: DSDimen.text_level_parent,
        fontFamily: DSFont.hparent);
  }


  static TextStyle get text_h1 {
    return TextStyleTemplate.t(
        colorOpt: DSColor.text_h1,
        dimenOpt: DSDimen.text_level_1,
        fontFamily: DSFont.h1);
  }


  static TextStyle get text_h2 {
    return TextStyleTemplate.t(
        colorOpt: DSColor.text_h2,
        dimenOpt: DSDimen.text_level_2,
        fontFamily: DSFont.h2);
  }


  static TextStyle get text_h3 {
    return TextStyleTemplate.t(
        colorOpt: DSColor.text_h3,
        dimenOpt: DSDimen.text_level_3,
        fontFamily: DSFont.h3);
  }


  static TextStyle get text_h4 {
    return TextStyleTemplate.t(
        colorOpt: DSColor.text_h4,
        dimenOpt: DSDimen.text_level_4,
        fontFamily: DSFont.h4);
  }

  //++++++++++++++++++++++++++++++++++++++++ button

  /**
   * buttons large
   */
  static TextStyle get button_large {
    return TextStyleTemplate.t(
        colorOpt: DSColor.ds_button_large_text,
        dimenOpt: DSDimen.ds_button_large_corner,
        fontFamily: DSFont.button_large);
  }

  static TextStyle get button_small {
    return TextStyleTemplate.t(
        colorOpt: DSColor.ds_button_small_text,
        dimenOpt: DSDimen.ds_button_small_corner,
        fontFamily: DSFont.button_small);
  }


}