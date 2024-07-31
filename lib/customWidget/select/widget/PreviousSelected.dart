
import 'package:fastor_app_ui_widget/customWidget/select/DropdownApp.dart';
import 'package:fastor_app_ui_widget/customWidget/select/widget/DropdownContent.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


extension PreviousSelected on DropdownAppState {


  Widget  chooseHintOrPreviousSelectedTextWidget(){
    // if( widget.previousSelectedText == null ) {
    //   return _hint();
    // } else {
    //   return previousSelectedWidget();
    // }
    return _hint();
  }


  Widget _hint(){
    if(widget.hintWidget != null ) return widget.hintWidget!;

    return  TextApp( widget.hintText??"select",
        width: getWidthTextWidget(),
        padding: widget.paddingText??EdgeInsets.only(  left: 10, right: 10),
        fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize! : 15 ,
        fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
        color:   widget.colorHintText,
        textAlign: widget.textAlignItemDropdown ?? TextAlign.start
    );
  }


// Widget previousSelectedWidget(){
//   if( widget.previousSelectedText == null ) return SizedBox();
//   return TextApp( widget.previousSelectedText??"",
//     padding: widget.paddingText??EdgeInsets.only( left: 10, right: 10),
//     color: getColorItemTextWhenSelected( ),
//     // color:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :  widget.colorHintText,
//     fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize! : 15 ,
//     fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
//     textAlign: widget.textAlignItemDropdown ?? TextAlign.left ,
//   );
// }

}