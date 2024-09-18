import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


class ButtonFullTransparent extends StatelessWidget {

  BuildContext? context;

  String title;
  GestureTapCallback onPressed;
  double? width;
  double? height;
  double? radius;
  double? fontSize;
  Color? textColor;

  ButtonFullTransparent(
      this.title,
      this.onPressed, {
        this.width,
        this.height,
        this.radius,
        this.fontSize,
        this.textColor
      }
      );


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GestureDetector(
      child: containerButtonUI(),
      onTap: onPressed,
    );
  }

  Widget containerButtonUI(){
    return Container(
      width: width??DeviceTools.getWidth(context!),
      height: height??Figma.h( 45 ),
      alignment: Alignment.center,
      child: TextApp( title ,
        fontSize: fontSize??Figma.h(16),
        color: textColor??Colors.blue,
      ),
    );
  }

}