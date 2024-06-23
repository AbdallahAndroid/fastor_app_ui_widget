
import 'package:fastor_app_ui_widget/customWidget/select/DropdownApp.dart';
import 'package:fastor_app_ui_widget/customWidget/select/widget/PreviousSelected.dart';
import 'package:fastor_app_ui_widget/customWidget/select/core/SpinnerView.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';



extension DropdownContent on DropdownAppState {


  Widget dropdown(){
    return  SpinnerView(
      childers: _listItemDropDownWidget(),
      width_frame: widget.width,
      height_frame: widget.height_frame?? DropdownApp.defaultHeight,
      radiusButton : widget.radiusButton,
      iconSize: widget.iconSize,
      colorDropdownMenu: widget.colorDropdownMenu,
      colorDropdownButtonOutline: widget.colorDropdownButtonOutline,
      underlineColor: widget.underlineColor,
      iconDropdown: widget.iconDropdown,
      textStyleItemDropdown: widget.textStyleItemDropdown,
      decorationOutlineDropdown: widget.decorationOutlineDropdown,
      errorMessageBackend: widget.errorMessageBackend,
      errorBackendKeyJson: widget.errorBackendKeyJson,
      errorBackendJson: widget.errorBackendJson,
      errorTextStyle: widget.errorTextStyle,
      errorOutlineDropdownDropdown: widget.errorOutlineDropdownDropdown,
      hintWidget: chooseHintOrPreviousSelectedTextWidget(),
      previousPosition: widget.previousPosition,
      textDirection : widget.textDirection,
      onSelectPosition:    (p, isRemoveSelected ) {
        if( isRemoveSelected ){
          selected_name =  null;
          if( widget.onRemoveSelected != null ) widget.onRemoveSelected!();
          return;
        }

        //set new result
         selected_name = widget.names[p];
         selected_position = p;

        //callback
        widget.listener(  selected_name!,  selected_position! );
      },

    );
  }


  List<Widget>  _listItemDropDownWidget() {
    List<Widget> listWidget = [];
    int position = 0;
    widget.names.forEach((name) {

      Widget w = _getItemDropdownWidget(name, position);
      listWidget.add( w );
      position += 1;
    });
    return listWidget;
  }


  Widget _getItemDropdownWidget(String name, int positionName){
    return TextApp( name,
      padding: widget.paddingText??EdgeInsets.only( left: 10, right: 10),
      color: getColorItemTextWhenSelectedOrNot(positionName),
      // color:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :  widget.colorHintText,
      fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize??15 : 15 ,
      fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
      textAlign: widget.textAlignItemDropdown ?? TextAlign.left ,
    );
  }


}