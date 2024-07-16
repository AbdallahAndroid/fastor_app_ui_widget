
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';


import 'BaseTextTemplate.dart';


/// text view
class TextApp extends StatelessWidget {

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

  TextOverflow? overflow;

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

  TextStyle? myStyle;

  TextApp(
      this.s,
      {
        required this.color,
        required this.fontSize ,
        this.fontFamily,
        this.textAlign,
        this.textDecoration  = TextDecoration.none,
        this.backgroundColor,
        this.margin,
        this.padding,
        this.decoration,
        this.width,
        this.height,
        this.gravityLayoutAlign,
        this.onPressed,
        this.overflow,
        this.maxLines,
        this.selectedTextAllow
      }
      ){

    textAlign ??= TextAlign.start;
  }

  @override
  Widget build(BuildContext context) {

    //check found color
    if (backgroundColor != null) {
      decoration = BoarderHelper.rounded(
          radiusSize: 0, colorBackground: backgroundColor);
    }


    //default not selected
    /**
     * to avoid RAM Lost
     */
    selectedTextAllow ??= false;

    //fix null
    s ??= "";

    //style
    myStyle = TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: fontFamily,
      height: 1.0, //space between lines
      decoration:  textDecoration,
      decorationColor: color,
    );

    //view
    Widget viewChild =  chooseChildWhenPressed(s, textAlign!, myStyle!, maxLines, onPressed , selectedTextAllow! );


    //size
    Widget? container = null;
    if ( width != null ) {
      //get fixed size
      // Size? fixedSize = Size(width!, height??fontSize );
      container = Container (
        child: viewChild,
        width: width,
        height: height??fontSize,
        margin: margin,
        padding: padding,
        decoration:  decoration,
        alignment: gravityLayoutAlign,
      )  ;
      // Log.i( "fixed size");
    }   else {
      container = Container(  child: viewChild,
          alignment: gravityLayoutAlign,
          margin: margin,
          padding : padding,
          decoration: decoration
      )  ;
    }

    return container;

  }


}
