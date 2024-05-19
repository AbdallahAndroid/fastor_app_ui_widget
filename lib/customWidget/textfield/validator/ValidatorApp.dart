import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';
import 'package:flutter/material.dart';

class ValidatorApp {

  //--------------------------------------------------------------------- default

  /**
   * "d" means default
   */
  static FormFieldValidator<String> d({String? error_text}){

    error_text ??= "Missed";

    return ( textValidator) {
      if ( textValidator == null || textValidator.isEmpty) {
        return error_text;
      }
      return null;
    };
  }


  static FormFieldValidator<String> error( {String? error_text} ){

    error_text ??= "Missed";

    return ( textValidator) {
      if ( textValidator == null || textValidator.isEmpty) {
        return error_text;
      }
      return null;
    };
  }

  //------------------------------------------------------------------- special

  static FormFieldValidator<String> mobile( {String? error_text}){

    error_text ??= "Missed";

    return ( text ) {

      if ( ToolsValidation.isPhoneMobileValid( text) == false ) {
        return error_text;
      }

      return null;
    };
  }



  static FormFieldValidator<String> pass( {String? error_text} ){

    error_text ??= "Missed";

    return ( text ) {

      if ( ToolsValidation.isPasswordValid( text) == false ) {
        return error_text;
      }

      return null;
    };
  }


  static FormFieldValidator<String> name( {String? error_text} ){

    error_text ??= "Missed";

    return ( text ) {

      if ( ToolsValidation.isName( text) == false ) {
        return error_text;
      }

      return null;
    };
  }


  static FormFieldValidator<String> nameFull( {String? error_text} ){

    error_text ??= "Missed";

    return ( text ) {

      if ( ToolsValidation.isNameFull( text) == false ) {
        return error_text;
      }

      return null;
    };
  }


  static FormFieldValidator<String> moreThan2( {String? error_text}){

    error_text ??= "Missed";

    return ( text ) {

      if ( ToolsValidation.isMoreThan2( text) == false ) {
        return error_text;
      }

      return null;
    };
  }

  static FormFieldValidator<String> email( {String? error_text}){

    error_text ??= "Missed";

    return ( text ) {

      if ( ToolsValidation.isEmail( text) == false ) {
        return error_text;
      }

      return null;
    };
  }

  static FormFieldValidator<String> emailOrPhone( {String? error_text}){

    error_text ??= "Missed";

    return ( text ) {

      bool isPhoneOrEmail = ToolsValidation.isEmail( text) || ToolsValidation.isPhoneMobileValid( text);
      if ( isPhoneOrEmail == false ) {
        return error_text;
      }

      return null;
    };
  }
  //-----------------------------------------------------------------------  by lengh

  static FormFieldValidator<String> min(int len ){

    String error_text = "Missed";

    return ( text ) {

      if ( ToolsValidation.isEmpty( text) == false ) {
        return error_text;
      }

      //min
      if (   text!.length < len ) {
        return error_text;
      }

      return null;
    };
  }


  static FormFieldValidator<String> max(int len ){

    String error_text = "Missed";

    return ( text ) {

      if ( ToolsValidation.isEmpty( text) == false ) {
        return error_text;
      }

      //max
      if (   text!.length > len ) {
        return error_text;
      }

      return null;
    };
  }


  static FormFieldValidator<String> equal(int len ){

    String error_text = "Missed";

    return ( text ) {

      if ( ToolsValidation.isEmpty( text) == false ) {
        return error_text;
      }

      //equal
      if (   text!.length != len ) {
        return error_text;
      }

      return null;
    };
  }


}