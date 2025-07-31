import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';

abstract class AppDecoration {


  ///------------------------------------------------------------- dialog
  ///
  static dialogWhite() {
    return BoarderHelper.cardView(
        radiusSize: 30.h,
        colorLine: ColorResource.greenLight,
        colorBackground: ColorResource.white);
  }


  ///------------------------------------------------------------- appbar 

  static linearGradientBackgroundFullScreenCausingTopAppbarDark() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          ColorResource.primaryDark,
          ColorResource.primaryLight,
          ColorResource.primaryLight,
          ColorResource.primaryLight,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  static cardBodyScreen() {
    return BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        border: Border.all(color: ColorResource.white));
  }
}