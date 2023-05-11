import 'package:flutter/material.dart';

@Deprecated( "use instead 'ColumnFastor()'")
class ColumnTemplate {


  //------------------------------------------------------------------ normal

  /**
   * "t" : means template
   */
  static Widget t({

    //found before at flutter v2.8
    List<Widget> children = const <Widget>[],
    MainAxisAlignment? mainAxisAlignment, // = MainAxisAlignment.start,
    MainAxisSize? mainAxisSize, // = MainAxisSize.min,
    CrossAxisAlignment? crossAxisAlignment, // = CrossAxisAlignment.start,
    double? width,
    double? height,

    //new feature not found at flutter v2.8
    Color? colorBackground  ,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Decoration? decoration,  // pages: decoration: BorderHelper.top_line()
    Alignment? alignGravity
  })  {

    //default gravity layout
    alignGravity ??= Alignment.topLeft;
    mainAxisAlignment ??=  MainAxisAlignment.start;
    mainAxisSize ??=  MainAxisSize.min;
    crossAxisAlignment ??=  CrossAxisAlignment.start;

    var col = Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children ,
    );

    var sizeBox = SizedBox(child: col, width: width, height: height );

    var cont = Container(
      alignment: alignGravity,
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      decoration: decoration,
      child: sizeBox,
      color: colorBackground,
    );

    return cont;
  }



}