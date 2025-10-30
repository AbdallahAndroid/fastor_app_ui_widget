
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class TextUnderlineButton extends StatelessWidget {

  String text;
  GestureTapCallback  onTap;
  double widthUnderLine;

  TextUnderlineButton( this.text, {
    required this.widthUnderLine,
    required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextApp(
           text ,
            textStyle: TextStyle(
              fontFamily: FontProject.w600,
              fontSize: 16.sp ,
              color: AppColors.primaryDark,

            )
          ),

          Transform.translate(
            offset:   Offset(0, -4.sp ), // Move up by 1 pixel
            child: Container(
              height: 2, // underline thickness
              width: widthUnderLine,
              color: AppColors.primaryDark,
            )
          )

          ,
        ],
      )

    );
  }

}