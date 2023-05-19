import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

class MapValidatorTypeToForm {


  static FormFieldValidator<String> map(ValidatorType type , String error_text ){
    switch(type) {
      case ValidatorType.defaultValidator : return ValidatorTemplate.d( error_text: error_text );
      case ValidatorType.email : return ValidatorTemplate.email( error_text: error_text );
      case ValidatorType.password : return ValidatorTemplate.pass( error_text: error_text );
      case ValidatorType.phone : return ValidatorTemplate.mobile(  error_text: error_text );
      case ValidatorType.description : return ValidatorTemplate.d( error_text: error_text );
      case ValidatorType.name : return ValidatorTemplate.name( error_text: error_text );
      case ValidatorType.nameFull : return ValidatorTemplate.nameFull( error_text: error_text );
      case ValidatorType.moreThan2Char : return ValidatorTemplate.moreThan2( error_text: error_text );
    }
    return  ValidatorTemplate.d( error_text : error_text );
  }


}