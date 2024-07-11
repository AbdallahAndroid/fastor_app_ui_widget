
import 'package:fastor_app_ui_widget/customWidget/column/ColumnApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/validator/ValidatorApp.dart';
import 'package:flutter/material.dart';



import 'package:flutter/material.dart';



class TextFieldApp extends StatelessWidget {

  // validate
  FormFieldValidator<String>? validatorCustom;
  FormFieldValidator<String> validatorChosen = ValidatorApp.d(error_text: "Missed");
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
  bool? isRemoveUnderline  ;

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
  ValueChanged<String>? onFieldSubmitted;

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
  InputDecoration? originalDecorationBeforeErrorEdition ;
  bool isShowErrorBefore = false;

  //other
  TextAlign? textAlign;
  FocusNode? focusNode;

  //icon
  Widget? prefixIcon;
  Widget? suffixIcon;
  double? iconSize;

  TextFieldApp({
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
    this.isRemoveUnderline ,
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
    this.onFieldSubmitted,

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
    this.suffixIcon,
    this.iconSize,

  }) {
    setDefaultValues();
  }

  //--------------------------------------------------------------- default value

  void setDefaultValues() {
    isRemoveUnderline ??= false;

    //padding default
    padding ??= EdgeInsets.zero;

    //hint color
    hint_color ??= Colors.grey;

    //text color
    text_color ??= Colors.black;

    //text size
    fontSize ??= 16;

    //align
    textAlign ??= TextAlign.start;

    //password
    bool isPass = keyboardType != null &&
        keyboardType == TextInputType.visiblePassword;
    if (isPass) {
      obscureText = true;
    }

    //error + decoration
    handleEveryReBuildErrorAndDecorationShape();

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


  }

  void handleEveryReBuildErrorAndDecorationShape(){

    //decoration
    validateDecorationInputField();
    makeBothVariableShowOutlineInputAndIsShowBoarderEqualEachOther();

    //error
    _setErrorMessageValueFromBackend();
    errorColor ??= Colors.red;
    autovalidateMode ??= AutovalidateMode.disabled;
    _setValidator();
    setErrorMessageInCaseCustomDecorationByCloneOriginalInputDecorationAndEditItByErrorMessage();

    /// remove decoration error when error message cleared
    bool oldMessageNeedToBeRemovedFromDecoration =  errorMessage == null  && isShowErrorBefore;
    if( oldMessageNeedToBeRemovedFromDecoration ) {
      decoration = originalDecorationBeforeErrorEdition;
    }
  }

  void _setValidator() {
    // set default
    validatorChosen = ValidatorApp.d();

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


  _setErrorMessageValueFromBackend( ) {
    if (errorsMessageArray != null) {
      // print( "abdo - _getErrorText() - keyError: keyError");
      // print( "abdo - _getErrorText() - errors![key]: ${errors![keyError]}");
      errorMessage =  errorsMessageArray!.keys.contains( errorKeySearchingInErrorMessageArray) ? errorsMessageArray![errorKeySearchingInErrorMessageArray][0] : null;
      //  print( "TextFieldApp - _getErrorTextBackend() - errorMessage: ${errorMessage}");
    }
  }


  /// why make clone decoration ?
  ///    when use "error_message" backend it can not show due to sometimes user
  ///    use custome "decoration" inputDecoration.
  void setErrorMessageInCaseCustomDecorationByCloneOriginalInputDecorationAndEditItByErrorMessage() {
    InputDecoration? cloneDecoration;
    if( errorMessage != null  && decoration != null ) {
      originalDecorationBeforeErrorEdition = decoration;
      isShowErrorBefore = true;

      cloneDecoration = InputDecoration(

        /// clode to edit this
        errorText: errorMessage,

        icon: decoration!.icon,
        iconColor: decoration!.iconColor,
        label: decoration!.label,
        labelText: decoration!.labelText,
        floatingLabelStyle: decoration!.floatingLabelStyle,
        helperText : decoration!.helperText,
        helperStyle : decoration!.helperStyle,
        helperMaxLines: decoration!.helperMaxLines,
        hintText : decoration!.hintText,
        hintStyle: decoration!.hintStyle,
        hintTextDirection : decoration!.hintTextDirection,
        hintMaxLines: decoration!.hintMaxLines,
        error  : decoration!.error,
        errorMaxLines: decoration!.errorMaxLines,
        floatingLabelBehavior : decoration!.floatingLabelBehavior,
        floatingLabelAlignment: decoration!.floatingLabelAlignment,
        isCollapsed : decoration!.isCollapsed,
        isDense: decoration!.isDense,
        contentPadding : decoration!.contentPadding,
        prefixIcon: decoration!.prefixIcon,
        prefixIconConstraints : decoration!.prefixIconConstraints,
        prefix: decoration!.prefix,
        prefixText : decoration!.prefixText,
        prefixStyle: decoration!.prefixStyle,
        prefixIconColor: decoration!.prefixIconColor,
        suffixIcon: decoration!.suffixIcon,
        suffix: decoration!.suffix,
        suffixText: decoration!.suffixText,
        suffixStyle : decoration!.suffixStyle,
        suffixIconColor: decoration!.suffixIconColor,
        suffixIconConstraints: decoration!.suffixIconConstraints,
        counter: decoration!.counter,
        counterText: decoration!.counterText,
        counterStyle: decoration!.counterStyle,
        filled : decoration!.filled,
        fillColor: decoration!.fillColor,
        focusColor: decoration!.focusColor,
        hoverColor: decoration!.hoverColor,
        errorBorder: decoration!.errorBorder,
        focusedBorder: decoration!.focusedBorder,
        focusedErrorBorder: decoration!.focusedErrorBorder,
        disabledBorder : decoration!.disabledBorder,
        enabledBorder: decoration!.enabledBorder,
        border: decoration!.border,
        enabled: decoration!.enabled,
        semanticCounterText : decoration!.semanticCounterText,
        alignLabelWithHint: decoration!.alignLabelWithHint,
        constraints  : decoration!.constraints,
      );
      decoration = cloneDecoration;
      // print("TextFieldApp - setErrorMessageInCaseCustomDecoration() clone decoration error"   );
    }
  }

  //----------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    setDefaultValues();

    // print("TextFieldApp - build() errorMessage: $errorMessage"   );
    return Container(
      child: columnTitleAndTextField(),
      width: width,
      margin: margin,
      decoration: decorationBackground,
    );
  }

