import 'package:fastor_app_ui_widget/resource/resources/ds/LevelDS.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemTools.dart';
import 'package:fastor_app_ui_widget/resource/template/constants/TemplateSize.dart';


import 'BaseTextTemplate.dart';

/// text view
class TextFastor extends StatelessWidget {
  //------------------------------------------------------------------ varaible
  String s;
  TextAlign? textAlign ; //= TextAlign.left;
  TextDecoration? textDecoration; // = TextDecoration.none;
  Color? color;
  Color? backgroundColor;
  double? fontSize;
  String? fontFamily;
  EdgeInsets? margin;
  EdgeInsets? padding;

  Decoration?
  decoration; // must before use this use also width fixed and height
  double? width;
  double? height;

  TemplateSize? templateSize;
  Alignment? gravityLayoutAlign; //container alignment
  VoidCallback? onPressed;
  LevelDS? levelDS ; //= LevelDS.l1;

  //lines
  int? maxLines;

  //web allow select text by mounse
  bool? selectedTextAllow;

  TextFastor(
      this.s,
      {
        this.textAlign  = TextAlign.left,
        this.textDecoration  = TextDecoration.none,
        this.color,
        this.backgroundColor,
        this.fontSize = 0 ,
        this.fontFamily,
        this.margin,
        this.padding,
        this.decoration,
        this.width,
        this.height,
        this.templateSize,
        this.gravityLayoutAlign,
        this.onPressed,
        this.levelDS = LevelDS.l1,
        this.maxLines,
        this.selectedTextAllow
      }
      );

  @override
  Widget build(BuildContext context) {

    //print( "TextFastor - build() - levelDS: " + levelDS.toString() + " /textAlign: " + textAlign.toString() );


    double dime_ds =
    DesignSystemTools.getDimenDesignSystem_text(levelDS!, fontSize);
    Color color_ds =
    DesignSystemTools.getColorDesignSystem_text(levelDS!, color);
    String font_ds =
    DesignSystemTools.getFontDesignSystem_text(levelDS!, fontFamily);

    // print( "string: " + s.toString() + " /dime_ds: " + dime_ds.toString() );

    //check found color
    if (backgroundColor != null) {
      decoration = BoarderHelper.rounded(
          radiusSize: 0, colorBackground: backgroundColor);
    }

    //get text
    return BaseTextTemplate.normal(s,
        textAlign: textAlign!,
        colorOpt: color_ds,
        textDecoration: textDecoration,
        dimenOpt: dime_ds,
        fontFamily: font_ds,
        margin: margin,
        padding: padding,
        selectedTextAllow: selectedTextAllow,
        decoration_background: decoration,
        templateSize: templateSize,
        align: gravityLayoutAlign,
        onPressed: onPressed,
        width: width,
        height: height,
        maxLines: maxLines,
        dsLevel: levelDS);
  }
}
