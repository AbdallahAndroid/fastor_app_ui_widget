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
        colorLine: AppColor.greenLight,
        colorBackground: AppColor.white);
  }


  ///------------------------------------------------------------- appbar 

  static linearGradientBackgroundFullScreenCausingTopAppbarDark() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColor.primaryDark,
          AppColor.primaryLight,
          AppColor.primaryLight,
          AppColor.primaryLight,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  static cardBodyScreen() {
    return BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        border: Border.all(color: AppColor.white));
  }


  ///------------------------------------------------------------------ textfield


  static textField() {
    return BoarderHelper.cardView(
        radiusSize: 12.r,
        colorLine: AppColor.textFieldBoarderLine,
        colorBackground: AppColor.white
    );
  }


}