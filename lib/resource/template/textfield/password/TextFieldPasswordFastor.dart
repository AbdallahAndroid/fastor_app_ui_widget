
import 'package:fastor_app_ui_widget/resource/template/textfield/stateless/TextFieldFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
import 'package:flutter/material.dart';

class TextFieldPasswordFastor extends StatefulWidget {


  // validate
  FormFieldValidator<String>? validatorCustom;
  FormFieldValidator<String> validatorChosen = ValidatorTemplate.d(error_text: "Missed");
  AutovalidateMode? autovalidateMode;

  //title
  String? titleText;
  Widget? titleWidget;

  //text and hint
  String? hint_text;
  Color? text_color;
  double? fontSize;
  String? fontFamily;
  Color? hint_color;

  //mode of textfield
  bool isRemoveUnderline = false;
  bool? showOutlineInput;

  //background
  Color? background_color;

  //decoration
  InputDecoration? decoration; //custom decoration
  Decoration? decorationBackground; //at the Container

  //spaces
  EdgeInsets? padding;
  EdgeInsets? margin;

  //controller
  TextEditingController? controller;
  ValueChanged<String>? onChanged;

  //input content type
  TextInputType? keyboardType;

  //action
  TextInputAction? textInputAction;

  //size and max/min
  double? width;
  int? maxLength;


  //error
  Map<String, dynamic>? errorsMessageArray;
  String? errorKeySearchingInErrorMessageArray;
  String? errorMessage;
  Color? errorColor;

  //other
  TextAlign? textAlign;
  FocusNode? focusNode;

  //icon
  Widget? prefixIcon;

  //eye password
  Widget? iconPasswordShow;
  Widget? iconPasswordHidden;
  Color colorIconEyePassword;

  TextFieldPasswordFastor({
    required this.colorIconEyePassword,
    this.iconPasswordShow,
    this.iconPasswordHidden,
    // validate
    this.validatorCustom,
    // this.validatorType,
    this.autovalidateMode,

    // title
    this.titleText,
    this.titleWidget,

    //text and hint
    this.hint_text,
    this.text_color,
    this.fontSize,
    this.hint_color,
    this.fontFamily,

    //boarder and underline
    this.isRemoveUnderline = false,

    this.showOutlineInput,

    //background + decoration
    this.background_color,
    this.decoration,
    this.decorationBackground, //at the Container

    //spaces
    this.padding,
    this.margin,

    //controller
    this.controller,
    this.onChanged,

    //input content type
    this.keyboardType,
    this.textInputAction,

    //size and max/min
    this.width,
    this.maxLength,

    //errors
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
    this.errorMessage,
    this.errorColor,

    //other
    this.textAlign,
    this.focusNode,

    //icon
    this.prefixIcon,

  }) ;

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
      titleText: widget.titleText ,
      titleWidget: widget.titleWidget,
      text_color: widget.text_color,
      fontSize: widget.fontSize,
      hint_color: widget.hint_color,
      fontFamily: widget.fontFamily,
      isRemoveUnderline: widget.isRemoveUnderline,
      showOutlineInput: widget.showOutlineInput,
      background_color: widget.background_color,
      decoration: widget.decoration,
      decorationBackground: widget.decorationBackground,
      margin:  widget.margin,
      padding: widget.padding,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      width: widget.width,
      maxLength: widget.maxLength,
      errorColor: widget.errorColor,
      errorKeySearchingInErrorMessageArray: widget.errorKeySearchingInErrorMessageArray,
      errorMessage: widget.errorMessage,
      errorsMessageArray: widget.errorsMessageArray,
      textAlign: widget.textAlign,
      focusNode: widget.focusNode,
      prefixIcon: widget.prefixIcon,
      suffixIcon: iconEyeClickWidget(),
      controller: widget.controller,

      /// password config
      validatorCustom: widget.validatorCustom?? ValidatorTemplate.pass(error_text: "*Enter password at least 8 char." ),
      autovalidateMode: widget.autovalidateMode??AutovalidateMode.onUserInteraction,
      hint_text: widget.hint_text?? "Enter password" ,
      maxLines: 1, // must in type password to write lines max is "1"  to fix crash
      obscureText: ! isShowCharacter,
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