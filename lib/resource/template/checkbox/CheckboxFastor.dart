import 'package:flutter/material.dart';
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
  Color? colorInActive;
  Color? colorActive;

  CheckboxFastor({
    required this.context,
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
  Widget build(BuildContext context) {
//Checkbox
    var ch = Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: colorActive!, //background color when it's active

    );

    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: colorInActive,
      ),
      home: ch,
    );
    // //theme


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
        child: materialApp,
        width: paddingCheckBoxClick,
        height: paddingCheckBoxClick);

    //fix material
    // var material = Material(child: sizeBox);

    //size by scale
    var scale = Transform.scale(scale: size_scale, child: sizeBox);

    /////////////////////////////////////// text

    //fix null
    String paddingLeftCheckBoxTap = "  ";
    String s = paddingLeftCheckBoxTap + text!;



    //style
    var myStyle = TextStyle(
        fontSize: text_dimen,
        color: text_color,
        fontFamily: fontFamily,
        decoration: TextDecoration.none);

    //tx
    var tx = Text(s, textAlign: TextAlign.left, style: myStyle);

    //row title
    var row = RowTemplate.wrapChildren([scale, tx]);

    //fix default padding at the container when there is padding for click
    if (removePaddingClick == false) {
      padding = EdgeInsets.zero;
    }

    // space
    var ct = Container(margin: margin, padding: padding, child: row);

    return ct;
  }


}


