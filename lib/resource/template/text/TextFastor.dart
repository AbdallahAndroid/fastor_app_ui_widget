
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';


import 'BaseTextTemplate.dart';

/// text view
class TextFastor extends StatelessWidget {

  //------------------------------------------------------------------ varaible

  String s;
  TextAlign? textAlign ; //= TextAlign.left;
  TextDecoration? textDecoration; // = TextDecoration.none;
  Color? color;
  Color? backgroundColor;
  double  fontSize;
  String? fontFamily;
  EdgeInsets? margin;
  EdgeInsets? padding;

  Decoration?
  decoration; // must before use this use also width fixed and height
  double? width;
  double? height;

  Alignment? gravityLayoutAlign; //container alignment
  VoidCallback? onPressed;

  //lines
  int? maxLines;

  //web allow select text by mounse
  bool? selectedTextAllow;

  TextFastor(
      this.s,
      {
        required this.color,
        required this.fontSize ,
        required this.fontFamily,
        this.textAlign  = TextAlign.left,
        this.textDecoration  = TextDecoration.none,
        this.backgroundColor,
        this.margin,
        this.padding,
        this.decoration,
        this.width,
        this.height,
        this.gravityLayoutAlign,
        this.onPressed,
        this.maxLines,
        this.selectedTextAllow
      }
      );

  @override
  Widget build(BuildContext context) {

    //check found color
    if (backgroundColor != null) {
      decoration = BoarderHelper.rounded(
          radiusSize: 0, colorBackground: backgroundColor);
    }

    //get text
    return BaseTextTemplate.normal(s,
        textAlign: textAlign!,
        colorText: color,
        textDecoration: textDecoration,
        fontSize: fontSize,
        fontFamily: fontFamily,
        margin: margin,
        padding: padding,
        selectedTextAllow: selectedTextAllow,
        decoration_background: decoration,
        align: gravityLayoutAlign,
        onPressed: onPressed,
        width: width,
        height: height,
        maxLines: maxLines );
  }
}
