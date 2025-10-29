import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/mobile/stateless/CountryTextFieldPicker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/mobile/statefull/MobileCountryApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';

typedef MobileWithCustomErrorShapeListener = Function(String? country_code, String? phone, bool isFirstTimeOpenScreen );



class MobileWithCustomErrorShape extends StatelessWidget {


  final marginBetweenTwoField = 10.0; //.h ;


  OutlineInputBorder? outlineInputBoarder;
  TextEditingController? controller;
  FormFieldValidator<String>? validatorCustom;
  MobileWithCustomErrorShapeListener callback;
  String? errorMessage;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;

  String? previousCountryCodeSelected;
  double width;

  // Color? colorLineBoarder;

  // bool _hasFocus = false;

  String? phone_text;
  String? countryCode  ;
  BuildContext? context;
  double widthCountryCode;

  /// example icon
  /// Container(
  //               height: AppDimension.textFieldHeight,
  //               width: AppDimension.textFieldIconWidth,
  //               alignment: Alignment.center,
  //               child: Icon( Icons.phone_android, color: AppColor.textFieldIcon, size: AppDimension.textFieldIconWidth ,
  //               )
  //           )
  Widget? iconSuffix;


  MobileWithCustomErrorShape({
    required this.width,
    required this.widthCountryCode,
    required this.callback,
    this.iconSuffix,
    this.controller,
    this.validatorCustom,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
    this.errorMessage,
    this.outlineInputBoarder,
    this.previousCountryCodeSelected,
  }){
    countryCode = previousCountryCodeSelected;
    Log.i("MobileWithCustomErrorShape - before errorKey: $errorKeySearchingInErrorMessageArray /array: $errorsMessageArray");
    // phone_text = controller?.text;
    // colorLineBoarder ??= AppColor.textFieldDarkBoarderLineBeforeFocused;
    _setValidatorFromBackend();
    Log.i( "MobileWithCustomErrorShape - after end _setValidatorFromBackend() - errorMessage: $errorMessage");
  }


  void _setValidatorFromBackend() {
    if (errorKeySearchingInErrorMessageArray == null) return;
    if (errorsMessageArray == null) return;
    Log.i( "_setValidatorFromBackend() - contain: ${ errorsMessageArray!.containsKey(errorKeySearchingInErrorMessageArray!) }");
    if (errorsMessageArray!.containsKey(errorKeySearchingInErrorMessageArray!) == false) return;

    errorMessage = errorsMessageArray!["" + errorKeySearchingInErrorMessageArray!][0];
    Log.i( "MobileWithCustomErrorShape - after end _setValidatorFromBackend() - result: ${errorMessage}");
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
            child: Stack(
              children: [
                countryAndTextField(),

                /// icon
                if( iconSuffix != null ) PositionedApp.langApp(
                  child:iconSuffix!,
                  left: 0,
                  bottom: 0,
                  top: 0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  countryAndTextField() {
    return Container(
      decoration: ToolsValidation.isValid(  errorMessage )  ? AppDecoration.textFieldError()
          :  AppDecoration.textField()
      ,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            country(),
            SizedBox( width:  marginBetweenTwoField,),
            stackTextFieldPhoneOnlyAndErrorMessage(),
          ] ),
    );
  }

  //--------------------------------------------------------- country

  Widget country(){
    return CountryTextFieldPicker

      (listener: ( country, isFirstTimeCreateWidget ) {
      countryCode = country;
      updateCallback(isFirstTimeCreateWidget);
    },
      widthCountryCode: widthCountryCode,

      previousCountryCodeSelected: previousCountryCodeSelected,
    );
  }

  //--------------------------------------------------------------- PhoneOnly

  Widget stackTextFieldPhoneOnlyAndErrorMessage(){
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
        Positioned(child:  textField(), top: 20.h  ),
        if( ToolsValidation.isValid(  errorMessage )    ) PositionedApp.langApp(
            child:  errorMessageWidget(),
            left: 0,
            top: AppDimension.textFieldHeight - 17.h

        ),


      ],),
    );
  }


  Widget textField(){
    return TextFieldApp(
      padding: LangApp.onlyEdgeInsets(left: 10.h  ),
      width: getWidthPhoneOnly()  ,
      fontSize: 16.spt  ,
      fontFamily: FontProject.w500,

      // fontFamily: FontResource.regular,
      maxLines: 1,
      minLines: 1,
      maxLength: 12,
      hint_color: AppColor.textFieldHint,
      text_color: AppColor.textFieldText,
      hint_text:  "xxxx-xxxx",
      // autovalidateMode:  AutovalidateMode.onUserInteraction,
      // validatorCustom:  ValidatorApp.mobile( error_text: "phone more than 7 digits".tra() ) ,
      // errorMessage: widget.errorMessage,
      // errorsMessageArray: widget.errorsMessageArray,
      // errorKeySearchingInErrorMessageArray: widget.errorKeySearchingInErrorMessageArray,
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
    // return width - marginBetweenTwoField - marginBetweenTwoField;
    return width
        - widthCountryCode -  marginBetweenTwoField
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

  //---------------------------------------------- error

  errorMessageWidget(){
    double size = 10.h ;
    // Log.i("errorMessageWidget() - errorMessage: $errorMessage");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Icon( Icons.info_outline, size: size, color: AppColor.red,),
          // SizedBox( width:  5 ,),
          TextApp(  errorMessage??"",
            color: AppColor.red,
            fontSize: size,
            // fontFamily: FontResource.regular,
          ),

        ],
      ),
    );
  }



}