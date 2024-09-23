
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/mobile/MobileCountryApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/regular/TextFieldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/zone/ZoneTools.dart';

class TextFieldMobileFocusAndUnFocusBoarder extends StatefulWidget {

  final widthCountryCode  = 110.0;
  final marginBetweenTwoField = 10.0;

  String label;
  OutlineInputBorder? focus;
  OutlineInputBorder? unfocus;
  TextEditingController? controller;
  String? errorMessage;
  FormFieldValidator<String>? validatorCustom;
  MobileCountryListener callback;
  String? errorKeySearchingInErrorMessageArray;
  Map<String, dynamic>? errorsMessageArray;
  ValueChanged<String>? onChanged;

  TextFieldMobileFocusAndUnFocusBoarder({
    required this.label,
    required this.callback,
    this.controller,
    this.onChanged,
    this.validatorCustom,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
    this.errorMessage,
    this.focus,
    this.unfocus
});


  @override
  _TextFieldState createState()  => _TextFieldState();
}

class _TextFieldState extends State<TextFieldMobileFocusAndUnFocusBoarder> {



  bool _hasFocus = false;

  String? phone_text;
  String? countryCode_text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCountryCodeCurrent();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // updateCallback();
    });
  }

  //-------------------------------------------------------------- auto set timezone

  void setCountryCodeCurrent() {
    ZoneTools.getZoneCountryDialCode( "+966").then((value)   {
      setState(() {
        countryCode_text = value;
      });

      updateCallback();
    });
  }

  //--------------------------------------------------------------  content ui

  @override
  Widget build(BuildContext context) {
    return forceEnglishDirectionMobile();
  }

  Widget forceEnglishDirectionMobile() {
    return   Directionality(
      textDirection:   TextDirection.ltr,
      child:   Builder(
        builder: (BuildContext context) {
          return   MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: mobile(),
          );
        },
      ),
    );
  }


  mobile() {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           country(),
          SizedBox( width: widget.marginBetweenTwoField,),
          tf_phone()
    ] );
  }




  //--------------------------------------------------------------- country picker

  Widget country(){
    var country =  CountryCodePicker(
        onChanged: (countryCode) {
          // Log.i( "c: " + countryCode.toString() );
          countryCode_text = countryCode.dialCode!;

          updateCallback();
        },
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          // fontFamily: FontResources.regular
        ),
        dialogTextStyle:  const TextStyle(
            color: Colors.black,
            fontSize: 14,
            // fontFamily: FontResources.regular
        ),
        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        initialSelection: countryCode_text,
        favorite:  const [ "+966",  "+20"],
        // optional. Shows only country name and flag
        showCountryOnly: false,
        // optional. Shows only country name and flag when popup is closed.
        showOnlyCountryWhenClosed: false,
        // optional. aligns the flag and the Text left
        alignLeft: false,

        //remove default padding
        padding: EdgeInsets.zero
    );

    var scale = Transform.scale(scale: 1, child:  country );
    var sizeBoxCountry = SizedBox(  height: 50, child:  scale, width:  widget.widthCountryCode );

    return Container(
      decoration: BoarderHelper.cardView(
        colorLine: Colors.grey,
        colorBackground: Colors.transparent,
        radiusSize: 8,
        widthLine: 2
      ),
      child: sizeBoxCountry,
    );
  }



  //--------------------------------------------------------------- PhoneOnly

  Widget tf_phone(){
    // if( widget.errorsMessageArray != null ) {
    //   Log.i("TextFieldMobileFocus - tf_phone() -  widget.errorKeySearchingInErrorMessageArray: ${widget.errorKeySearchingInErrorMessageArray}");
    //   Log.i("TextFieldMobileFocus - tf_phone() -  widget.errorsMessageArray: ${widget.errorsMessageArray}");
    // }
    return TextFieldApp(
      padding: EdgeInsets.zero,
      width: getWidthPhoneOnly()  ,
      fontSize: 16,
      // fontFamily: FontResources.regular,
      autovalidateMode:  AutovalidateMode.onUserInteraction,
      validatorCustom:  ValidatorApp.mobile( error_text: "invalid phone number".tra() ) ,
      errorMessage: widget.errorMessage,
      errorsMessageArray: widget.errorsMessageArray,
      errorKeySearchingInErrorMessageArray: widget.errorKeySearchingInErrorMessageArray,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: getInputDecorationSwitchBetweenFocusOrUnFocus(),
      onChanged: (text) {
        setState(() => _hasFocus = text.isNotEmpty);

        phone_text = text;
        updateCallback();

        if(widget.onChanged != null ) widget.onChanged!(text);
      } ,
    );
  }


  getInputDecorationSwitchBetweenFocusOrUnFocus() {
    return  InputDecoration(
      fillColor: Colors.grey,
      filled: true,
      contentPadding:  EdgeInsets.symmetric(
          horizontal: 10 ,
          vertical: 5
      ),
      labelText: _hasFocus ? widget.label : null, // Hide label when not focused
      hintText: widget.label, // Display hint text for initial state
      hintStyle: TextStyle( color: Colors.grey ),
      focusedBorder: widget.focus?? OutlineInputBorder(
        borderRadius: BorderRadius.all( Radius.circular(8)),
        borderSide:   BorderSide(color: Colors.green, width: 2.0),
      ),
      enabledBorder: widget.unfocus??OutlineInputBorder(
        borderRadius: BorderRadius.all( Radius.circular(8)),
        borderSide:  BorderSide(color: Colors.grey, width: 2.0),
      ),
    );
  }


  getWidthPhoneOnly(){
    return DeviceTools.getWidth(context)
        - widget.widthCountryCode - widget.marginBetweenTwoField
        - 25
        -  25
        - widget.marginBetweenTwoField
    ;
  }

  //---------------------------------------------------------------- call back

  updateCallback(){
    widget.callback( countryCode_text??"", phone_text??"" );
  }



}