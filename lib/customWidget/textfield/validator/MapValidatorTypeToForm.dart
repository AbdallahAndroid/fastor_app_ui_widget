
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorType.dart';
import 'package:flutter/material.dart';

class MapValidatorTypeToForm {


  static FormFieldValidator<String> map(ValidatorType type , String error_text ){
    switch(type) {
      case ValidatorType.defaultValidator : return ValidatorApp.d( error_text: error_text );
      case ValidatorType.email : return ValidatorApp.email( error_text: error_text );
      case ValidatorType.password : return ValidatorApp.pass( error_text: error_text );
      case ValidatorType.phone : return ValidatorApp.mobile(  error_text: error_text );
      case ValidatorType.description : return ValidatorApp.d( error_text: error_text );
      case ValidatorType.name : return ValidatorApp.name( error_text: error_text );
      case ValidatorType.nameFull : return ValidatorApp.nameFull( error_text: error_text );
      case ValidatorType.moreThan2Char : return ValidatorApp.moreThan2( error_text: error_text );
      case ValidatorType.emailOrPhone : return ValidatorApp.moreThan2( error_text: error_text );
    }
    return  ValidatorApp.d( error_text : error_text );
  }


}