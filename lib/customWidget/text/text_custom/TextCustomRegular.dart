import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


class TextCustomRegular extends StatelessWidget {

  String title ;
  Color? color;
  double? fontSize;
  int? maxLines;
  TextOverflow? overflow;
  TextAlign? textAlign;
  double? width;
  double? height;
  TextDecoration? textDecoration; // must before use this use also width fixed and height

  TextCustomRegular( this.title,{
    this.color,
    this.fontSize,
    this.maxLines,
    this.textAlign,
    this.width,
    this.height,
    this.textDecoration,
    this.overflow
  });

  @override
  Widget build(BuildContext context) {
    return TextApp( title,
        color: color?? Colors.black,
        // fontFamily: FontResource.regular,

        maxLines: maxLines,
        width: this.width,
        textAlign: textAlign,
        overflow: overflow,
        textDecoration: textDecoration,
        height: height,
        fontSize:   fontSize??Figma.h( 16) );
  }

}