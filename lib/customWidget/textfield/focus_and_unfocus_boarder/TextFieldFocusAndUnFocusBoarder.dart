
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';

class TextFieldFocusAndUnFocusBoarder extends StatefulWidget {

  String label;
  OutlineInputBorder? focus;
  OutlineInputBorder? unfocus;
  TextEditingController controller;
  String? errorMessage;
  String? errorValidateMissed;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;
  FormFieldValidator<String>? validatorCustom;
  ValueChanged<String>? onChanged;

  TextFieldFocusAndUnFocusBoarder({
    required this.label,
    required this.controller,
    this.validatorCustom,
    this.onChanged,
    this.errorMessage,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
    // this.errorValidateMissed,
    this.focus,
    this.unfocus
});


  @override
  _TextFieldState createState()  => _TextFieldState();
}

class _TextFieldState extends State<TextFieldFocusAndUnFocusBoarder> {

  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    if( widget.errorMessage != null ) {
      // Log.i("TextFieldFocusAndUnFocusBoarder - widget.errorMessage: ${widget.errorMessage}");
    }
    return TextFieldApp(
      autovalidateMode:  AutovalidateMode.onUserInteraction,
      validatorCustom:    ValidatorApp.name(),
      errorsMessageArray: widget.errorsMessageArray,
      errorKeySearchingInErrorMessageArray:  widget.errorKeySearchingInErrorMessageArray,
      errorMessage: widget.errorMessage,
      controller: widget.controller,
      decoration: getInputDecorationSwitchBetweenFocusOrUnFocus(),
      // decorationBackground: BoarderHelper.cardView(
      //   radiusSize: 8,
      //   colorLine: Colors.transparent,
      //   colorBackground:  Colors.grayBackgroundCardview
      // ),
      onChanged: (text)  {
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