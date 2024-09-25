
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAndSeperatorTextField extends StatelessWidget {

  BuildContext? context;
  Widget icon;
  String hint;
  double width;
  TextEditingController controller;
  ValueChanged<String>  onChanged;
  TextInputType? textInputType;

  ///errors
  String? errorMessage;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;


  IconAndSeperatorTextField( {
    required this.icon,
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
  Widget build(BuildContext context) {
    this.context = context;
    return  Container(
      width: getWidthSizeMinusMargin(),
      height: 50, //DimensionResource.textFieldHeight
      decoration: BoarderHelper.cardView(
        colorLine: Colors.white60,
        colorBackground: Colors.white60,
        radiusSize: 8,
      ),
      child: Row(
        children: [
          SizedBox( width: 10 ,),
          icon,
          SizedBox( width: 10 ,),
          divider(),
          SizedBox( width: 10 ,),
        textField()
      ],),
    );
  }


  textField(){
    return  TextFieldApp(
      hint_text: hint,
      hint_color: Colors.grey,
      controller: controller,
      width: getWidthTextField(),
      showOutlineInput: false,
      isRemoveUnderline: true,
      onChanged: onChanged,
      keyboardType: textInputType,
      errorsMessageArray: errorsMessageArray,
      errorKeySearchingInErrorMessageArray: errorKeySearchingInErrorMessageArray,
      errorMessage: errorMessage,
    );
  }


  Widget divider(){
    return Container(
      width: 2,
      height: 25,
      color: Colors.grey //.textFieldHint,
    ) ;
  }


  double getWidthSizeMinusMargin(){
    // return DeviceTools.getWidthGlobal( ) - DimensionResource.marginBetweenTwoInputFiled -
    //     DimensionResource.marginBetweenTwoInputFiled;
    return width;
  }


  double getWidthTextField(){
    double containerWidth = getWidthSizeMinusMargin();
    double iconWidth = 20;
    return containerWidth - iconWidth - 20 - 30 ;
  }

}