
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/mobile/stateless/CountryTextFieldPicker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';

typedef MobileAppStatelessListener = Function(String? country_code, String? phone, bool isFirstTimeOpenScreen );


class MobileAppStatelessWidget extends StatelessWidget {


  final marginBetweenTwoField = 10.0;


  OutlineInputBorder? outlineInputBoarder;
  TextEditingController? controller;
  FormFieldValidator<String>? validatorCustom;
  MobileAppStatelessListener callback;
  String? errorMessage;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;
  double width;
  String? previousCountryCodeSelected;

  // Color? colorLineBoarder;

  // bool _hasFocus = false;

  String? phone_text;
  String? countryCode  ;
  BuildContext? context;
  double widthCountryCode;


  MobileAppStatelessWidget({
    required this.width,
    required this.widthCountryCode,
    required this.callback,
    required this.previousCountryCodeSelected,
    this.controller,
    this.validatorCustom,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
    this.errorMessage,
    this.outlineInputBoarder,
  }){
    countryCode = previousCountryCodeSelected;
    // Log.i("MobileWithCustomErrorShape - before errorKey: $errorKeySearchingInErrorMessageArray /array: $errorsMessageArray");
    // phone_text = controller?.text;
    // colorLineBoarder ??= AppColor.textFieldDarkBoarderLineBeforeFocused;
    _setValidatorFromBackend();
    // Log.i( "MobileWithCustomErrorShape - after end _setValidatorFromBackend() - errorMessage: $errorMessage");
  }


  void _setValidatorFromBackend() {
    if (errorKeySearchingInErrorMessageArray == null) return;
    if (errorsMessageArray == null) return;
    // Log.i( "_setValidatorFromBackend() - contain: ${ errorsMessageArray!.containsKey(errorKeySearchingInErrorMessageArray!) }");
    if (errorsMessageArray!.containsKey(errorKeySearchingInErrorMessageArray!) == false) return;
    errorMessage = errorsMessageArray!["" + errorKeySearchingInErrorMessageArray!][0];
    // Log.i( "MobileWithCustomErrorShape - after end _setValidatorFromBackend() - result: ${errorMessage}");
  }





  //--------------------------------------------------------------  content ui

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return   Directionality(
      textDirection:   TextDirection.ltr,
      child:   Builder(
        builder: (BuildContext context) {
          return   MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: countryAndTextField(),
          );
        },
      ),
    );
  }


  countryAndTextField() {
    return Container(
      decoration: AppDecoration.textField(),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            country(),
            SizedBox( width:  marginBetweenTwoField,),
            textFieldAndErrorMessage()
          ] ),
    );
  }

  //--------------------------------------------------------- country

  Widget country(){
    return CountryTextFieldPicker(listener: ( country, isFirstTimeCreateWidget ) {
      countryCode = country;
      updateCallback(isFirstTimeCreateWidget);
    },
      previousCountryCodeSelected: countryCode,
    widthCountryCode: widthCountryCode,
    );
  }

  //--------------------------------------------------------------- PhoneOnly

  Widget textFieldAndErrorMessage(){
    // if( widget.errorsMessageArray != null ) {
    //   Log.i("TextFieldMobileFocus - tf_phone() -  widget.errorKeySearchingInErrorMessageArray: ${widget.errorKeySearchingInErrorMessageArray}");
    //   Log.i("TextFieldMobileFocus - tf_phone() -  widget.errorsMessageArray: ${widget.errorsMessageArray}");
    // }
    Log.i("textFieldAndErrorMessage() - before build phoneController: ${controller}");
    return Container(

      alignment: LangApp.getAlignmentGeometryStartCenter(),
      height: AppDimension.textFieldHeight,
      child:  Stack(children: [
        SizedBox(
          width: getWidthPhoneOnly(),
          height: AppDimension.textFieldHeight,
        ),
        Positioned(child:  textField(), top: Figma.h( 20) ),

      ],),
    );
  }


  Widget textField(){
    return TextFieldApp(
      padding: LangApp.onlyEdgeInsets(left: 10 ),
      width: getWidthPhoneOnly()  ,
      fontSize: 16.sp ,
      fontFamily: FontProject.w500,
      errorMessage: errorMessage,

      // fontFamily: FontResource.regular,
      maxLines: 1,
      minLines: 1,
      maxLength: 12,
      hint_color: AppColor.textFieldHint,
      text_color: AppColor.textFieldText,
      hint_text:  "xxxx-xxxx",
      isRemoveUnderline: true,
      controller:   controller,
      textInputType: TextInputType.number,
      // decoration: getInputDecorationSwitchBetweenFocusOrUnFocus(),
      onChanged: (text) {
        //   setState(() => _hasFocus = text.isNotEmpty);

        phone_text = text;
        updateCallback(false );


      } ,
    );
  }


  getWidthPhoneOnly(){
    return width
        - widthCountryCode -  marginBetweenTwoField
        // - AppDimension.marginHorizontalScreen
        // -  AppDimension.marginHorizontalScreen
        -  marginBetweenTwoField;
  }

  //---------------------------------------------------------------- call back

  updateCallback(bool isFirstTime){
    if( isFirstTime && ToolsValidation.isValid( controller?.text )) {
      setPhoneNumberSelectedToControllerText();
      callback( countryCode , phone_text  ,isFirstTime );
    } else {
      callback( countryCode , phone_text  ,isFirstTime );
    }
    // Log.i("updateCallback() - isFirstTime: $isFirstTime /country: $countryCode");

  }


  setPhoneNumberSelectedToControllerText(){
    phone_text ??= controller?.text;
  }



}