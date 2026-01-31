
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class ErrorTextfield extends StatelessWidget {

  String msg;
  ErrorTextfield(this.msg);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: TextApp(   msg??"",
        color: AppColors.textFieldError,
        fontSize: Figma.w(12),
      ),
    );
  }


}