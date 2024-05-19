
import 'package:fastor_app_ui_widget/resource/template/select/fastor/widget/PreviousSelected.dart';
import 'package:flutter/material.dart';



extension DropdownContent on DropdownFastorState {


  Widget dropdown(){
    return  SpinnerView(
      childers: _listItemDropDownWidget(),
      width_frame: widget.width,
      height_frame: widget.height_frame?? DropdownFastor.defaultHeight,
      radiusButton : widget.radiusButton,
      iconSize: widget.iconSize,
      colorDropdownMenu: widget.colorDropdownMenu,
      colorDropdownButtonOutline: widget.colorDropdownButtonOutline,
      underlineColor: widget.underlineColor,
      iconDropdown: widget.iconDropdown,
      textStyleItemDropdown: widget.textStyleItemDropdown,
      decorationOutlineDropdown: widget.decorationOutlineDropdown,
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
    return TextFastor( name,
      levelDS: LevelDS.l3,
      padding: widget.paddingText??EdgeInsets.only( left: 10, right: 10),
      color: getColorItemTextWhenSelectedOrNot(positionName),
      // color:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.color :  widget.colorHintText,
      fontSize:  widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontSize : null ,
      fontFamily: widget.textStyleItemDropdown != null ? widget.textStyleItemDropdown!.fontFamily : null ,
      textAlign: widget.textAlignItemDropdown ?? TextAlign.left ,
    );
  }


}