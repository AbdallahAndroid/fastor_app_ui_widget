import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/row/RowUtils.dart';


import 'package:flutter/material.dart';

class CheckboxApp  extends StatefulWidget {

  bool value; /// init value
  ValueChanged<bool?> onChanged;

  bool? removePaddingClick = true;
  double? size_scale = 1.0;
  EdgeInsets? margin;
  EdgeInsets? padding;

  //text
  String? text = "";
  double? text_dimen = 0;
  Color? text_color;
  String? fontFamily;

  //input color
  Color? colorInActive;
  Color? colorActive;

  CheckboxApp({
    required this.value,
    required this.onChanged,
    required this.colorActive,
    required this.colorInActive,
    this.removePaddingClick = true,

    this.size_scale = 1.0,
    this.margin,
    this.padding,

    //text
    this.text = "",
    this.text_dimen = 0,
    this.text_color,
    this.fontFamily,
  }) ;


  @override
  _CheckboxAppState createState() => _CheckboxAppState();
}
class _CheckboxAppState  extends State<CheckboxApp> {

  bool selectedValue = false;


  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }


  @override
  Widget build(BuildContext context) {

    // default padding size
    final double defaultPaddingSizeClick = 20;

    /**
     * this default padding cause the click more easy to mobile
     *  the mobile when click arround the checkbox it's working
     */
    double paddingCheckBoxClick = 40;
    if (widget.removePaddingClick!) {
      paddingCheckBoxClick = defaultPaddingSizeClick;
    }

    /////////////////////////////////////// text

    //fix null
    String paddingLeftCheckBoxTap = "  ";
    String s = paddingLeftCheckBoxTap + widget.text!;


    //fix default padding at the container when there is padding for click
    if (widget.removePaddingClick == false) {
      widget.padding = EdgeInsets.zero;
    }

    // space
    return Container(
        margin: widget.margin,
        padding: widget.padding,
        child: Row( children : [

          /// checkbox
          Transform.scale(
              scale: widget.size_scale,
              child: SizedBox(
                  child: Checkbox(
                    value: selectedValue,
                    side:  sideCheckbox(),
                    fillColor: fillColorCheckBox(),
                    onChanged: ( newValue){
                      updateUi(newValue);
                    },
                    activeColor: widget.colorActive!, //background color when it's active

                  ),
                  width: paddingCheckBoxClick,
                  height: paddingCheckBoxClick
              )
          ),

          /// title
          Text(s, textAlign: TextAlign.left, style: TextStyle(
              fontSize: widget.text_dimen,
              color: widget.text_color,
              fontFamily: widget.fontFamily,
              decoration: TextDecoration.none))

        ])
    );
  }

  sideCheckbox() {
    return  WidgetStateBorderSide.resolveWith((states) {
      if (!states.contains(WidgetState.selected)) {
        return BorderSide(width: 2, color: widget.colorInActive!); // Unselected border
      }
      return BorderSide(width: 2, color: widget.colorActive!); // Selected border
    });
  }


  fillColorCheckBox() {
    return  WidgetStateProperty.resolveWith((states) {
      if (!states.contains(WidgetState.selected)) {
        return Colors.transparent; // Unselected color
      }
      return widget.colorActive; // Selected color
    });
  }

  void updateUi(bool? newValue) {

    setState(() {
      selectedValue = newValue??false;
    });


    widget.onChanged(newValue);
  }


}




