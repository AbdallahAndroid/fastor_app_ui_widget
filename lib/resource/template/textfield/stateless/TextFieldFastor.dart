import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/template/textfield/validator/ValidatorTemplate.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';


class TextFieldFastor extends StatelessWidget {

  // validate
  FormFieldValidator<String>? validatorCustom;
  FormFieldValidator<String> validatorChosen = ValidatorTemplate.d(error_text: "Missed");
  AutovalidateMode? autovalidateMode;

  //title
  String? titleText;
  Widget? titleWidget;

  //text and hint
  String? hint_text;
  Color? text_color;
  double? fontSize;
  String? fontFamily;
  Color? hint_color;

  //mode of textfield
  bool isRemoveUnderline = false;

  @Deprecated("use showOutlineInput")
  bool? isShowBoarder;
  bool? showOutlineInput;

  //background
  Color? background_color;

  //decoration
  InputDecoration? decoration; //custom decoration
  Decoration? decorationBackground; //at the Container

  //spaces
  EdgeInsets? padding;
  EdgeInsets? margin;

  //controller
  TextEditingController? controller;
  ValueChanged<String>? onChanged;

  //input content type
  TextInputType? keyboardType;
  bool obscureText = false;

  //action
  TextInputAction? textInputAction;

  //size and max/min
  double? width;
  int? maxLength;
  int? maxLines;
  int? minLines;

  //error
  Map<String, dynamic>? errorsMessageArray;
  String? errorKeySearchingInErrorMessageArray;
  String? errorMessage;
  Color? errorColor;

  //other
  TextAlign? textAlign;
  FocusNode? focusNode;

  //icon
  Widget? prefixIcon;
  Widget? suffixIcon;


  TextFieldFastor({
    // validate
    this.validatorCustom,
    // this.validatorType,
    this.autovalidateMode,

    // title
    this.titleText,
    this.titleWidget,

    //text and hint
    this.hint_text,
    this.text_color,
    this.fontSize,
    this.hint_color,
    this.fontFamily,

    //boarder and underline
    this.isRemoveUnderline = false,
    this.isShowBoarder,
    this.showOutlineInput,

    //background + decoration
    this.background_color,
    this.decoration,
    this.decorationBackground, //at the Container

    //spaces
    this.padding,
    this.margin,

    //controller
    this.controller,
    this.onChanged,

    //input content type
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,

    //size and max/min
    this.width,
    this.maxLength,
    this.maxLines,
    this.minLines,

    //errors
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
    this.errorMessage,
    this.errorColor,

    //other
    this.textAlign,
    this.focusNode,

    //icon
    this.prefixIcon, //example "icon" left of textField
    this.suffixIcon

  }) {
      setDefaultValues();
  }

  //--------------------------------------------------------------- default value

  void setDefaultValues() {
    //padding default
    padding ??= EdgeInsets.zero;

    //hint color
    hint_color ??= DSColor.ds_textfield_hint;

    //text color
    text_color ??= DSColor.ds_textfield_text;

    //text size
    fontSize ??= DSDimen.text_level_2;

    //align
    textAlign ??= TextAlign.start;

    //password
    bool isPass = keyboardType != null &&
        keyboardType == TextInputType.visiblePassword;
    if (isPass) {
      obscureText = true;
    }

    //error message
    errorColor ??= Colors.red;

    //choose validator
    autovalidateMode ??= AutovalidateMode.disabled;
    _setValidator();

    makeBothVariableShowOutlineInputAndIsShowBoarderEqualEachOther();

    validateDecorationInputField();

    //??TextInputAction.newline
    if( textInputAction == null ){

      if( keyboardType  == null && keyboardType != TextInputType.text ) { ///crash when make "TextInputType.text" and "TextInputAction.newline"
        if( minLines != null && minLines! > 1 ) {
          textInputAction = TextInputAction.newline;
        }
      }
    }

    //default
    isShowBoarder ??= false;

    errorMessage ??= _getErrorTextBackend();
  }


  void _setValidator() {
    //set default
    validatorChosen = ValidatorTemplate.d();

    //priority for custom
    if (validatorCustom != null) {
      validatorChosen = validatorCustom!;
      // print("_setValidator() - type (validatorChosen)");
      return;
    }
  }


  validateDecorationInputField(){
    /// case not have decoration
    if( decoration == null ) return;

    /// case it's good type of inputDecoration, no problem here
    if( decoration is InputDecoration ) {
      return;
    }

    /// case decoration is type of "Decoration", now set the background to this value
    if( decoration is Decoration ){
      decorationBackground = decoration as Decoration;
      decoration = null; //remove this now not good argument case exception
    }
  }


  void makeBothVariableShowOutlineInputAndIsShowBoarderEqualEachOther(){
    //showOutlineInput
    showOutlineInput ??= false;
    isShowBoarder ??= false;
    if(isShowBoarder! || showOutlineInput! ) {
      showOutlineInput = true;
      isShowBoarder = true;
    }
  }


  String? _getErrorTextBackend( ) {
    if (errorsMessageArray != null) {
      // print( "abdo - _getErrorText() - keyError: keyError");
      // print( "abdo - _getErrorText() - errors![key]: ${errors![keyError]}");
      var result =  errorsMessageArray!.keys.contains( errorKeySearchingInErrorMessageArray) ? errorsMessageArray![errorKeySearchingInErrorMessageArray][0] : null;
      return result;
    } else {
      // print( "abdo - _getErrorText() - errors is (null)");
      return null;
    }
  }

