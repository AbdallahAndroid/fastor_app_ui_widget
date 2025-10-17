
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



double _sizeIconEye = 28;

class IconAndSeparatorPasswordTextField extends StatefulWidget {

  Widget iconPrefix;
  Color colorIconEyePassword;

  String hint;
  TextEditingController controller;
  ValueChanged<String>  onChanged;
  TextInputType? textInputType;

  ///errors
  String? errorMessage;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;

  bool? enabled;

  Color?  colorLineBoarder;


  IconAndSeparatorPasswordTextField.IconAndSeparatorPasswordTextFieldDecorationCustom( {
    required this.iconPrefix,
    required this.colorIconEyePassword,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.textInputType,
    this.enabled,


    /// boarder
    this.colorLineBoarder,

    ///errors
    this.errorMessage,
    this.errorKeySearchingInErrorMessageArray,
    this.errorsMessageArray
  }) {

    colorLineBoarder ??= AppColor.textFieldDarkBoarderLineBeforeFocused;
    _setValidatorFromBackend();
  }


  void _setValidatorFromBackend() {
    if (errorKeySearchingInErrorMessageArray == null) return;
    if (errorsMessageArray == null) return;
    if (errorsMessageArray!.containsKey(errorKeySearchingInErrorMessageArray!) == false) return;
    errorMessage = errorsMessageArray!["" + errorKeySearchingInErrorMessageArray!][0];
    // Log.i( "_setValidatorFromBackend() - errorMessage: $errorMessage");
  }


  @override
  State<IconAndSeparatorPasswordTextField> createState() => _IconAndSeparatorPasswordTextFieldState();
}

class _IconAndSeparatorPasswordTextFieldState extends State<IconAndSeparatorPasswordTextField> {

  //eye password
  bool isShowCharacter = false;

  @override
  void initState() {
    super.initState();
    if( widget.enabled??false ) {
      isShowCharacter = true;
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(children: [
        iconAndTextField(),
        if( ToolsValidation.isValid( widget.errorMessage )    ) PositionedApp.langApp(
            child:  errorMessageWidget(),
            left: Figma.w( 47  ),
            top: AppDimension.textFieldHeight - Figma.h( 17 )
        )
      ],),
    );
  }


  Widget iconAndTextField(){
    return Container(
      width: getWidthSizeMinusMargin(),
      height: AppDimension.textFieldHeight,
      decoration: BoarderHelper.cardView(
        colorLine: AppColor.textFieldDarkBoarderLineBeforeFocused,
        colorBackground: AppColor.textFieldBackground,
        radiusSize: AppDimension.cornerTextField,
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
      enabled: widget.enabled,
      hint_text: widget.hint,
      // hint_text: widget.hint_text?? "Enter password" ,
      fontSize: Figma.h( 16 ),
      // fontFamily: FontResource.regular,
      hint_color: AppColor.textFieldHint,
      text_color: AppColor.textFieldText,
      controller: widget.controller,
      width: getWidthTextField(),
      showOutlineInput: false,
      isRemoveUnderline: true,
      onChanged: widget.onChanged,
      textInputType: widget.textInputType,

      // ///error  config
      // errorsMessageArray: widget.errorsMessageArray,
      // errorKeySearchingInErrorMessageArray: widget.errorKeySearchingInErrorMessageArray,
      // errorMessage: widget.errorMessage,

      /// password config
      // validatorCustom:  ValidatorApp.pass(error_text: "enter password at least 8 char" ),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: 1, // must in type password to write lines max is "1"  to fix crash
      minLines: 1,
      obscureText: modeDynamicChange(),  // obscureText: enabled! != null ? false : modeDynamicChange(),
    );
  }

  Widget divider(){
    return Container(
      width: 2,
      height: 25,
      color: AppColor.textFieldHint,
    ) ;
  }

  double getWidthSizeMinusMargin(){
    return DeviceTools.getWidthGlobal( ) - AppDimension.marginBetweenTwoInputFiled -
        AppDimension.marginBetweenTwoInputFiled;
  }

  double getWidthTextField(){
    double containerWidth = getWidthSizeMinusMargin();
    double iconWidth = 20;
    return containerWidth - iconWidth - _sizeIconEye - 20 - 30 - 0  ;
  }

  //-------------------------------------------------------------- eye


  Widget iconEyeShapeOnAndOff(){
    // if( widget.enabled!  ) {
    //   return iconPasswordWhenEnabled();
    // }

    return GestureDetector(
      child: iconEyeWidgetShape(),
      // child: Container(
      //   margin: LangApp.onlyEdgeInsets(right: 100),
      //   child: iconEyeWidgetShape(),
      // ),
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


  // iconPasswordWhenEnabled() {
  //   return Icon(
  //     // Eye_password.eye_hide_icon,
  //     Icons.password_sharp ,
  //     size: _sizeIconEye,
  //     color: widget.colorIconEyePassword,
  //   );
  // }

  modeDynamicChange() {
    return ! isShowCharacter;
  }


  //---------------------------------------------- error

  errorMessageWidget(){
    double size = Figma.h( 10);
    // Log.i("errorMessageWidget() - errorMessage: $errorMessage");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Icon( Icons.info_outline, size: size, color: AppColor.red,),
          SizedBox( width:  5 ,),
          TextApp( widget.errorMessage??"",
            color: AppColor.redMaterial,
            fontSize: size,
            // fontFamily: FontResource.regular,
          ),

        ],
      ),
    );
  }

}