import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/card_message/message_bottom_sheet_screen.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/card_message/message_card_center_screen.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/card_message/message_effect_glass_center_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogMessageScreenTransparentHelper {


  static void showCenterTypeEffectGlass( {
    required BuildContext context,
    required String title ,
    required double height,
    String? description,
    Color? barrierColor,
    bool?  barrierDismissible,
    VoidCallback? onPressedOk,
    VoidCallback? onPressedCancel
  } ) {

    showDialog(
      context: context,
      barrierColor: barrierColor??Colors.transparent,
      barrierDismissible: barrierDismissible??false, // prevent closing by tapping outside >> make it false if you want to force the user to interact with the dialog
      builder: (BuildContext context) {
        return MessageEffectGlassCenterScreen(
            title: title,
            height: height,
            description: description,
            onPressedOk: onPressedOk,
            onPressedCancel: onPressedCancel,
        );

      },
    );
  }


  static void showCenter( {
    required BuildContext context,
    required String msg ,
    Color? barrierColor,
    bool?  barrierDismissible,
    VoidCallback? onPressedOk} ) {

    showDialog(
      context: context,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible??false, // prevent closing by tapping outside >> make it false if you want to force the user to interact with the dialog
      builder: (BuildContext context) {
        return MessageCardCenterScreen(msg: msg, onPressedOk: onPressedOk);

      },
    );
  }

  static void showBottom( {
    required BuildContext context,
    required String msg ,
    Color? backgroundColor,
    VoidCallback? onPressedOk} ) {

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      // b: backgroundColor??Colors.transparent,
      builder: (BuildContext context) {
        return   MessageBottomSheetScreen(
            msg: msg,
            backgroundColor: backgroundColor,
            onPressedOk: onPressedOk);

      },
    );
  }



  static void backgroundBlackTransparentBottomSheet( {
    required BuildContext context,
    required String msg ,
    String? titleOk,
    String? titleCancel,
    VoidCallback? onPressedOk,
    VoidCallback? onPressedCancel } ) {

    showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialogFixingPreviousScreenInCaseWhite,
      // b: backgroundColor??Colors.transparent,
      builder: (BuildContext context) {
        return   MessageBottomSheetScreen(
            msg: msg,
            titleOk: titleOk,
            titleCancel: titleCancel,
            onPressedCancel: onPressedCancel,
            onPressedOk: onPressedOk);

      },
    );
  }


}