import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/ds/LevelDS.dart';


import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';

import '../TextFieldTemplateBase.dart';
import '../validator/MapValidatorTypeToForm.dart';
import '../validator/ValidatorType.dart';


class TextFieldFastor extends StatelessWidget {

  // validate
  FormFieldValidator<String>? validatorCustom;
  FormFieldValidator<String> validatorChosen = ValidatorTemplate.d(
      error_text: "Missed");
  AutovalidateMode? autovalidateMode;
  // ValidatorType? validatorType;

  //text and hint
  String? hint_text;
  Color? text_color;
  double? fontSize;
  String? fontFamily;
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
  Color? errorColor;

  //other
  TextAlign? textAlign;
  FocusNode? focusNode;

  //icon
  Widget? prefixIcon;
  Widget? suffixIcon;

  TextFieldFastor({
    // validate
    this.validatorCustom,
    // this.validatorType,
    this.autovalidateMode,


    //text and hint
    this.hint_text,
    this.text_color,
    this.fontSize,
    this.hint_color,
    this.fontFamily,

    //boarder and underline
    this.isRemoveUnderline = false,
    this.isShowBoarder,

    //background
    this.background_color,
    this.decoration, //at the Container

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

    //errors
    this.errorColor,

    //other
    this.textAlign,
    this.focusNode,

    //icon
    this.prefixIcon, //example "icon" left of textField
    this.suffixIcon

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
    bool isPass = keyboardType != null &&
        keyboardType == TextInputType.visiblePassword;
    if (isPass) {
      obscureText = true;
    }

    //error message
    errorColor ??= Colors.red;

    //choose validator
    autovalidateMode ??= AutovalidateMode.disabled;
    _setValidator();
  }

  @override
  Widget build(BuildContext context) {
    //get tf
    TextFormField tf = _getTextFourmField();

    // //fix textfield not materail
    // var materialApp = Material(
    //   child: tf,
    //   color: background_color,
    // );

    //ct
    // var ct = TextFieldTemplateBase.getContainer( materialApp, width, margin, decoration);
    var container = Container(
      child: tf,
      width: width,
      // height: height,
      margin: margin,
      // padding: padding,
      decoration: decoration,
    );
    return container;
  }


  TextFormField _getTextFourmField() {
    //textfield
    var tf = TextFormField(
      //validate error
      autovalidateMode: autovalidateMode,
      validator: validatorChosen,

      //text align
      textAlign: textAlign!,

      // //text size
      style: TextStyle(color: text_color, fontSize: fontSize, fontFamily: fontFamily),

      //password keyboard
      obscureText: obscureText,

      // cursor color
      cursorColor: hint_color,

      //padding + hint + underline
      decoration: TextFieldTemplateBase.getDecorationInput(
          isShowBoarder,
          padding!,
          hint_text,
          hint_color!,
          fontSize!,
          isRemoveUnderline!,
          prefixIcon,
          suffixIcon,
          errorColor!,
          autovalidateMode!,
          null),

      //keyboard
      keyboardType: keyboardType,
      //TextInputType.number

      //controller
      controller: controller,

      //change
      onChanged: onChanged,

      //submit
      onFieldSubmitted: onChanged,

      //max length
      maxLength: maxLength,
      buildCounter: (BuildContext context,
          {int? currentLength, int? maxLength, bool? isFocused}) => null,

      //lines
      maxLines: maxLines,
      minLines: minLines,

      focusNode: focusNode,


    );

    return tf;
  }

  //--------------------------------------------------------------- validator

  void _setValidator() {
    //set default
    validatorChosen = ValidatorTemplate.d();

    //priority for custom
    if (validatorCustom != null) {
      validatorChosen = validatorCustom!;
      // print("_setValidator() - type (validatorChosen)");
      return;
    }
  }


}