import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


class TextCustomMedium extends StatelessWidget {

  String title ;
  Color? color;
  String? fontFamily;
  double? fontSize;
  double? height;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;
  double? width;

  TextCustomMedium( this.title,{
    this.color,
    this.fontSize,
    this.overflow,
    this.textAlign,
    this.fontFamily,
    this.maxLines,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return TextApp( title,
        color: color?? Colors.black,
        // fontFamily: FontResource.medium,
        textAlign: textAlign??TextAlign.center,
        overflow: overflow,
        maxLines: maxLines,
        width: width,
        height: height,
        fontSize:   fontSize??Figma.h( 18) );
  }

}