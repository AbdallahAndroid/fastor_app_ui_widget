
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:flutter/material.dart';


class TextFieldEmailFocusAndUnFocusBoarder extends StatefulWidget {

  String label;
  OutlineInputBorder? focus;
  OutlineInputBorder? unfocus;
  TextEditingController controller;
  String? errorMessage;
  FormFieldValidator<String>? validatorCustom;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;
  ValueChanged<String>? onChanged;

  TextFieldEmailFocusAndUnFocusBoarder({
    required this.label,
    required this.controller,
    this.validatorCustom,
    this.onChanged,
    this.errorMessage,
    this.errorKeySearchingInErrorMessageArray,
    this.errorsMessageArray,
    this.focus,
    this.unfocus
});


  @override
  _TextFieldEmailFocusAndUnFocusBoarderState createState()  => _TextFieldEmailFocusAndUnFocusBoarderState();
}

class _TextFieldEmailFocusAndUnFocusBoarderState extends State<TextFieldEmailFocusAndUnFocusBoarder> {

  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    // Log.i("TextFieldEmailFocusAndUnFocusBoarder - build() email **** "  );
    // Log.i("TextFieldEmailFocusAndUnFocusBoarder - build() error: " + widget.errorsMessageArray.toString() );
    // Log.i("TextFieldEmailFocusAndUnFocusBoarder - build() errorMessage: " + widget.errorMessage.toString() );
    return TextFieldApp(
      autovalidateMode:  AutovalidateMode.onUserInteraction,
      validatorCustom:   ValidatorApp.email(error_text: "email address not valid".tra()),
      errorMessage: widget.errorMessage,
      errorKeySearchingInErrorMessageArray: widget.errorKeySearchingInErrorMessageArray,
      errorsMessageArray: widget.errorsMessageArray,
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      decoration: getInputDecorationSwitchBetweenFocusOrUnFocus(),
        onChanged: (text)  {
          // widget.errorMessage = null;
          setState(() => _hasFocus = text.isNotEmpty);
          if(widget.onChanged != null ) widget.onChanged!(text);


        }
    );
  }


  getInputDecorationSwitchBetweenFocusOrUnFocus() {
    return  InputDecoration(
      fillColor: Colors.grey,
      filled: true,
      contentPadding:  EdgeInsets.symmetric(
          horizontal: 10 ,
          vertical: 5
      ),
      labelText: _hasFocus ? widget.label : null, // Hide label when not focused
      hintText: widget.label, // Display hint text for initial state
      hintStyle: TextStyle( color: Colors.grey ),
      focusedBorder: widget.focus?? OutlineInputBorder(
        borderRadius: BorderRadius.all( Radius.circular(8)),
        borderSide:   BorderSide(color: Colors.green, width: 2.0),
      ),
      enabledBorder: widget.unfocus??OutlineInputBorder(
        borderRadius: BorderRadius.all( Radius.circular(8)),
        borderSide:  BorderSide(color: Colors.grey, width: 2.0),
      ),
    );
  }

}
/**
 *

 */