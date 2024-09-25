
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double _sizeIconEye = 28;

class IconAndSeperatorPasswordTextField extends StatefulWidget {

  Widget iconPrefix;
  double width;
  Color colorIconEyePassword;

  String hint;
  TextEditingController controller;
  ValueChanged<String>  onChanged;
  TextInputType? textInputType;

  ///errors
  String? errorMessage;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;


  IconAndSeperatorPasswordTextField( {
    required this.iconPrefix,
    required this.colorIconEyePassword,
    required this.hint,
    required this.width,
    required this.controller,
    required this.onChanged,
    this.textInputType,

    ///errors
    this.errorMessage,
    this.errorKeySearchingInErrorMessageArray,
    this.errorsMessageArray
});

  @override
  State<IconAndSeperatorPasswordTextField> createState() => _IconAndSeperatorPasswordTextFieldState();
}

class _IconAndSeperatorPasswordTextFieldState extends State<IconAndSeperatorPasswordTextField> {

  //eye password
  bool isShowCharacter = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.width,
      height: Figma.h( 65), //DimensionResource.textFieldHeight,
      decoration: BoarderHelper.cardView(
        colorLine: Colors.white60, //ColorResource.textFieldBoarderLineBeforeFocused,
        colorBackground: Colors.white60, // ColorResource.textFieldBackground,
        radiusSize: 8,
      ),
      child: Row(
        children: [
          SizedBox( width: 10 ,),
          widget.iconPrefix,
          SizedBox( width: 10 ,),
          divider(),
          SizedBox( width: 10 ,),
          textField(),
          iconEyeShapeOnAndOff()
      ],),
    );
  }

  textField(){
    return  TextFieldApp(
      hint_text: widget.hint,
      // hint_text: widget.hint_text?? "Enter password" ,
      fontSize: Figma.h( 16 ),
      // fontFamily: FontResource.regular,
      hint_color: Colors.grey,//ColorResource.textFieldHint,
      text_color: Colors.black, ////ColorResource.textfieldText,
      controller: widget.controller,
      width: widget.width,
      showOutlineInput: false,
      isRemoveUnderline: true,
      onChanged: widget.onChanged,
      keyboardType: widget.textInputType,

      ///error  config
      errorsMessageArray: widget.errorsMessageArray,
      errorKeySearchingInErrorMessageArray: widget.errorKeySearchingInErrorMessageArray,
      errorMessage: widget.errorMessage,

      /// password config
      validatorCustom:  ValidatorApp.pass(error_text: "enter password at least 8 char" ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 1, // must in type password to write lines max is "1"  to fix crash
      minLines: 1,
      obscureText: ! isShowCharacter,
    );
  }

  Widget divider(){
    return Container(
      width: 2,
      height: 25,
      color: Colors.grey, //ColorResource.textFieldHint,
    ) ;
  }

  // double getWidthSizeMinusMargin(){
  //   // return DeviceTools.getWidthGlobal( ) - DimensionResource.marginBetweenTwoInputFiled -
  //   //     DimensionResource.marginBetweenTwoInputFiled;
  //   return DeviceTools.getWidthGlobal();
  // }

  double getWidthTextField(){
    double containerWidth = widget.width;
    double iconWidth = 20;
    return containerWidth - iconWidth - _sizeIconEye - 20 - 30 ;
  }

  //-------------------------------------------------------------- eye


  Widget iconEyeShapeOnAndOff(){
    return GestureDetector(
      child: iconEyeWidgetShape(),
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
    return Icon(
      // Eye_password.eye_show_icon,
      Icons.remove_red_eye_outlined ,
      size: _sizeIconEye,
      color:  widget.colorIconEyePassword,
    );
  }


  iconPasswordHide() {
    return Icon(
      // Eye_password.eye_hide_icon,
      Icons.remove_red_eye ,
      size: _sizeIconEye,
      color: widget.colorIconEyePassword,
    );
  }

}