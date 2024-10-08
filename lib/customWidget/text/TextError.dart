
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


class TextError extends StatelessWidget {

  String title ;
  Color? color;
  double? fontSize;

  TextError( this.title,{
    this.color,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return TextApp( title,
        // color: color?? ColorResource.textLight,
        // fontFamily: FontResource.semibold,
        fontSize:   fontSize??Figma.w( 16),
      color: color??Colors.black
    );
  }

}