import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class TitleDialog extends StatelessWidget {

  String title;

  TitleDialog( this.title );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:  Alignment.topCenter,
      child:  TextApp(  title ,
        fontSize: Figma.h(18),
        fontFamily: FontProject.w700,
        textAlign: TextAlign.center,
      ),
    );
  }
}