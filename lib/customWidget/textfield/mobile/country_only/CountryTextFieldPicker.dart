import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:fastor_app_ui_widget/core/zone/ZoneTools.dart';
import 'package:flutter/material.dart';

typedef CountryTextFieldPickerListener = Function(String countryCode, bool isFirstTimeCreateWidget );

class CountryTextFieldPicker extends StatefulWidget {

  static double widthCountryCode  = 110.0;

  CountryTextFieldPickerListener listener;


  CountryTextFieldPicker({ required this.listener });

  @override
  _CountryTextFieldPickerState createState() => _CountryTextFieldPickerState();

}

class _CountryTextFieldPickerState extends State<CountryTextFieldPicker> {
  String? countryCode_text = "+966";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setCountryCodeCurrent();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.listener( countryCode_text!, true );
    });
  }

  //-------------------------------------------------------------- auto set timezone

  /**
      void setCountryCodeCurrent() {
      ZoneTools.getZoneCountryDialCode( "+966").then((value)   {
      setState(() {
      countryCode_text = value;
      });

      widget.listener( countryCode_text!);
      });
      }

   */


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoarderHelper.cardView(
          colorLine: ColorResource.textFieldDarkBoarderLineBeforeFocused,
          colorBackground: ColorResource.textFieldBackground,
          radiusSize: DimensionResource.cornerTextField,
          widthLine: 2
      ),
      width: CountryTextFieldPicker.widthCountryCode ,
      height: DimensionResource.textFieldHeight,
      child: CountryCodePicker(
          onChanged: (countryCode) {
            // Log.i( "c: " + countryCode.toString() );
            countryCode_text = countryCode.dialCode!;

            widget.listener( countryCode_text!, false );
          },
          textStyle:  TextStyle(
            color: ColorResource.textPrimary,
            fontFamily: FontResource.regular,
            fontSize: Figma.h( 16 ),
            // fontFamily: FontResources.regular
          ),
          dialogTextStyle:    TextStyle(
            color: ColorResource.textPrimary,
            fontSize: Figma.h( 14 ),
            // fontFamily: FontResources.regular
          ),
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: countryCode_text,
          // favorite:  const [ "+966",  "+20"],
          countryFilter: const [  "+966", "+20"],
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