  //----------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    return Container(
      child: columnTitleAndTextField(),
      width: width,
      margin: margin,
      decoration: decorationBackground,
    );
  }

  //-------------------------------------------------------- title

  Widget columnTitleAndTextField(){
    return ColumnFastor(children: [
      titleWidgetIfFound(),
    _getTextFourmField()
    ] );
  }


  Widget titleWidgetIfFound(){

    ///case found custom widget title
    if(titleWidget != null )  return titleWidget!;

    /// case there is just "text" need to be title widget
    if( titleText != null ) return normalTitleWidget();

    ///case not need any tittle
    return const SizedBox();
  }


  Widget normalTitleWidget() {
    return TextFastor(  titleText??"",
      color: text_color??Colors.black,
      fontSize: fontSize??15,
      margin: const EdgeInsets.only(bottom: 20 ),
    );
  }

  //--------------------------------------------------------------- textfield

  TextFormField _getTextFourmField() {
    return TextFormField(
      //validate error
      autovalidateMode: autovalidateMode,
      validator: validatorChosen,

      //text align
      textAlign: textAlign!,

      // //text size
      style: TextStyle(color: text_color, fontSize: fontSize, fontFamily: fontFamily),

      //password keyboard
      obscureText: obscureText,

      // cursor color
      cursorColor: hint_color,

      //padding + hint + underline
      decoration: decoration != null ? decoration :   getDecorationInput( ),

      //keyboard
      keyboardType: keyboardType,
      //TextInputType.number

      //controller
      controller: controller,

      //change
      onChanged: onChanged,

      //submit
      onFieldSubmitted: onChanged,

      //max length
      maxLength: maxLength,
      buildCounter: (BuildContext context,
          {int? currentLength, int? maxLength, bool? isFocused}) => null,

      //lines
      maxLines: maxLines,
      minLines: minLines,

      //action
      textInputAction :  textInputAction ,

      focusNode: focusNode,
    );
  }

  //--------------------------------------------------------------------- input text feild

  InputDecoration getDecorationInput( ) {

    if( isShowBoarder! ) {
      return getDecorationInput_outlineInput(  );
    } else {
      return getDecorationInput_underLine( );
    }
  }

  InputDecoration getDecorationInput_outlineInput( ) {


    //check is need to remove underline
    double widthUnderLine = 1;
    if( isRemoveUnderline! ) {
      widthUnderLine = 0;
    }


    var boarderSide = BorderSide(color: DSColor.ds_textfield_boarder_line,
        width: widthUnderLine);

    var enabledBorder =  OutlineInputBorder(
      borderRadius: BorderRadius.circular(DSDimen.ds_size_corner_level_2),
      borderSide:    boarderSide,
    );

    var  focusedBorder  = OutlineInputBorder(
      borderRadius: BorderRadius.circular( DSDimen.ds_size_corner_level_2), //32.0
      borderSide:  boarderSide  ,
    );

    //error
    var errorBorder =  OutlineInputBorder(
      borderSide: BorderSide(
        color: errorColor!, // Customize the error underline color
      ),
    );
    var focusedErrorBorder =  OutlineInputBorder(
        borderSide: BorderSide(
          color: errorColor!, // Customize the focused error underline color
        ));

    //return value
    return InputDecoration(

      //remove default padding and set custom
      isDense: true,
      contentPadding: padding,

      //hint text
      hintText: hint_text,

      //hint color
      hintStyle: TextStyle(color: hint_color, fontSize: fontSize),

      // underline customer color
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,

      //error text
      errorStyle:   TextStyle(color: errorColor, fontWeight: FontWeight.w500, fontSize: 10),
      errorText : errorMessage,

      //error boarder
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,

      //other
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }


    InputDecoration getDecorationInput_underLine( ) {

    //check is need to remove underline
    double widthUnderLine = 1;
    if( isRemoveUnderline ) {
      widthUnderLine = 0;
    }

    var enabledBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: hint_color!, width: widthUnderLine),
    );

    var focusedBoarder = UnderlineInputBorder(
      borderSide: BorderSide(color: hint_color!, width: widthUnderLine),
    );


    //error
    var errorBorder =  UnderlineInputBorder(
      borderSide: BorderSide(
        color: errorColor!, // Customize the error underline color
      ),
    );
    var focusedErrorBorder =  UnderlineInputBorder(
        borderSide: BorderSide(
          color: errorColor!, // Customize the focused error underline color
        ));

    //return value
    return InputDecoration(

      //remove default padding and set custom
        isDense: true,
        contentPadding: padding,

        //hint text
        hintText: hint_text,

        //hint color
        hintStyle: TextStyle(color: hint_color, fontSize: fontSize),

        // underline customer color
        enabledBorder: enabledBorder,
        focusedBorder: focusedBoarder,

        //error text
        errorText : errorMessage,
        errorStyle:   TextStyle(color: errorColor, fontWeight: FontWeight.w500, fontSize: 10),

        //error boarder
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,

        //other
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon
    );
  }




}