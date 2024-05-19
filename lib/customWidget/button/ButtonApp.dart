

import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';

import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';

///class button ui
class ButtonApp extends StatelessWidget {
  //------------------------------------------------------------------
  String text;

  VoidCallback onPressed;
  Color? textColor;

  double? textFontSize;
  String? fontFamily;
  Color? background;
  double? width;
  double? height;

  //decoration
  Color? borderLine;
  double? borderRadius;
  Decoration? decoration; // must before use this use also width fixed and height
  VoidCallback? onLongPress;
  EdgeInsets? margin;
  EdgeInsets? padding;
  TextAlign? textAlign ; //= TextAlign.center;
  Alignment? gravityLayout; //container alignment

  //progress
  bool? showProgress;
  double? sizeProgress;
  Color? colorProgress;


  ButtonApp(
      this.text,
      this.onPressed,
      {
        this.textColor = Colors.black,
        this.showProgress,
        this.sizeProgress,
        this.colorProgress = Colors.yellow,
        this.textFontSize  = 16 ,
        this.fontFamily,
        this.background = Colors.grey,
        this.width,
        this.height,
        this.borderLine,
        this.borderRadius,
        this.decoration,
        this.onLongPress,
        this.margin,
        this.padding,
        this.textAlign = TextAlign.center ,
        this.gravityLayout,
      }
      ){
    setDefaultValue();
  }


  //------------------------------------------------------------------------- default

  void setDefaultValue() {
    //text dimen, text color, button color, font

    //padding default
    // padding ??= EdgeInsets.only(left: 3.7, right: 3.7, top: 3.7, bottom: 3.7);
    padding ??= EdgeInsets.zero;

    //margin fix
    margin = EdgeInsets.zero;

    showProgress ??= false;

    background ??= Colors.grey.withOpacity(0.5);

    setDefaultProgressSize();
  }


  setDefaultProgressSize(){

    //case have size
    if( sizeProgress != null ) return;

    //case have height
    if( height !=null ) {
      sizeProgress = height! * 0.5;
    }

    //case not have height, take height of font
    return sizeProgress = textFontSize  ;
  }

  //-----------------------------------------------------------------------------


  @override
  Widget build(BuildContext context) {

    //container
    var ct = Container(
      width: width,
      height: height,
      margin: margin,
      alignment: gravityLayout,
      child: buttonWithClickListenerValidateProgressToPreventTouch(),
      decoration: decoration,
    );

    return ct;
  }

  //---------------------------------------------------------------------- choose progress or button

  Widget buttonWithClickListenerValidateProgressToPreventTouch(){
    return  ElevatedButton(
      onPressed: (){

        if( showProgress! == true ) return;
        onPressed();
      },
      onLongPress: (){
        if( showProgress! == true ) return;
        if( onLongPress == null ) return;

        onLongPress!();
      },
      child: chooseButtonTextOrProgressViewInsideButton(),
      style: getButtonStyle(),
    );

  }


  Widget chooseButtonTextOrProgressViewInsideButton(){
    if( showProgress!){
      return progressContainer();
    } else {
      return _getTextWidget(text);
    }
  }

  //----------------------------------------------------------------- progress view

  Widget progressContainer(){
    return Container(
        child: stackTextEmptyWithProgress(),
        padding: EdgeInsets.symmetric(vertical: 0.5, horizontal: 2)
    );
  }


  Widget stackTextEmptyWithProgress(){
    return Stack(children: [
      emptyTextWidgetWithSameWidthOfNormalText(),
      Positioned(child: progressCircle(), left: 0, right: 0, bottom: 7,)
    ],);
  }


  Widget progressCircle(){
    var prog = ProgressCircleApp(size: sizeProgress, color: colorProgress);
    return SizedBox( width: sizeProgress! * 2, child: prog );
  }


  Widget emptyTextWidgetWithSameWidthOfNormalText(){
    int lenghtText = text.toString().length;
    var textSpace = " ";
    for( int i = 0; i < lenghtText ; i++ ) {
      textSpace += " ";
    }
    return _getTextWidget(textSpace);
  }

  //------------------------------------------------------------------- button style and text theme

  Widget _getTextWidget(String text,) {
    //, textAlign!, textColor_ds!, textFontSize!, padding!, font_ds!
    return TextApp(text,
        textAlign: textAlign!,
        color: textColor !,
        fontSize: textFontSize!,
        padding: padding!,
        fontFamily: fontFamily);
  }


  ButtonStyle getButtonStyle(){

    //boarder - line
    borderLine ??= background;
    BorderSide side = BorderSide(color: borderLine!, width: 1);

    //boarder - radius
    var shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( borderRadius??5));

    var size = null;
    if( width != null ) {
      size = Size(width!, height??textFontSize!);
    }

    //style
    var style = ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        fixedSize: size,

       //need to fix [ANALYSIS ISSUE] instead of "primary"
        foregroundColor: background,
        backgroundColor: background,

        side: side,
        shape: shape
      // elevation: 10
    );

    return style;
  }


}
