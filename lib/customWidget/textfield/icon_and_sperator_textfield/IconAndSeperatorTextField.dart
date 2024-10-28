
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAndSeperatorTextField extends StatelessWidget {

  BuildContext? context;
  Widget icon;
  String hint;
  TextEditingController controller;
  ValueChanged<String>  onChanged;
  TextInputType? textInputType;
  double? radius;
  Color? colorLineBoarder;

  int? minLines;

  ///errors
  String? errorMessage;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;


  IconAndSeperatorTextField( {
    required this.icon,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.textInputType,

    this.minLines,

    /// boarder
    this.colorLineBoarder,
    this.radius,

    ///errors
    this.errorMessage,
    this.errorKeySearchingInErrorMessageArray,
    this.errorsMessageArray
  });


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return  Container(
      width: getWidthSizeMinusMargin(),
      height: minLines != null ? null :  DimensionResource.textFieldHeight,
      decoration: BoarderHelper.cardView(
        colorLine: colorLineBoarder??ColorResource.textFieldDarkBoarderLineBeforeFocused,
        colorBackground: ColorResource.textFieldBackground,
        radiusSize: radius??8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: minLines != null ?  CrossAxisAlignment.start : CrossAxisAlignment.center ,
        children: [
          SizedBox( width: 10 ,),
          Padding(
            padding:  minLines != null ? EdgeInsets.only(top: Figma.h( 13 ) ) : EdgeInsets.zero,
            child: icon ,
          ),
          SizedBox( width: 10 ,),
          Padding(
            padding:  minLines != null ? EdgeInsets.only(top: Figma.h( 13 ) ) : EdgeInsets.zero,
            child: divider() ,
          ),
          SizedBox( width: 10 ,),
          textField()
        ],),
    );
  }


  textField(){
    return  TextFieldApp(
      hint_text: hint,
      fontSize: Figma.h( 16 ),
      // fontFamily: FontResource.regular,
      hint_color: ColorResource.textFieldHint,
      text_color: ColorResource.textFieldText,
      controller: controller,
      padding: minLines != null ? EdgeInsets.all( 10 ) : null ,
      minLines: minLines,
      width: getWidthTextField(),
      showOutlineInput: false,
      isRemoveUnderline: true,
      onChanged: onChanged,
      textInputType: textInputType,
      errorsMessageArray: errorsMessageArray,
      errorKeySearchingInErrorMessageArray: errorKeySearchingInErrorMessageArray,
      errorMessage: errorMessage,
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
      color: ColorResource.textFieldHint,
    ) ;
  }


  double getWidthSizeMinusMargin(){
    return DeviceTools.getWidthGlobal( ) - DimensionResource.marginBetweenTwoInputFiled -
        DimensionResource.marginBetweenTwoInputFiled;
  }


  double getWidthTextField(){
    double containerWidth = getWidthSizeMinusMargin();
    double iconWidth = 20;
    return containerWidth - iconWidth - 20 - 30 ;
  }

}