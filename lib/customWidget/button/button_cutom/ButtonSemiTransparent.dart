import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:flutter/material.dart';


class ButtonSemiTransparent extends StatelessWidget {

  String title;
  VoidCallback onPressed;
  double? width;
  double? height;
  double? radius;

  ButtonSemiTransparent(
      this.title,
      this.onPressed, {
        this.width,
        this.height,
        this.radius,
      }
      );

  @override
  Widget build(BuildContext context) {
    return ButtonApp( title,onPressed,
      width: width??DeviceTools.getWidth(context),
      height: height??Figma.h(50),
      borderRadius: radius??25,
      background: Colors.black.withOpacity(0.5),
      colorProgress: Colors.white,
      decoration: BoarderHelper.cardView(
          radiusSize: 25,
          colorBackground: Colors.black.withOpacity(0.5),
          colorLine: Colors.green
      ),
    );
  }


}