  //-------------------------------------------------------- title

  Widget columnTitleAndTextField(){
    return ColumnApp(children: [
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
    return TextApp(  titleText??"",
      color: text_color??Colors.black,
      fontSize: fontSize??15,
      margin: const EdgeInsets.only(bottom: 20 ) ,
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

      //padding + hint + underline + error_message
      decoration:  chooseDecoration(),

      //keyboard
      keyboardType: keyboardType,
      //TextInputType.number

      //controller
      controller: controller,

      //change
      onChanged: onChanged,

      //submit
      onFieldSubmitted: onFieldSubmitted??onChanged,

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

  InputDecoration? chooseDecoration() {
    return decoration != null ? decoration :   getDecorationBoarderOrNotUnderLineShape( );
  }


  InputDecoration getDecorationBoarderOrNotUnderLineShape( ) {
    //print( "abdo - getDecorationBoarderOrNotUnderLineShape()");
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


    var boarderSide = BorderSide(color: Colors.grey,
        width: widthUnderLine);

    var enabledBorder =  OutlineInputBorder(
      borderRadius: BorderRadius.circular(10 ),
      borderSide:    boarderSide,
    );

    var  focusedBorder  = OutlineInputBorder(
      borderRadius: BorderRadius.circular( 10 ), //32.0
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

        /// fix icon size
        prefixIconConstraints: iconSize != null ? BoxConstraints(
          minWidth: iconSize!, // Adjust the minimum width as needed
          minHeight: iconSize!, // Adjust the minimum height as needed
        ) : null ,
        suffixIconConstraints:iconSize != null ?  BoxConstraints(
          minWidth: iconSize!, // Adjust the minimum width as needed
          minHeight: iconSize!, // Adjust the minimum height as needed
        ): null

    );
  }


  InputDecoration getDecorationInput_underLine( ) {

    //check is need to remove underline
    double widthUnderLine = 1;
    if( isRemoveUnderline! ) {
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
        enabledBorder:isRemoveUnderline! ? InputBorder.none :  enabledBorder,
        focusedBorder: isRemoveUnderline! ? InputBorder.none : focusedBoarder,
        border: isRemoveUnderline! ? InputBorder.none : null ,
        disabledBorder: isRemoveUnderline! ? InputBorder.none : null ,

        //error text
        errorText : errorMessage,
        errorStyle:   TextStyle(color: errorColor, fontWeight: FontWeight.w500, fontSize: 10),

        //error boarder
        errorBorder:  errorBorder,
        focusedErrorBorder:   focusedErrorBorder,


        //other
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        // fix icon size
        prefixIconConstraints: iconSize != null ? BoxConstraints(
          minWidth: iconSize!, // Adjust the minimum width as needed
          minHeight: iconSize!, // Adjust the minimum height as needed
        ) : null ,
        suffixIconConstraints:iconSize != null ?  BoxConstraints(
          minWidth: iconSize!, // Adjust the minimum width as needed
          minHeight: iconSize!, // Adjust the minimum height as needed
        ): null


    );
  }







}