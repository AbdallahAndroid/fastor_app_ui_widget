import 'package:fastor_app_ui_widget/core/constant/env.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/zone/ZoneTools.dart';
import 'package:flutter/material.dart';

typedef CountryTextFieldPickerListener = Function(String countryCode, bool isFirstTimeCreateWidget );

class CountryTextFieldPicker extends StatefulWidget {

  double widthCountryCode;
  String? previousCountryCodeSelected;

  CountryTextFieldPickerListener listener;


  CountryTextFieldPicker({
    required this.listener,
    required this.previousCountryCodeSelected,
    this.widthCountryCode = 120
  });

  @override
  _CountryTextFieldPickerState createState() => _CountryTextFieldPickerState();

}

class _CountryTextFieldPickerState extends State<CountryTextFieldPicker> {
  String? countryCode_text = env.countryCodeDefault;

  _CountryTextFieldPickerState();

  @override
  void initState() {
    super.initState();
    setCountryCodeCurrent();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.listener(  countryCode_text!, true );
    });
  }

  //-------------------------------------------------------------- auto set timezone

  void setCountryCodeCurrent() {
    countryCode_text = widget.previousCountryCodeSelected??env.countryCodeDefault;
    if(widget.previousCountryCodeSelected != null ) return;
    ZoneTools.getZoneCountryDialCode(env.countryCodeDefault).then((value)   {
      Log.i("setCountryCodeCurrent() - value: " + value.toString() );
      setState(() {
        countryCode_text = value;
      });

      widget.listener( countryCode_text!, true );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoarderHelper.cardView(
      //     colorLine: AppColor.textFieldBoarder,
      //     colorBackground: AppColor.textFieldBackground,
      //     radiusSize: AppDimension.textFieldRadiusBoarder,
      //     widthLine: 2
      // ),
      width: widget.widthCountryCode ,
      height: AppDimension.textFieldHeight,
      child: CountryCodePicker(
          onChanged: (countryCode) {
            Log.i( "CountryCodePicker - onChang countryCodee: " + countryCode.toString() );
            countryCode_text = countryCode.dialCode!;

            widget.listener( countryCode_text!, false );
          },
          textStyle:   TextStyle(
            color: AppColor.textFieldText,
            fontSize: AppDimension.textfieldTextFontSize  ,
            fontFamily: FontProject.textField,
          ),
          dialogTextStyle:     TextStyle(
            color: AppColor.textFieldText,
            fontSize: AppDimension.textfieldTextFontSize  ,
            fontFamily: FontProject.textField,
          ),
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: widget.previousCountryCodeSelected??countryCode_text,
          countryFilter:  env.isTest ?  [ env.countryCodeDefault, "+20"] : [env.countryCodeDefault],
          // optional. Shows only country name and flag
          showCountryOnly: true,
          // optional. Shows only country name and flag when popup is closed.
          showOnlyCountryWhenClosed: false,
          // optional. aligns the flag and the Text left
          alignLeft: false,

          //remove default padding
          padding: EdgeInsets.zero
      ),
    );
  }


}