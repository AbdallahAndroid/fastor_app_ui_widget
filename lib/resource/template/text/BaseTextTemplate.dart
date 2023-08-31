

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/LevelDS.dart';

import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemTools.dart';

import 'package:fastor_app_ui_widget/resource/template/constants/TemplateSize.dart';
import 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';



abstract class BaseTextTemplate  {

  static Widget normal(String?  s ,  {
    TextAlign textAlign = TextAlign.left,
    Color? colorOpt = Colors.black ,
    TextDecoration? textDecoration = TextDecoration.none,
    double dimenOpt = 0,
    String? fontFamily,
    EdgeInsets? margin,
    EdgeInsets? padding = EdgeInsets.zero,

    Decoration? decoration_background, // must before use this use also width fixed and height
    double? width,
    double? height,

    TemplateSize? templateSize = TemplateSize.wrap,
    VoidCallback? onPressed,
    Alignment? align = Alignment.topLeft,

    bool? selectedTextAllow ,

    //level
    LevelDS? dsLevel,

    //lines
    int? maxLines
  })  {

    //default
    dsLevel ??= LevelDS.l2;

    //default not selected
    /**
     * to avoid RAM Lost
     */
    selectedTextAllow ??= false;

    //fix null
    s ??= "";



    //set default dimen
    var myDimen = DSDimen.text_level_1;
    if ( dimenOpt != 0 ) {
      myDimen = dimenOpt;
    }

    //color
    Color myColor = DSColor.text_h1;
    if  ( colorOpt != null ) {
      myColor = colorOpt;
    }

    //style
    var myStyle = TextStyle(
        fontSize: myDimen,
        color: myColor,
        fontFamily: fontFamily,
      height: 1.0, //space between lines
      decoration:  textDecoration,
      decorationColor: myColor,
    );

    //view
    Widget viewChild = _chooseChildWhenPressed(s, textAlign, myStyle, maxLines, onPressed , selectedTextAllow, dsLevel);

    //get fixed size
    Size? fixedSize = DesignSystemTools.getFixedSize(width, height, dimenOpt);

    //size
    Widget? container = null;
    if ( fixedSize != null ) {
      container = ContainerTemplate.fixedSize( viewChild, fixedSize, margin, padding, decoration_background, align)  ;
     // Log.i( "fixed size");
    } else if ( templateSize == TemplateSize.match ) {
      container = ContainerTemplate.matchParent( viewChild, margin : margin, padding : padding, decoration : decoration_background, align : align)  ;
    }  else {
      container = ContainerTemplate.wrapContent( viewChild,
          margin: margin, padding : padding,
          decoration: decoration_background,
          align : align)  ;
    }

    return container;

  }

  //-------------------------------------------------------------------------- base

  static Widget _text_without_surround(String s, TextAlign textAlign,
      TextStyle myStyle, int? maxLines, bool selectedTextAllow, LevelDS dsLevel) {

    //choose type
    Widget chooseTxt ;
    if( selectedTextAllow ) {
      chooseTxt =  SelectableText( s ,
          // Cursor
          cursorColor: DSColor.cursor_selectedText,
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
      int? maxLines, VoidCallback? onPressed, bool selectedTextAllow, LevelDS dsLevel) {

    //simple text
    Widget text   = _text_without_surround(s ,  textAlign, myStyle, maxLines , selectedTextAllow, dsLevel);

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
