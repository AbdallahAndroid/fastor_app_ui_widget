
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';

class ToolsKeyboard {

  /**------ example
   *
   *   final FocusNode textFieldFocusNode = FocusNode();
   *
   *
   *   TextField(
      focusNode: textFieldFocusNode,
   */
  static void textFieldRemoveFocus( FocusNode textFieldFocusNode  ) {
    textFieldFocusNode.unfocus();
  }


  static Future<bool> dismiss(BuildContext context ) async  {
    // Use primaryFocus to get the currently focused node and unfocus it
    // This is more reliable than FocusScope.of(context).unfocus()

    /// first line hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    /// second line hide keyboard
    FocusScope.of(context).unfocus();
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