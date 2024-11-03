
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAndSeparatorTextField extends StatelessWidget {

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


  IconAndSeparatorTextField( {
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
  }){

    colorLineBoarder ??= ColorResource.textFieldDarkBoarderLineBeforeFocused;
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
  Widget build(BuildContext context) {
    this.context = context;
    return  Container(
      child: Stack(children: [
        iconAndTextField(),
        if( ToolsValidation.isValid( errorMessage )    ) PositionedApp.langApp(
            child:  errorMessageWidget(),
            left: Figma.w( 47 ),
            top: DimensionResource.textFieldHeight - Figma.h( 17 )
        )
      ],),
    );
  }

  Widget iconAndTextField(){
    return Container(
      width: getWidthSizeMinusMargin(),
      height: minLines != null ? null :  DimensionResource.textFieldHeight,
      decoration: BoarderHelper.cardView(
          colorLine: errorMessage != null ? ColorResource.redMaterial : colorLineBoarder,
          colorBackground:   ColorResource.textFieldBackground,
          radiusSize: radius??8,
          widthLine: 1.5
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
      // errorsMessageArray: errorsMessageArray,
      // errorKeySearchingInErrorMessageArray: errorKeySearchingInErrorMessageArray,
      // errorMessage: errorMessage,
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

  //---------------------------------------------- error

  errorMessageWidget(){
    double size = Figma.h( 10);
    // Log.i("errorMessageWidget() - errorMessage: $errorMessage");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon( Icons.info_outline, size: size, color: ColorResource.red,),
          SizedBox( width:  5 ,),
          TextApp( errorMessage??"",
            color: ColorResource.redMaterial,
            fontSize: size,
            // fontFamily: FontResource.regular,
          ),

        ],
      ),
    );
  }

}