
import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemFont.dart';
import 'package:fastor_app_ui_widget/resource/template/EdgeInsets/EdgeInsetsTools.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';

class CheckboxFastor  extends StatelessWidget {


  BuildContext context;
  bool value;
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
  Color? color_inactive;
  Color? color_active;

  CheckboxFastor({
    required this.context,
    required this.value,
    required this.onChanged,
    this.removePaddingClick = true,
    this.color_inactive,
    this.color_active,
    this.size_scale = 1.0,
    this.margin,
    this.padding,

    //text
    this.text = "",
    this.text_dimen = 0,
    this.text_color,
    this.fontFamily,
  })  {

    color_active ??= DSColor.tap_active;
    color_inactive ??= DSColor.tap_inactive;
  }


  @override
  Widget build(BuildContext context) {
//Checkbox
    var ch = Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: color_active!!, //background color when it's active
    );

    //theme
    var theme = Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: color_inactive! , //inactive color
     //     toggleableActiveColor: color_active!! //active color
      ),
      child: ch,
    );

    // default padding size
    final double defaultPaddingSizeClick = 20;

    /**
     * this default padding cause the click more easy to mobile
     *  the mobile when click arround the checkbox it's working
     */
    double paddingCheckBoxClick = 40;
    if (removePaddingClick!) {
      paddingCheckBoxClick = defaultPaddingSizeClick;
    }

    //fix: remove default padding
    var sizeBox = SizedBox(
        child: theme,
        width: paddingCheckBoxClick,
        height: paddingCheckBoxClick);

    //fix material
    // var material = Material(child: sizeBox);

    //size by scale
    var scale = Transform.scale(scale: size_scale, child: sizeBox);

    /////////////////////////////////////// text

    //font
    fontFamily ??= DSFont.h3;

    //fix null
    String paddingLeftCheckBoxTap = "  ";
    String s = paddingLeftCheckBoxTap + text!;

    //dimen
    var myDimen = DSDimen.text_level_3;
    if (text_dimen != 0) {
      myDimen = text_dimen!;
    }

    //color
    Color myColor = DSColor.text_h3;
    if (text_color != null) {
      myColor = text_color!;
    }

    //style
    var myStyle = TextStyle(
        fontSize: myDimen,
        color: myColor,
        fontFamily: fontFamily,
        decoration: TextDecoration.none);

    //tx
    var tx = Text(s, textAlign: TextAlign.left, style: myStyle);

    //row title
    var row = RowTemplate.wrapChildren([scale, tx]);

    //fix default padding at the container when there is padding for click
    if (removePaddingClick == false) {
      padding =
          EdgeInsetsTools.fixDefaultSpace(padding, defaultPaddingSizeClick);
    }

    // space
    var ct = Container(margin: margin, padding: padding, child: row);

    return ct;
  }


}
