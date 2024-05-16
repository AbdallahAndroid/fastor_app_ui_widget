import 'package:fastor_app_ui_widget/resource/template/textfield/stateless/TextFieldFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
import 'package:flutter/material.dart';

import 'OTPTextFieldFastor.dart';

extension TextFieldsOtp on OTPFastorState  {


  Widget tf_1(){
    if(widget.countNumber < 1 ) return SizedBox();
    return TextFieldFastor(
        width: widget.widthOTP,
        padding: EdgeInsets.symmetric(vertical: widget.heightByPadding! ), //to set height
        maxLength: 1,
        textAlign: TextAlign.center,
        focusNode: tf1_node,
        autovalidateMode: tf1_valid,
        decorationBackground: widget.decoration,
        fontSize: widget.fontSize,
        text_color: widget.colorText,
        hint_color: widget.colorHint,
        fontFamily: widget.fontFamily,
        validatorCustom: ValidatorTemplate.equal( 1 ),
        keyboardType: TextInputType.number,
        onChanged: (s){
          //set value
          tf1_txt = s;

          //focus to after check have value
          if( s.length >= 1 ) {
            /**
                fix user when clear number to change previous writing
             */
            FocusScope.of(context).requestFocus(tf2_node);
          }


          //call back
          updateCallBack();
        },
        margin: EdgeInsets.only( right: widget.margin!)
    );
  }


  Widget tf_2(){
    if(widget.countNumber < 2 ) return SizedBox();

    return TextFieldFastor(
        width: widget.widthOTP,
        padding: EdgeInsets.symmetric(vertical: widget.heightByPadding! ), //to set height
        maxLength: 1,
        textAlign: TextAlign.center,
        focusNode: tf2_node,
        autovalidateMode: tf2_valid,
        decorationBackground: widget.decoration,
        fontSize: widget.fontSize,
        text_color: widget.colorText,
        hint_color: widget.colorHint,
        fontFamily: widget.fontFamily,
        validatorCustom: ValidatorTemplate.equal( 1 ),
        keyboardType: TextInputType.number,
        onChanged: (s){
          //set value
          tf2_txt = s;

          //focus to after check have value
          if( s.length >= 1 ) {
            FocusScope.of(context).requestFocus(tf3_node);
          }

          //focus to previous
          if( s == "" ) {
            FocusScope.of(context).requestFocus(tf1_node);
          }

          //call back
          updateCallBack();
        },
        margin: EdgeInsets.only( right: widget.margin! )
    );
  }


  Widget tf_3(){
    if(widget.countNumber < 3 ) return SizedBox();

    return TextFieldFastor(
        width: widget.widthOTP,
        padding: EdgeInsets.symmetric(vertical: widget.heightByPadding! ), //to set height
        maxLength: 1,
        textAlign: TextAlign.center,
        focusNode: tf3_node,
        autovalidateMode: tf3_valid,
        decorationBackground: widget.decoration,
        fontSize: widget.fontSize,
        text_color: widget.colorText,
        hint_color: widget.colorHint,
        fontFamily: widget.fontFamily,
        validatorCustom: ValidatorTemplate.equal( 1 ),
        keyboardType: TextInputType.number,
        onChanged: (s){
          //set value
          tf3_txt = s;

          //focus to after check have value
          if( s.length >= 1 ) {
            FocusScope.of(context).requestFocus(tf4_node);
          }

          //focus to previous
          if( s == "" ) {
            FocusScope.of(context).requestFocus(tf2_node);
          }

          //call back
          updateCallBack();
        },
        margin: EdgeInsets.only( right: widget.margin! )
    );
  }


  Widget tf_4(){
    if(widget.countNumber < 4 ) return SizedBox();

    return TextFieldFastor(
        width: widget.widthOTP,
        padding: EdgeInsets.symmetric(vertical: widget.heightByPadding! ), //to set height
        maxLength: 1,
        textAlign: TextAlign.center,
        focusNode: tf4_node,
        decorationBackground: widget.decoration,
        fontSize: widget.fontSize,
        text_color: widget.colorText,
        hint_color: widget.colorHint,
        fontFamily: widget.fontFamily,
        autovalidateMode: tf4_valid,
        validatorCustom: ValidatorTemplate.equal( 1 ),
        keyboardType: TextInputType.number,
        onChanged: (s){
          //set value
          tf4_txt = s;

          //focus to after check have value
          if( s.length >= 1 ) {
            FocusScope.of(context).requestFocus(tf5_node);
          }

          //focus to previous
          if( s == "" ) {
            FocusScope.of(context).requestFocus(tf3_node);
          }

          //call back
          updateCallBack();
        },
        margin: EdgeInsets.only( right: widget.margin! )
    );
  }


  Widget tf_5(){
    if(widget.countNumber < 5 ) return SizedBox();

    return TextFieldFastor(
        width: widget.widthOTP,
        padding: EdgeInsets.symmetric(vertical: widget.heightByPadding! ), //to set height
        maxLength: 1,
        textAlign: TextAlign.center,
        focusNode: tf5_node,
        autovalidateMode: tf5_valid,
        validatorCustom: ValidatorTemplate.equal( 1 ),
        keyboardType: TextInputType.number,
        decorationBackground: widget.decoration,
        fontSize: widget.fontSize,
        text_color: widget.colorText,
        hint_color: widget.colorHint,
        fontFamily: widget.fontFamily,
        onChanged: (s){
          //set value
          tf5_txt = s;

          //focus to after check have value
          if( s.length >= 1 ) {
            FocusScope.of(context).requestFocus(tf6_node);
          }

          //focus to previous
          if( s == "" ) {
            FocusScope.of(context).requestFocus(tf4_node);
          }


          //call back
          updateCallBack();
        },
        margin: EdgeInsets.only( right: widget.margin! )
    );
  }


  Widget tf_6(){
    if(widget.countNumber < 6 ) return SizedBox();

    return TextFieldFastor(
      width: widget.widthOTP,
      padding: EdgeInsets.symmetric(vertical: widget.heightByPadding! ), //to set height
      maxLength: 1,
      decorationBackground: widget.decoration,
      fontSize: widget.fontSize,
      text_color: widget.colorText,
      hint_color: widget.colorHint,
      textAlign: TextAlign.center,
      focusNode: tf6_node,
      fontFamily: widget.fontFamily,
      autovalidateMode: tf6_valid,
      validatorCustom: ValidatorTemplate.equal( 1 ),
      keyboardType: TextInputType.number,
      onChanged: (s){
        //set value
        tf6_txt = s;

        //call back
        updateCallBack();

        //focus to previous
        if( s == "" ) {
          FocusScope.of(context).requestFocus(tf5_node);
        }

      },
      //  margin: EdgeInsets.only( right: DSDimen.space_level_3)
    );
  }

}