import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';



class TextCustomLight extends StatelessWidget {

  String title ;
  Color? color;
  double? fontSize;
  int? maxLines;
  TextOverflow? overflow;
  double? width;

  TextCustomLight( this.title,{
    this.color,
    this.fontSize,
    this.maxLines,
    this.width,
    this.overflow
  });

  @override
  Widget build(BuildContext context) {
    return TextApp( title,
        color: color?? Colors.black,
        // fontFamily: FontResource.light,
        maxLines: maxLines,
        width: this.width,
        overflow: overflow,
        fontSize:   fontSize??Figma.h( 14) );
  }

}