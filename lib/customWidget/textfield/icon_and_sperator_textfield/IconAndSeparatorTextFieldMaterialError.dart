import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/textfield_error/ErrorInputFieldParser.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAndSeparatorTextFieldMaterialError extends StatelessWidget {

  BuildContext? context;
  double width;
  Widget icon;
  String hint;
  TextEditingController controller;
  ValueChanged<String>  onChanged;
  TextInputType? textInputType;
  double? radius;


  int? minLines;
  int? maxLength;

  ///errors
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;


  IconAndSeparatorTextFieldMaterialError( {
    required this.icon,
    required this.width,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.textInputType,

    this.minLines,
    this.maxLength,

    /// boarder
    this.radius,

    ///errors
    this.errorKeySearchingInErrorMessageArray,
    this.errorsMessageArray
});


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return  TextField(
      style: TextStyle(
          color: AppColor.textFieldText,
          fontSize: Figma.h( 16 ),
          // fontFamily: FontResource.regular,
      ),
      controller: controller,
      minLines: minLines,
      maxLength: maxLength,
      decoration: getInputDecoration(),
      onChanged: onChanged,
    );
  }


  String? getErrorMessage(){
    return ErrorInputFieldParser.getErrorMessage(array: errorsMessageArray, key: errorKeySearchingInErrorMessageArray);
  }


  getInputDecoration() {
    return  InputDecoration(
      fillColor: AppColor.textFieldBackground,
      filled: true,
      contentPadding: EdgeInsets.zero,
      hintText: hint,
      hintStyle: TextStyle( color: AppColor.textFieldHint ),
      error:  errorMessageWidget(),
      //   suffix: errorMessageWidget(),
      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all( Radius.circular( AppDimension.cornerTextField)),
        borderSide:  BorderSide(color: AppColor.textFieldBoarderLine, width: 2.0),
      ),
      prefixIcon: Container(
        width: Figma.h( 65) ,
        height: minLines != null ? null :  AppDimension.textFieldHeight,
        child: Row(children: [
          SizedBox( width: Figma.h( AppDimension.textFieldContentPaddingHorizontal) ,),
          icon,
          SizedBox( width: Figma.h( AppDimension.textFieldContentPaddingHorizontal) ,),
          divider(),
          SizedBox( width: Figma.h( AppDimension.textFieldContentPaddingHorizontal) ,),
        ],),
      )
    );
  }

  //--------------------------------------------------------- prefix

  Widget? prefixWidget(){
    if( getErrorMessage() == null ) return null;

    return Container(
      // color: Colors.green.withOpacity(0.5),
      //
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: minLines != null ?  CrossAxisAlignment.start : CrossAxisAlignment.center ,
        children: [
          Icon( Icons.add),


        ],),
    );
  }


  Widget divider(){
    var heightDivider = 25.0;
    if( minLines != null ) {
      heightDivider = minLines! * 20;
    }
    return Container(
      width: 2,
      height: heightDivider,
      color: AppColor.textFieldHint,
    ) ;
  }

  //--------------------------------------------------------- error

  errorMessageWidget(){
    double size = Figma.h( 10);
    Log.i("errorMessageWidget() - getErrorMessage: ${getErrorMessage()}");
    if( getErrorMessage() == null ) return SizedBox();

    return Container(
      // width: width,
      // color: Colors.blue.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon( Icons.info_outline, size: size, color: AppColor.red,),
          SizedBox( width:  5 ,),
          TextApp( getErrorMessage()??"",
            color: AppColor.redMaterial,
            fontSize: size,
            // fontFamily: FontResource.regular,
          ),

        ],
      ),
    );
  }

}