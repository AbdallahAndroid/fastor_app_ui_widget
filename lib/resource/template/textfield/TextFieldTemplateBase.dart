

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:flutter/material.dart';


import 'package:fastor_app_ui_widget/resource/template/container/ContainerTemplate.dart';


@Deprecated("this used by old TextFieldTemplate while stopped used by TextFieldFastor")
class TextFieldTemplateBase    {


  //--------------------------------------------------------------- tools

  static InputDecoration getDecorationInput(bool?  isShowBoarder, EdgeInsets padding,
      String? hint_text, Color hint_color, double fontSize,
      bool isRemoveUnderline, Widget? prefixIcon, Widget? suffixIcon,
      Color  errorColor, AutovalidateMode autovalidateMode, String? messageBackend) {

    //default
    isShowBoarder ??= false;

    if( isShowBoarder ) {
      return getDecorationInput_outlineInput( isShowBoarder, padding, hint_text,
          hint_color, fontSize, isRemoveUnderline,
          prefixIcon, suffixIcon, errorColor,   autovalidateMode,  messageBackend);
    } else {
      return getDecorationInput_underLine( isShowBoarder, padding, hint_text,
          hint_color, fontSize, isRemoveUnderline,
          prefixIcon, suffixIcon, errorColor,     autovalidateMode,  messageBackend);
    }
  }


  static InputDecoration getDecorationInput_outlineInput(bool isShowBoarder,
      EdgeInsets padding, String? hint_text,
      Color hint_color, double fontSize, bool isRemoveUnderline,
      Widget? prefixIcon,  Widget? suffixIcon, Color  errorColor,
      AutovalidateMode autovalidateMode, String? messageBackend) {


    //check is need to remove underline
    double widthUnderLine = 1;
    if( isRemoveUnderline ) {
      widthUnderLine = 0;
    }


    var boarderSide = BorderSide(color: DSColor.ds_textfield_boarder_line,
        width: widthUnderLine);

    var enabledBorder =  OutlineInputBorder(
      borderRadius: BorderRadius.circular(DSDimen.ds_size_corner_level_2),
      borderSide:    boarderSide,
    );

    var  focusedBorder  = OutlineInputBorder(
      borderRadius: BorderRadius.circular( DSDimen.ds_size_corner_level_2), //32.0
      borderSide:  boarderSide  ,
    );

    //error
    var errorBorder =  OutlineInputBorder(
      borderSide: BorderSide(
        color: errorColor, // Customize the error underline color
      ),
    );
    var focusedErrorBorder =  OutlineInputBorder(
        borderSide: BorderSide(
          color: errorColor, // Customize the focused error underline color
        ));

    //return value
    return InputDecoration(

      //remove default padding and set custom
        isDense: true,
        contentPadding: padding,

        //hint text
        hintText: hint_text,

        //hint color
        hintStyle: TextStyle(color: hint_color, fontSize: fontSize),

        // underline customer color
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,

        //error text
        errorStyle:   TextStyle(color: errorColor, fontWeight: FontWeight.w500, fontSize: 10),
        errorText : messageBackend,

        //error boarder
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,

        //other
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
    );
  }


  static InputDecoration getDecorationInput_underLine(bool  isShowBoarder, EdgeInsets padding, String? hint_text,
      Color hint_color, double fontSize, bool isRemoveUnderline,
      Widget? prefixIcon, Widget? suffixIcon, Color  errorColor,
      AutovalidateMode autovalidateMode, String? messageBackend) {


    //check is need to remove underline
    double widthUnderLine = 1;
    if( isRemoveUnderline ) {
      widthUnderLine = 0;
    }

    var enabledBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: hint_color, width: widthUnderLine),
    );

    var focusedBoarder = UnderlineInputBorder(
      borderSide: BorderSide(color: hint_color, width: widthUnderLine),
    );


    //error
    var errorBorder =  UnderlineInputBorder(
      borderSide: BorderSide(
        color: errorColor, // Customize the error underline color
      ),
    );
    var focusedErrorBorder =  UnderlineInputBorder(
        borderSide: BorderSide(
          color: errorColor, // Customize the focused error underline color
        ));

    //return value
    return InputDecoration(

      //remove default padding and set custom
      isDense: true,
      contentPadding: padding,

      //hint text
      hintText: hint_text,

      //hint color
      hintStyle: TextStyle(color: hint_color, fontSize: fontSize),

      // underline customer color
      enabledBorder: enabledBorder,
      focusedBorder: focusedBoarder,

      //error text
      errorText : messageBackend,
      errorStyle:   TextStyle(color: errorColor, fontWeight: FontWeight.w500, fontSize: 10),

      //error boarder
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,

      //other
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon
    );
  }


  static FormFieldValidator<String> getTextValidator(String error_text, FormFieldValidator<String>? validator) {

    //check found
    if ( validator != null ) {
      return validator;
    }

    //default
    return ( textValidator) {
      if ( textValidator == null || textValidator.isEmpty) {
        return error_text;
      }
      return null;
    };
  }


  static Widget getContainer(Widget child, double? width, EdgeInsets? margin, Decoration? decoration_background) {

    //fixed width
    if( width != null ){
      return ContainerTemplate.fixedWidth(child, width, margin, null, decoration_background, null );
    }

    //default
    var ct = ContainerTemplate.wrapContent( child, margin: margin,  decoration:  decoration_background  );
    return ct;
  }



}
