
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/size/TextWidthCalculatorApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/text_custom/TextCustomBold.dart';
import 'package:flutter/cupertino.dart';

class DividerApp extends StatelessWidget {

  double _fontSize = Figma.h( 24);

  String? titleLeftDivider;
  double? marginLeftRight;
  double? widthOfTitle;
  Color? color;


  DividerApp({ this.color, this.titleLeftDivider, this.widthOfTitle, this.marginLeftRight}){

    marginLeftRight ??= 0;
  }

  setDefaultWidthOfTitleIfNotFoundWidth(BuildContext context ){
    if ( titleLeftDivider != null ) {
      if( widthOfTitle == null ) {
        widthOfTitle = TextWidthCalculatorApp.get(
            context: context,
            txt: titleLeftDivider!,
            dimenFont: _fontSize
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    setDefaultWidthOfTitleIfNotFoundWidth(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginLeftRight!),
      child: chooseShape(context),
    );
  }


  chooseShape(BuildContext context ) {
    if(titleLeftDivider != null ) {
      return lineBesideTitleLeft(context);
    }

    return line(context);
  }


  Widget lineBesideTitleLeft(BuildContext context ) {
    return Container(
      child: Row(
        children: [
          Container(
            width: widthOfTitle,
            child: TextCustomBold( titleLeftDivider??"", fontSize: _fontSize,),
          ),
          line(context)
        ],
      ),
    );
  }


  Widget line(BuildContext context ){
    return  Container(
      width: DeviceTools.getWidth(context) - (widthOfTitle??0) - (marginLeftRight! * 2 ) ,
      height: 0.5,
      color: color??ColorResource.dividerPrimaryLight,
    );
  }


}