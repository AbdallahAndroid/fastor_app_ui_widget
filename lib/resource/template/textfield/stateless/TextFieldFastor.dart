import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/ds/LevelDS.dart';


import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';

import '../TextFieldTemplateBase.dart';



class TextFieldFastor extends StatelessWidget {

  // validate
  FormFieldValidator<String>? validator;
  AutovalidateMode? autovalidateMode;


  //text and hint
  String? hint_text;
  Color? text_color;
  double? fontSize;
  Color? hint_color;

  //boarder and underline
  bool isRemoveUnderline = false;
  bool? isShowBoarder;

  //background
  Color? background_color;
  Decoration? decoration; //at the Container

  //spaces
  EdgeInsets? padding;
  EdgeInsets? margin;

  //controller
  TextEditingController? controller;
  ValueChanged<String>? onChanged;

  //input content type
  TextInputType? keyboardType;
  bool obscureText = false;

  //size and max/min
  double? width;
  int? maxLength;
  int? maxLines;
  int? minLines;

  //error
  String? errorBackendKeyJson;
  Map<String, dynamic>? errorBackendJson;
  String? error_text = "Missed";
  Color? errorColor ;

  //other
  TextAlign? textAlign;
  FocusNode? focusNode;
  Widget? prefixIcon;

  TextFieldFastor( {
    // validate
    this.validator,
    this.autovalidateMode,


    //text and hint
    this.hint_text,
    this.text_color,
    this.fontSize,
    this.hint_color,

    //boarder and underline
    this.isRemoveUnderline = false,
    this.isShowBoarder,

    //background
    this.background_color,
    this.decoration,              //at the Container

    //spaces
    this.padding,
    this.margin,

    //controller
    this.controller,
    this.onChanged,

    //input content type
    this.keyboardType,
    this.obscureText = false,

    //size and max/min
    this.width,
    this.maxLength,
    this.maxLines,
    this.minLines,

    //errors handler
    this.error_text = "Missed",  //fixed
    this.errorBackendJson,
    this.errorBackendKeyJson,
    this.errorColor,

    //other
    this.textAlign  ,
    this.focusNode,
    this.prefixIcon         //example "icon" left of textField
  }) {


    //padding default
    padding ??= EdgeInsets.zero;

    //hint color
    hint_color ??= DSColor.ds_textfield_hint;

    //text color
    text_color ??= DSColor.ds_textfield_text;

    //text size
    fontSize ??= DSDimen.text_level_2;

    //align
    textAlign ??= TextAlign.start;

    //password
    bool isPass = keyboardType != null && keyboardType == TextInputType.visiblePassword;
    if(  isPass) {
      obscureText = true;
    }

    //error
    error_text = _getErrorText();
    errorColor ??= Colors.red;
  }

  @override
  Widget build(BuildContext context) {

    //get tf
    TextFormField tf = _getTextFourmField( );

    //fix textfield not materail
    var materialApp = Material(
      child: tf,
      color: background_color,
    );


    //ct
    // var ct = TextFieldTemplateBase.getContainer( materialApp, width, margin, decoration);
    var container = Container(
      child: materialApp,
      width: width,
      // height: height,
      margin: margin,
      // padding: padding,
      decoration: decoration,
    );
    return container;
  }



  TextFormField _getTextFourmField( ){

    //textfield
    var tf = TextFormField (

      //password keyboard
      obscureText : obscureText,
      autovalidateMode: autovalidateMode,

      textAlign: textAlign! ,

      //validate error
      validator:  TextFieldTemplateBase.getTextValidator(error_text!, validator),

      //text style
      style: TextStyle( color: text_color, fontSize: fontSize),

      //cursor color
      cursorColor: hint_color,

      //  static InputDecoration getDecorationInput(bool?  isShowBoarder, EdgeInsets padding, String? hint_text,
      //       Color hint_color, double fontSize, bool isRemoveUnderline, Widget? prefixIcon) {
      //padding + hint + underline
      decoration: TextFieldTemplateBase.getDecorationInput(isShowBoarder , padding!, hint_text,
          hint_color!, fontSize!, isRemoveUnderline!, prefixIcon, errorColor!, error_text!),

      //keyboard
      keyboardType: keyboardType, //TextInputType.number

      //controller
      controller: controller,

      //change
      onChanged: onChanged,

      //submit
      onFieldSubmitted: onChanged,

      //max length
      maxLength: maxLength,
      buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,

      //lines
      maxLines: maxLines,
      minLines: minLines,

      focusNode: focusNode,

    );

    return tf;
  }

  String  _getErrorText( ) {
    final defaultErrorMessage = error_text!;
    if( errorBackendKeyJson == null ) return defaultErrorMessage;
    if( errorBackendJson == null ) return defaultErrorMessage;
    if( errorBackendJson!.containsKey(errorBackendKeyJson!) == false ) return defaultErrorMessage;
    return errorBackendJson!["" + errorBackendKeyJson!][0];
  }
}