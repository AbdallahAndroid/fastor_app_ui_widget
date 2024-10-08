import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';



class TextCustomSemiBold extends StatelessWidget {

  String title ;
  Color? color;
  int? maxLines;
  double? fontSize;
  TextOverflow? overflow;
  TextAlign? textAlign;

  TextCustomSemiBold( this.title,{
    this.color,
    this.maxLines,
    this.textAlign,
    this.fontSize,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return TextApp( title,
        color: color?? Colors.black,
        // fontFamily: FontResource.semibold,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        fontSize:   fontSize??Figma.w( 16) );
  }

}