import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';



class TextCustomBold extends StatelessWidget {

  String title ;
  Color? color;
  double? fontSize;

  TextCustomBold( this.title,{
    this.color,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return TextApp( title,
        color: color?? Colors.black , //.textPrimary,
        // fontFamily: FontResource.semibold,
        fontSize:   fontSize??Figma.h( 24) );
  }

}