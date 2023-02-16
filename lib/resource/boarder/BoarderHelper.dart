import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';


import 'BaseBoarderHelper.dart';

class BoarderHelper extends BaseBoarderHelper{

  static BoxDecoration cardView(  {
    double? radiusSize ,
    Color? colorBackground ,
    Color? colorLine ,
    BorderRadius? radiusBorder, //see "BorderRadiusTools"
} ) {


    //set default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color  ;
    colorLine ??= DSColor.cardview_boarderLine  ;

    //set default radius
    var objRadius = Radius.circular( radiusSize );
    var radiusDefault = BorderRadius.all(  objRadius );
    radiusBorder ??= radiusDefault;


    var dec_container_radius = BoxDecoration(
        border: Border.all(color: colorLine ) ,
        borderRadius: radiusBorder ,
        color: colorBackground                                                          //background color
    );

    return dec_container_radius;
  }

  static BoxDecoration cardViewShadow( {
    double? radiusSize  ,
    Color? colorBackground,
    double? widthLine = 1 ,
    Color? colorLine ,
  }) {

    //default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color;
    colorLine ??= DSColor.cardview_boarderLine;

    return BaseBoarderHelper.circle(radiusSize: radiusSize ,
        colorBackground:  colorBackground,
        widthLine: widthLine!,
        colorLine: colorLine);
  }


  static Widget cardViewPhysical( {
    required Widget child,
    required double elevation_radius_value,  //
    double? radiusSize  ,
    Color? colorBackground,
    BorderRadius? radiusBorder, //see "BorderRadiusTools"

  }) {

    //set default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color;

    //elevation
    var physical =   PhysicalModel(
      elevation: elevation_radius_value,
      color:  colorBackground,
      child: child,
    );

    //set default
    var objRadius = Radius.circular( radiusSize );
    var radiusCustom = BorderRadius.all(  objRadius );

    //set custom
    if( radiusBorder != null ) {
      radiusCustom = radiusBorder;
    }

    //clip to card shape
    return ClipRRect(
      borderRadius: radiusCustom,
      child: physical,
    );
  }


  static BoxDecoration bottom_line( {
    double? radiusSize  ,
    Color? colorBackground,
    double? widthLine = 1 ,
    Color? colorLine ,
  }) {

    //default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color;
    colorLine ??= DSColor.cardview_boarderLine;

    return BaseBoarderHelper.bottom_line(radiusSize: radiusSize ,
        colorBackground:  colorBackground,
        widthLine: widthLine!,
        colorLine: colorLine);
  }


  static BoxDecoration top_line( {
    double? radiusSize ,
    Color? colorBackground ,
    double? widthLine,
    Color? colorLine,
  }) {

    //default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color;
    colorLine ??= DSColor.cardview_boarderLine;

    //width
    widthLine ??= 5;

    return BaseBoarderHelper.top_line(radiusSize: radiusSize,
        colorBackground:  colorBackground, widthLine: widthLine, colorLine: colorLine);
  }


  static BoxDecoration button_large({
    double? radiusSize,
    Color? colorBackground,
    double? widthLine ,
    Color? colorLine ,
  }) {

    //default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color;
    colorLine ??= DSColor.cardview_boarderLine;

    //width
    widthLine ??= 5;

    return BaseBoarderHelper.circle(
        radiusSize: radiusSize,
        colorBackground: colorBackground,
        widthLine: widthLine,
        colorLine: colorLine);
  }


  static BoxDecoration test( {
    double? radiusSize ,
    Color? colorBackground,
    double? widthLine ,
    Color? colorLine,
  }) {

    //default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color;
    colorLine ??= DSColor.cardview_boarderLine;

    //width
    widthLine ??= 1;


    return BaseBoarderHelper.top_line(
        radiusSize: radiusSize,
        colorBackground:  colorBackground,
        widthLine: widthLine,
        colorLine: colorLine);
  }


  static rounded({
    double? radiusSize ,
    Color? colorBackground = Colors.transparent,
    BorderRadius? radiusBorder, //see "BorderRadiusTools"
    Color? colorLine ,}) {

    //set default
    radiusSize ??= DSDimen.ds_size_corner_level_2;
    colorBackground ??= DSColor.cardview_background_color  ;
    colorLine ??= DSColor.cardview_boarderLine  ;

    //set default radius
    var objRadius = Radius.circular( radiusSize );
    var radiusDefault = BorderRadius.all(  objRadius );
    radiusBorder ??= radiusDefault;

    //decoration
    var dec_container_radius = BoxDecoration(
        border: Border.all(color: colorLine ) ,
        borderRadius: radiusBorder,
        color: colorBackground                                                          //background color
    );

    return dec_container_radius;
  }


  static box({
    Color? colorBackground = Colors.transparent,
    Color? colorLine ,}) {

    //set default
    colorBackground ??= DSColor.cardview_background_color  ;
    colorLine ??= DSColor.cardview_boarderLine  ;

    var box = BoxDecoration(
        border: Border.all(color: colorLine ) ,
        color: colorBackground
    );
    return box;
  }


}