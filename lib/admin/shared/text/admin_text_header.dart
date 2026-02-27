import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class AdminTextHeader extends StatelessWidget {

  String text;

  AdminTextHeader( this.text );

  @override
  Widget build(BuildContext context) {
    return TextApp( text  ,
      fontFamily: FontProject.w900,
      fontSize: 20.spt ,
    );
  }
}