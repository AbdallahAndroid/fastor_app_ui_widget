import 'package:country_code_picker/country_code_picker.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/ds/LevelDS.dart';
import 'package:fastor_app_ui_widget/resource/template/column/ColumnTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextTemplate.dart';

import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';

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
  TextEditingController? controller;
  Color? colorUnderlineInputField;
  TextInputType? textInputType;

  MobileCountryFastor( {
    required this.width,
    required this.callback,
    this.textStyle,
    this.controller,
    this.decoration,
    this.textInputType,
    this.title,
    this.colorUnderlineInputField,
    this.favoriteCountryCodeArray
  }) {
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
    // setCountryCodeCurrent();
  }


  // void setCountryCodeCurrent() {
  //   ZoneTools.getZoneCountryDialCode("+966").then((value)   {
  //      //Log.i( "MobileVerificationController - setCurrentCountryDial() - value: " + value );
  //
  //     setState(() {
  //       countryCode_text = value;
  //
  //       //check
  //       if( widget.countryCodeDefault != null ) {
  //         countryCode_text = widget.countryCodeDefault!; //example "+20";
  //       }
  //     //  Log.i( "setCountryCodeCurrent() - countryCode_text: " + countryCode_text );
  //     });
  //
  //   });
  // }


  //---------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    debugMode();
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

  //---------------------------------------------------------------------- debug

  void debugMode() {
    // if (EnvironmentConstant.isLive ) return;
    // phone_controller.text = "01012345601";
    // phone_text = "01012345601";
  }

  //----------------------------------------------------------------------- stack

  Widget countryWithPhoneWithBoarder(){
    // var row =  RowTemplate.child1_WrapWidth_child2_expanded( country(), tf_phone(),
    //     gravityLayout: Alignment.topLeft );

    var row = RowScrollFastor(children: [
        country(),
      spinBar(),
      tf_phone()
    ] );

    return Container( child:  row ,
        // margin: EdgeInsets.only(top: DSDimen.space_level_3 ),
        // color: Colors.red,
    decoration: widget.decoration
    );
    // return tf_phone();
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

    var underLine = Container(
      width: _width_country_view,
      color:  widget.colorUnderlineInputField,
      height: 1,
    );

    return ColumnFastor(children: [
      sizeBoxCountry,
      underLine
    ] );
  }

  //----------------------------------------------------------------------- textfield

  Widget tf_phone(){
  //  Log.i( "_MobileCountryState - tf_phone() ");
    return TextFieldFastor(
      margin: EdgeInsets.only( top:  5.5),
      isRemoveUnderline: true,
      controller: widget.controller,
        width: widget.width - _width_country_view,
        validatorCustom: ValidatorTemplate.emailOrPhone( ),
        padding: EdgeInsets.all( DSDimen.textfield_auto_padding),
        autovalidateMode: autovalidateMode,
        keyboardType: widget.textInputType??TextInputType.number,
   //     hint_text: "ex: 01012345678" ,
        onChanged: (phone){
          phone_text = phone;
          updateCallback();
        });
  }

  //---------------------------------------------------------------- call back

  updateCallback(){
    widget.callback( countryCode_text, phone_text );
  }

}