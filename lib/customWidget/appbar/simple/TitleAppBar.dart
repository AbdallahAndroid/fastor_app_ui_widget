import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {

  String title;

  TitleAppBar( this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextApp( title,
        fontSize: Figma.h(16),
        color: Colors.white,
      ),
      width: DeviceTools.getWidth(context),
      // color: Colors.red,
    );
  }
}