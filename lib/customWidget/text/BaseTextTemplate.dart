import 'package:flutter/material.dart';

abstract class BaseTextTemplate  {

  static Widget normal(String?  s ,  {
    TextAlign textAlign = TextAlign.left,
     double?  width,
     double?  height,
    Color? colorText = Colors.black ,
    TextDecoration? textDecoration = TextDecoration.none,
    double fontSize = 20,
    String? fontFamily,
    EdgeInsets? margin,
    EdgeInsets? padding = EdgeInsets.zero,

    Decoration? decoration_background, // must before use this use also width fixed and height

    VoidCallback? onPressed,
    Alignment? align = Alignment.topLeft,

    bool? selectedTextAllow ,


    //lines
    int? maxLines
  })  {


    //default not selected
    /**
     * to avoid RAM Lost
     */
    selectedTextAllow ??= false;

    //fix null
    s ??= "";





    //style
    var myStyle = TextStyle(
        fontSize: fontSize,
        color: colorText,
        fontFamily: fontFamily,
      height: 1.0, //space between lines
      decoration:  textDecoration,
      decorationColor: colorText,
    );

    //view
    Widget viewChild = _chooseChildWhenPressed(s, textAlign, myStyle, maxLines, onPressed , selectedTextAllow );


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
          decoration:  decoration_background,
          alignment: align,
      )  ;
     // Log.i( "fixed size");
    }   else {
      container = Container(  child: viewChild,
          alignment: align,
          margin: margin,
          padding : padding,
          decoration: decoration_background
      )  ;
    }

    return container;

  }

  //-------------------------------------------------------------------------- base

  static Widget _text_without_surround(String s, TextAlign textAlign,
      TextStyle myStyle, int? maxLines, bool selectedTextAllow ) {

    //choose type
    Widget chooseTxt ;
    if( selectedTextAllow ) {
      chooseTxt =  SelectableText( s ,
          // Cursor
          cursorColor: Colors.grey,
          showCursor: selectedTextAllow,
          //style
          textAlign: textAlign,
          maxLines: maxLines,
          style: myStyle );

    } else {
      //normal
      chooseTxt =  Text( s ,
          textAlign: textAlign,
          maxLines: maxLines,
          style: myStyle );
    }


    //seo
    return chooseTxt;
  }



  static Widget _chooseChildWhenPressed(String s, TextAlign textAlign, TextStyle myStyle,
      int? maxLines, VoidCallback? onPressed, bool selectedTextAllow ) {

    //simple text
    Widget text   = _text_without_surround(s ,  textAlign, myStyle, maxLines , selectedTextAllow);

    if( onPressed != null ) {
      return _GestureDetector(text, onPressed);
    }  else {
      return text;
    }
  }

  static Widget _GestureDetector(Widget child, VoidCallback onPressed) {



    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: child,
    );
  }


}
