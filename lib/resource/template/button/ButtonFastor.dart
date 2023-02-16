import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/ds/DesignSystemFont.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemTools.dart';
import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/constants/TemplateSize.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../ds/LevelDS.dart';

///class button ui
class ButtonFastor extends StatelessWidget {
  //------------------------------------------------------------------
  String text;

  VoidCallback onPressed;
  Color? textColor;

  double? textFontSize;
  String? fontFamily;
  Color? background;
  double? width;
  double? height;

  //decoration
  Color? borderLine;
  double? borderRadius;
  Decoration? decoration; // must before use this use also width fixed and height
  VoidCallback? onLongPress;
  EdgeInsets? margin;
  EdgeInsets? padding;
  LevelDS? levelDS; // = LevelDS.l1;
  TextAlign? textAlign ; //= TextAlign.center;
  Alignment? gravityLayout; //container alignment

  ButtonFastor(
      this.text,
      this.onPressed,
      {
        this.textColor,
        this.textFontSize  ,
        this.fontFamily,
        this.background,
        this.width,
        this.height,
        this.borderLine,
        this.borderRadius,
        this.decoration,
        this.onLongPress,
        this.margin,
        this.padding,
        this.levelDS ,
        this.textAlign = TextAlign.center ,
        this.gravityLayout,
        this.font_ds
      }
      ){
    setDefaultValue();
  }

  Color? textColor_ds;

  Color? backgroundColor_ds;
  // double? textDimen_ds;
  String? font_ds;

  @override
  Widget build(BuildContext context) {
    //text
    Widget txtWidget = _getText(
        text, textAlign!, textColor_ds!, textFontSize!, padding!, font_ds!);

    //style button
    ButtonStyle style = _getButtonStyle(backgroundColor_ds!, width, height,
        borderLine, borderRadius, textFontSize! );

    //button
    var bt = ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: txtWidget,
      style: style,
    );

    //container
    var ct = Container(
      width: width,
      height: height,
      margin: margin,
      alignment: gravityLayout,
      child: bt,
      decoration: decoration,
    );

    return ct;
  }

  //------------------------------------------------------------------------- base

  void setDefaultValue() {
    levelDS ??= LevelDS.l1;

    //text dimen, text color, button color, font
    textFontSize =
        DesignSystemTools.getDimenDesignSystem_text(levelDS!, textFontSize);
    textColor_ds =
        DesignSystemTools.getColorDesignSystem_buttonText(levelDS!, textColor);
    backgroundColor_ds =
        DesignSystemTools.getColorDesignSystem_buttonBackground(
            levelDS!, background);
    font_ds =
        DesignSystemTools.getFontDesignSystem_button(levelDS!, fontFamily);

    //padding default
    // padding ??= EdgeInsets.only(left: 3.7, right: 3.7, top: 3.7, bottom: 3.7);
    padding ??= EdgeInsets.symmetric(
        horizontal: DSDimen.button_padding_horizontal,
        vertical: DSDimen.button_padding_vertical);

    //margin fix
    margin = EdgeInsetsTools.fixDefaultSpace(margin, 6);

    //fix default size
    height ??= DSDimen.button_height;
    width ??= 140;
  }

  static Widget _getText(String text, TextAlign textAlign, Color textColor_ds,
      double textDimen_ds, EdgeInsets padding, String font_ds) {
    return TextTemplate.t(text,
        textAlign: textAlign,
        color: textColor_ds,
        dimen: textDimen_ds,
        padding: padding,
        fontFamily: font_ds);
  }

  static ButtonStyle _getButtonStyle(Color backgroundColor_ds, double? width,
      double? height, Color? borderLine, double? borderRadius, double dimen) {
    //boarder - line
    borderLine ??= backgroundColor_ds;
    BorderSide side = BorderSide(color: borderLine, width: 1);

    //boarder - radius
    borderRadius ??= DSDimen.ds_button_large_corner;
    var shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius));

    //fixed size
    Size? fixedSize = DesignSystemTools.getFixedSize(width, height, dimen);

    //style
    var style = ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        fixedSize: fixedSize,
        primary: backgroundColor_ds,
        side: side,
        shape: shape
      // elevation: 10
    );

    return style;
  }
}
