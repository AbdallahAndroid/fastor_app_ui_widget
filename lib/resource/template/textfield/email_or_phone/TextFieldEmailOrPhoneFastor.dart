import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:flutter/material.dart';

typedef TextFieldEmailListener = Function(String email);

class TextFieldEmailOrPhoneFastor extends StatefulWidget {
  double width;
  TextFieldEmailListener callbackEmail;
  MobileCountryListener callbackPhone;
  Decoration? decoration;
  TextStyle? textStyle;
  List<String>? favoriteCountryCodeArray;
  String? title;
  String? hint;
  TextEditingController? controller;
  Color? colorUnderlineInputField;

  // TextInputType? textInputType;
  String? initialSelection; //example: "+20"

  Widget? iconCaseMobile;
  Widget? iconCaseEmail;

  TextFieldEmailOrPhoneFastor(
      {required this.width,
      required this.callbackPhone,
      required this.callbackEmail,
      this.textStyle,
      this.controller,
      this.decoration,
      // this.textInputType,
      this.title,
      this.hint,
      this.colorUnderlineInputField,
      this.favoriteCountryCodeArray,
      this.initialSelection,
      this.iconCaseEmail,
      this.iconCaseMobile}) {}

  @override
  _TextFieldEmailOrPhoneState createState() => _TextFieldEmailOrPhoneState();
}

class _TextFieldEmailOrPhoneState extends State<TextFieldEmailOrPhoneFastor> {
  bool isPhoneType = false;
  bool isPreviousPhoneType = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      textFieldPhone(),
      if (isHaveIcon())
        Positioned(
          child: chooseIcon()!,
          right: 0,
          bottom: 0,
        )
    ]);
  }


  Widget textFieldPhone() {
    var mobile = MobileCountryFastor(
        width: widget.width,
        colorUnderlineInputField: widget.colorUnderlineInputField,
        textInputType: TextInputType.text,

        /// must make type TextInputType.text to can convert to email
        textStyle: widget.textStyle,
        controller: widget.controller,
        title: widget.title,
        hint: widget.hint,
        callback: (country, phone) {
          updatePhoneEntryType(phone);
          chooseCallbackPhoneOrEmail(country, phone);
          callSetStateWhenPreviousStatusPhoneTypeChanges();
        },
        decoration: widget.decoration,
        favoriteCountryCodeArray: widget.favoriteCountryCodeArray,
        initialSelection: widget.initialSelection,
        isHideCountryPicker: !isPhoneType);
    return mobile;
  }

  bool isHaveIcon() {
    bool isEmail = isPhoneType == false;
    if (isPhoneType && widget.iconCaseMobile != null) {
      return true;
    } else if (isEmail && widget.iconCaseEmail != null) {
      return true;
    } else {
      return false;
    }
    // return isPhoneType && widget.iconCaseMobile != null;
  }

  Widget? chooseIcon() {
    if (isHaveIcon() == false) {
      return null;
      ;
    }

    if (widget.iconCaseMobile != null) {
      return widget.iconCaseMobile;
    } else {
      return widget.iconCaseEmail;
    }
  }

  //-------------------------------------------------------------- phone checker and tools

  void callSetStateWhenPreviousStatusPhoneTypeChanges() {
    // Log.i("callSetStateWhenPreviousStatusPhoneTypeChanges() - isPreviousPhoneType: $isPreviousPhoneType /isPhoneType: $isPhoneType ");
    bool isChangeThePreviousStatus = isPreviousPhoneType != isPhoneType;
    if (isChangeThePreviousStatus) {
      setState(() {});
    }

    //set as previous
    isPreviousPhoneType = isPhoneType;
  }

  void updatePhoneEntryType(String textToCheck) {
    isPhoneType =
        ToolsValidation.checkTextIsPhoneNumberCharsOnlyWithoutAbc(textToCheck);
  }

  //-------------------------------------------------------------- call back

  void chooseCallbackPhoneOrEmail(String country, String phoneOrEmail) {
    if (isPhoneType) {
      widget.callbackPhone(country, phoneOrEmail);
    } else {
      widget.callbackEmail(phoneOrEmail);
    }
  }
}
