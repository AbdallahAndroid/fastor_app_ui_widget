import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';

class TextFormFieldTemplate {

  static TextFormField mobile(){
    return TextFormField( validator: ValidatorTemplate.mobile(error_text: "Missed Phone"));
  }


}