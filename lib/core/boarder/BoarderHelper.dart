

import 'package:flutter/material.dart';



import 'BaseBoarderHelper.dart';

class BoarderHelper extends BaseBoarderHelper{

  //--------------------------------------------------------------------- cardview

  static BoxDecoration cardView(  {
    double? radiusSize ,
    Color? colorBackground ,
    Color? colorLine ,
    BorderRadius? radiusBorder, //see "BorderRadiusTools"
} ) {


    //set default
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent ;
    colorLine ??= Colors.grey.withOpacity(0.3)  ;

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
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent;
    colorLine ??= Colors.grey.withOpacity(0.3);

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
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent ;

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


  static BoxDecoration cardViewBlur( {
    required Color colorBackground,
    required Color colorBlur,
    required double radiusBoarderSize ,
    required double radiusBlur,
    BorderRadius? radiusBorder,
    double widthShadow = 5 ,
    BlurStyle blurStyle = BlurStyle.normal,
    bool makeBlurColorDark = false
  }) {


    //radius
    radiusBoarderSize ??= 10;
    var objRadius = Radius.circular( radiusBoarderSize );
    var radiusDefault = BorderRadius.all(  objRadius );
    radiusBorder ??= radiusDefault;


    List<BoxShadow> listShadow = [];
    //shadow >> left bottom
    var leftBottomShadow = BoxShadow(
        color: colorBlur,
        blurRadius: radiusBlur,
        offset: Offset(widthShadow,widthShadow),
        blurStyle: blurStyle,
        spreadRadius: 0
    );

    listShadow.add(leftBottomShadow);
    if( makeBlurColorDark) {
      listShadow.add(leftBottomShadow);
      listShadow.add(leftBottomShadow);
      listShadow.add(leftBottomShadow);
      listShadow.add(leftBottomShadow);
      listShadow.add(leftBottomShadow);
      listShadow.add(leftBottomShadow);
      listShadow.add(leftBottomShadow);
      listShadow.add(leftBottomShadow);
    }

    //box
    var box = BoxDecoration(
        boxShadow:  listShadow,
        borderRadius: radiusBorder ,
        color: colorBackground
    );
    return box;
  }

  //--------------------------------------------------------------------------

  static BoxDecoration bottom_line( {
    double? radiusSize  ,
    Color? colorBackground,
    double? widthLine = 1 ,
    Color? colorLine ,
  }) {

    //default
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent;
    colorLine ??= Colors.grey.withOpacity(0.3);

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
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent;
    colorLine ??= Colors.grey.withOpacity(0.3);

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
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent;
    colorLine ??= Colors.grey.withOpacity(0.3);

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
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent;
    colorLine ??= Colors.grey.withOpacity(0.3);

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
    BorderRadius? radiusBorder, //see class "BorderRadiusTools"
    Color? colorLine ,}) {

    //set default
    radiusSize ??= 10;
    colorBackground ??= Colors.transparent;
    colorLine ??= Colors.grey.withOpacity(0.3);

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
    colorBackground ??= Colors.transparent;
    colorLine ??= Colors.grey.withOpacity(0.3);

    var box = BoxDecoration(
        border: Border.all(color: colorLine ) ,
        color: colorBackground
    );
    return box;
  }


}