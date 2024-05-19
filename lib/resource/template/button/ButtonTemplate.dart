
import 'package:flutter/material.dart';


import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';

///class button ui
@Deprecated( "use instead 'ButtonFastor()'")
class ButtonTemplate {
  //------------------------------------------------------------------ normal

  /**
   * "t" : means template
   */
  ///read parameter types to use it in your UserInterface
  static Widget t(String text, VoidCallback? onPressed,
      {
      Color? textColor ,
      double textDimen = 0,
      String? fontFamily,
      Color? background,
      double? width,
      double? height,

      //decoration
      Color? borderLine,
      double? borderRadius,
      Decoration? decoration, // must before use this use also width fixed and height
      VoidCallback? onLongPress,
      EdgeInsets? margin,
      EdgeInsets? padding,
      LevelDS levelDS = LevelDS.l1,
      TextAlign textAlign = TextAlign.center,
      Alignment? gravityLayout  //container alignment
       }) {


    //text dimen, text color, button color, font
    double textDimen_ds =
        DesignSystemTools.getDimenDesignSystem_text(levelDS, textDimen);
    Color textColor_ds =
        DesignSystemTools.getColorDesignSystem_buttonText(levelDS, textColor);

    Color backgroundColor_ds =
        DesignSystemTools.getColorDesignSystem_buttonBackground(
            levelDS, background);
    String font_ds =
        DesignSystemTools.getFontDesignSystem_button(levelDS, fontFamily);

    //padding default
   // padding ??= EdgeInsets.only(left: 3.7, right: 3.7, top: 3.7, bottom: 3.7);
    padding ??=  EdgeInsets.symmetric(
        horizontal: DSDimen.button_padding_horizontal,
        vertical: DSDimen.button_padding_vertical
    );

    //margin fix
    margin = EdgeInsetsTools.fixDefaultSpace(margin, 6);

    //text
    var txt = _getText(text, textAlign, textColor_ds, textDimen_ds, padding, font_ds);


    //style button
    ButtonStyle style = _getButtonStyle(backgroundColor_ds,
        width, height, borderLine, borderRadius, textDimen);


    //button
    var bt = ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: txt,
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


  static Widget _getText( String text, TextAlign textAlign, Color textColor_ds, double textDimen_ds, EdgeInsets padding, String font_ds) {
    return TextTemplate.t(text,
        textAlign: textAlign,
        color: textColor_ds,
        dimen: textDimen_ds,
        padding: padding,
        fontFamily: font_ds);
  }


  static ButtonStyle _getButtonStyle(Color backgroundColor_ds,
      double? width, double? height, Color? borderLine, double? borderRadius, double dimen) {


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

        //need to fix [ANALYSIS ISSUE] instead of "primary"
        foregroundColor: backgroundColor_ds,
        backgroundColor: backgroundColor_ds,

        side: side,
        shape: shape
      // elevation: 10
    );

    return style;
  }


}


