
import 'package:fastor_app_ui_widget/resource/template/select/fastor/DropdownFastor.dart';
import 'package:fastor_app_ui_widget/resource/template/text/TextFastor.dart';
import 'package:flutter/material.dart';

extension PreviousSelected on DropdownFastorState {


  Widget  chooseHintOrPreviousSelectedTextWidget(){
    if( widget.previousSelectedText == null ) {
      return _hint();
    } else {
      return previousSelectedWidget();
    }
  }


  Widget _hint(){
    if(widget.hintWidget != null ) return widget.hintWidget!;

    return  TextFastor( widget.hintText??"select",
        padding: widget.paddingText??EdgeInsets.only(  left: 10, right: 10),
        fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize! : 15 ,
        fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
        color:   widget.colorHintText,
        textAlign: widget.textAlignItemDropdown ?? TextAlign.left  );
  }


  Widget previousSelectedWidget(){
    if( widget.previousSelectedText == null ) return SizedBox();
    return TextFastor( widget.previousSelectedText??"",
      padding: widget.paddingText??EdgeInsets.only( left: 10, right: 10),
      color: getColorItemTextWhenSelected( ),
      // color:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :  widget.colorHintText,
      fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize! : 15 ,
      fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
      textAlign: widget.textAlignItemDropdown ?? TextAlign.left ,
    );
  }

}