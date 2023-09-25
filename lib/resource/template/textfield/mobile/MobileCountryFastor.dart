import 'package:country_code_picker/country_code_picker.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/LevelDS.dart';
import 'package:fastor_app_ui_widget/resource/template/column/ColumnTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';

import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/zone/ZoneTools.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


typedef MobileCountryListener = Function(String country_code, String phone );

double _width_country_view = 100;

class MobileCountryFastor extends StatefulWidget {

  double width;
  MobileCountryListener callback;
  Decoration? decoration;
  TextStyle? textStyle;
  List<String>? favoriteCountryCodeArray;
  String? title;
  String? hint;
  Color? hint_color;
  TextEditingController? controller;
  Color? colorUnderlineInputField;
  TextInputType? textInputType;
  String? initialSelection; //example: "+20"
  Widget? suffixIcon;
  bool? isHideCountryPicker;

  MobileCountryFastor( {
    required this.width,
    required this.callback,
    this.textStyle,
    this.controller,
    this.decoration,
    this.textInputType,
    this.title,
    this.hint,
    this.hint_color,
    this.colorUnderlineInputField,
    this.favoriteCountryCodeArray,
    this.initialSelection,
    this.suffixIcon,
    this.isHideCountryPicker
  }) {
    isHideCountryPicker ??= false;
    // print( "fastor - MobileCountryFastor - hint_color: " + hint_color.toString() );
  }


  @override
  _MobileCountryFastorState createState()  => _MobileCountryFastorState();

}
class _MobileCountryFastorState extends State<MobileCountryFastor> {

  //---------------------------------------------------------------- variable

  //info
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;


  //backend
  var countryCode_text = "";//+20
  var phone_text = "";


  //---------------------------------------------------------------- public

  void setAutoValidteModeAlways(){
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
  }

  //--------------------------------------------------------------- fix time zone

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCountryCodeCurrent();
  }


  void setCountryCodeCurrent() {
    ZoneTools.getZoneCountryDialCode(widget.initialSelection??"+966").then((value)   {
      //Log.i( "MobileVerificationController - setCurrentCountryDial() - value: " + value );

      setState(() {
        countryCode_text = value;

        //check
        if( widget.initialSelection != null ) {
          countryCode_text = widget.initialSelection!; //example "+20";
        }
        //  Log.i( "setCountryCodeCurrent() - countryCode_text: " + countryCode_text );
      });

    });
  }


  //---------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    return mobile();
  }


  Widget mobile(){
    return ColumnTemplate.t( children: [
      tx_mobile(),
      SizedBox( height: 15,),
      countryWithPhoneWithBoarder()
    ],
    );
  }

  //----------------------------------------------------------------------- stack

  Widget countryWithPhoneWithBoarder(){
    return ColumnFastor(children: [
      rowCountryAndSpinAndPhone(),
      underLine()
    ] );
  }

  Widget rowCountryAndSpinAndPhone(){
    // var row =  RowTemplate.child1_WrapWidth_child2_expanded( country(), tf_phone(),
    //     gravityLayout: Alignment.topLeft );

    var row = RowScrollFastor(children: [
      if(widget.isHideCountryPicker! == false ) country(),
      if(widget.isHideCountryPicker! == false ) spinBar(),
      tf_phone()
    ] );

    return Container( child:  row ,
        // margin: EdgeInsets.only(top: DSDimen.space_level_3 ),
        // color: Colors.red,
        decoration: widget.decoration
    );
  }

  Widget spinBar(){
    return Container( width: 0.5,
      height: 20,
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      color: Colors.black,
    );
  }

  Widget tx_mobile() {
    return Text(  widget.title??"Mobile",
        style: widget.textStyle
    );
  }

//----------------------------------------------------------------------- country

  Widget country(){
    var country =  CountryCodePicker(
        onChanged: (countryCode) {
          // Log.i( "c: " + countryCode.toString() );
          countryCode_text = countryCode.dialCode!;

          updateCallback();
        },
        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        initialSelection: countryCode_text,
        favorite: widget.favoriteCountryCodeArray??[ "+966",  "+20"],
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
    var sizeBoxCountry = SizedBox(  height: 40, child:  scale, width:  _width_country_view,);
    return sizeBoxCountry;
  }

//----------------------------------------------------------------------- underLine

  Widget underLine(){
    return Container(
      width: widget.width,
      color:  widget.colorUnderlineInputField,
      height: 1,
    );
  }

  //----------------------------------------------------------------------- textfield

  Widget tf_phone(){
    // Log.i("fastor - widget.hint: " + widget.hint.toString());
    return TextFieldFastor(
        margin: EdgeInsets.only( top:  5.5),
        isRemoveUnderline: true,
        controller: widget.controller,
        width: chooseWidthAfterVisibleOrHideTheCountryPicker(),
        validatorCustom: ValidatorTemplate.emailOrPhone( ),
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 13),
        autovalidateMode: autovalidateMode,
        keyboardType: widget.textInputType??TextInputType.number,
        suffixIcon: widget.suffixIcon,
        hint_text: widget.hint ,
        hint_color : widget.hint_color,
        onChanged: (phone){
          phone_text = phone;
          updateCallback();
        });
  }


  double chooseWidthAfterVisibleOrHideTheCountryPicker(){
    if( widget.isHideCountryPicker! ) {
      return widget.width  ;
    }
    return widget.width - _width_country_view;
  }

  //---------------------------------------------------------------- call back

  updateCallback(){
    widget.callback( countryCode_text, phone_text );
  }

}