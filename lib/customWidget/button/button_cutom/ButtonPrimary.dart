import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:flutter/material.dart';


class ButtonPrimary extends StatelessWidget {

  String title;
  double? radius;
  VoidCallback onPressed;

  bool? showProgress;

  /// icon
  Widget? iconCenter;

  double? width;
  double? height;
  double? fontSize;

  Color? backgroundColor;

  ButtonPrimary(
      this.title,
      this.onPressed,
  {
    this.radius,
    this.showProgress,
    this.iconCenter,
    this.width,
    this.height,
    this.fontSize,
    this.backgroundColor
  }
      );

  @override
  Widget build(BuildContext context) {
    return ButtonApp( title, onPressed,
        width: width??DeviceTools.getWidth(context),
        // fontFamily: FontResources.mediumHellix,
        borderRadius: radius??8,
        showProgress:  showProgress,
        colorProgress: Colors.white,
        iconCenter: iconCenter,
        textFontSize:  fontSize??Figma.h( 16 ) ,
        height: height??Figma.h( 50 ),
        background: backgroundColor,
    );
  }


}