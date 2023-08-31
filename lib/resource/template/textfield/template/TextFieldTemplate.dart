import 'package:fastor_app_ui_widget/resource/resources/ds/LevelDS.dart';


import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';

import '../TextFieldTemplateBase.dart';


/// use class "ValidatorTemplate" to change type of input field "name, email,..etc"
@Deprecated( "Used class `TextFieldStateLessFastor()`  instead")
class TextFieldTemplate   {



  static Widget t(
      {
        // validate
        FormFieldValidator<String>? validator,
        AutovalidateMode? autovalidateMode,
        String? error_text = "Missed",

        //text and hint
        String? hint_text,
        Color? text_color,
        double? fontSize,
        Color? hint_color,

        //boarder and underline
        bool isRemoveUnderline = false,
        bool? isShowBoarder,

        //background
        Color? background_color,
        Decoration? decoration,              //at the Container

        //spaces
        EdgeInsets? padding,
        EdgeInsets? margin,

        //controller
        TextEditingController? controller,
        ValueChanged<String>? onChanged,

        //input content type
        TextInputType? keyboardType,
        bool obscureText = false,

        //size and max/min
        double? width,
        int? maxLength,
        int? maxLines,
        int? minLines,

        //other
        TextAlign? textAlign  ,
        FocusNode? focusNode,
        Widget? prefixIcon         //example "icon" left of textField
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

    //get tf
    TextFormField tf = _getTextFourmField(obscureText, autovalidateMode, error_text,
        validator, text_color, fontSize, hint_color, isShowBoarder,
        padding, hint_text, keyboardType, controller, onChanged,
        textAlign , maxLength, focusNode, maxLines , minLines,
        isRemoveUnderline, prefixIcon);


    //fix textfield not materail
    var materialApp = Material(
      child: tf,
      color: background_color,
    );


    //ct
    var ct = TextFieldTemplateBase.getContainer( materialApp, width, margin, decoration);
    return ct;
  }


  static TextFormField _getTextFourmField(bool obscureText,
      AutovalidateMode? autovalidateMode, String? error_text, FormFieldValidator<String>? validator,
      Color text_color, double fontSize, Color hint_color, bool? isShowBoarder,
      EdgeInsets padding, String? hint_text, TextInputType? keyboardType,
      TextEditingController? controller, ValueChanged<String>? onChanged,
      TextAlign  textAlign, int? maxLength, FocusNode? focusNode,
      int? maxLine , int? minLines , bool isRemoveUnderline, Widget? prefixIcon){

    //textfield
    var tf = TextFormField (

      //password keyboard
      obscureText : obscureText,
      autovalidateMode: autovalidateMode,

      textAlign: textAlign ,

      //validate error
      validator:  TextFieldTemplateBase.getTextValidator(error_text!, validator),

      //text style
      style: TextStyle( color: text_color, fontSize: fontSize),

      //cursor color
      cursorColor: hint_color,

      //padding + hint + underline
      decoration: TextFieldTemplateBase.getDecorationInput(isShowBoarder, padding,
          hint_text, hint_color, fontSize, isRemoveUnderline, prefixIcon, null, Colors.red,
          autovalidateMode!, null ),

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
      maxLines: maxLine,
      minLines: minLines,

      focusNode: focusNode,

    );

    return tf;
  }

}