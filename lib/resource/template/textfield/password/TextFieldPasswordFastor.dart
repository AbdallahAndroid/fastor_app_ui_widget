import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

class TextFieldPasswordFastor extends StatefulWidget {

  String? title;
  Widget? titleWidget;
  String? hint;
  AutovalidateMode? autovalidateMode;
  TextEditingController passwordController;
  Color colorIconEyePassword;
  ValueChanged<String> onChanged;
  EdgeInsets? margin;
  EdgeInsets? padding;

  FormFieldValidator<String>? validatorCustom;

  //eye password
  Widget? iconPasswordShow;
  Widget? iconPasswordHidden;


  TextFieldPasswordFastor({
    required this.passwordController,
    required this.colorIconEyePassword,
    required this.onChanged,
    this.iconPasswordShow,
    this.iconPasswordHidden,
    this.margin,
    this.padding,
    this.title,
    this.titleWidget,
    this.autovalidateMode,
    this.validatorCustom,
    this.hint,
});

  @override
  _TextFieldPasswordState createState()  => _TextFieldPasswordState();

}

class _TextFieldPasswordState extends State<TextFieldPasswordFastor> {

  bool isShowCharacter = false;

  @override
  Widget build(BuildContext context) {
    return password();
  }

  Widget password() {
    return TextFieldFastor(
      titleText: widget.title ,
      titleWidget: widget.titleWidget,
      hint_text: widget.hint?? "Enter password".arf( "كملة المرور"),
      suffixIcon: iconEyeClickWidget(),
      controller: widget.passwordController,
      margin:  widget.margin,
      maxLines: 1, // must in type password to write lines max is "1"  to fix crash
      validatorCustom: widget.validatorCustom?? ValidatorTemplate.pass(error_text: "*Enter password at least 8 char.".arf("* ادخل كلمة المرور")),
      obscureText: ! isShowCharacter,
      autovalidateMode: widget.autovalidateMode??AutovalidateMode.onUserInteraction,
      onChanged: widget.onChanged,
    );
  }


  Widget iconEyeClickWidget(){
    var iconEye = iconEyeWidgetShape();
    return GestureDetector(
      child: iconEye,
      onTap: (){
        setState(() {
          isShowCharacter = ! isShowCharacter;
          // Log.i("iconEyeClickWidget() -  click update - isEyePasswordShowCharacter: $isShowCharacter");
        });
      },
    );
  }


  iconEyeWidgetShape() {
    if( isShowCharacter ) {
      return iconPasswordShow();
    } else {
      return iconPasswordHide();
    }
  }


  iconPasswordShow(){
    if( widget.iconPasswordShow != null ) return widget.iconPasswordShow;
    return Icon(
      // Eye_password.eye_show_icon,
      Icons.remove_red_eye_outlined ,
      size: 28,
      color:  widget.colorIconEyePassword,
    );
  }


  iconPasswordHide() {
    if( widget.iconPasswordHidden != null ) return widget.iconPasswordHidden;
    return Icon(
      // Eye_password.eye_hide_icon,
      Icons.remove_red_eye ,
      size: 28,
      color: widget.colorIconEyePassword,
    );
  }


}