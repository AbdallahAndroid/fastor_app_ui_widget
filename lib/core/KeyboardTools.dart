
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:flutter/material.dart';

class KeyboardTools {

  static Future<bool> dismiss(BuildContext context ) async  {
    FocusScope.of( context).unfocus();
    return true;
  }


  static bool isKeyboardOpening(BuildContext? context ) {
    if( context == null ) return false;
    var result =  MediaQuery.of(context).viewInsets.bottom != 0;
    Log.i("isKeyboardOpening() - result: $result");
    return result;
  }

  static bool isKeyboardClosed(BuildContext? context ) {

    return ! isKeyboardOpening( context);
  }

}