import 'dart:async';

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogMessageAwesomeHelper {


  static Future buttonConfirmCloseApplication(BuildContext context ) async {
    Log.i("DialogMessageHelper - buttonConfirmCloseApplication()  ");
    AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        title:  "Confirm Close Application".tr() ,
        titleTextStyle: TextStyle(fontSize: 18, color: AppColor.black, fontFamily: FontProject.w500),
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        btnCancelText: "Close App".tr(),
        btnOkText: "Continue".tr(),
        btnCancelOnPress: (){
          SystemNavigator.pop();
        },
        btnOkOnPress: () {
          // Navigator.pop(context);
        },
        onDismissCallback: (s){
          // Navigator.pop(context);
        }
    ).show();
  }


  static Future buttonDownloadAgainOrCancel(BuildContext context, {required String  msg,
    required Function()  btnOkOnPressed,
    required Function()  btnCancelOnPressed

  }) async {
    Log.i("DialogMessageHelper - buttonDownloadAgainOrCancel() - msg: $msg");
     AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        title: msg ,
        titleTextStyle: TextStyle(fontSize: 18, color: AppColor.black, fontFamily: FontProject.w500),
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        btnCancelText: "Cancel".tr(),
        btnOkText: "Download Again".tr(),
        btnCancelOnPress: (){
          Navigator.pop(context);
          btnCancelOnPressed();
        },
        btnOkOnPress: () {
          Navigator.pop(context);
          btnOkOnPressed();
        },
      onDismissCallback: (s){
        Navigator.pop(context);
      }
    ).show();
  }



  static Future messageWithOptionalCancel(
      BuildContext context, {
        required String  msg,
        // required String buttonTitle,
          Function()?  btnOkOnPressed}) async {

    Log.i("DialogMessageHelper - messageWithOptionalCancel() - msg: $msg");
   AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        title: msg,
        titleTextStyle: TextStyle(fontSize: 18, color: AppColor.black, fontFamily: FontProject.w500),
        dismissOnBackKeyPress: true,
        dismissOnTouchOutside: true,
        btnOkText: "Ok".tr(),
        btnOkOnPress: () {
          Navigator.pop(context);
          // Navigator.pop(context);
          if(btnOkOnPressed != null )btnOkOnPressed();
        },
        onDismissCallback: (s){
          Navigator.pop(context);
        }
    ).show();
  }

  static void info(BuildContext context, String msg ) {
    justMessage(context, msg);
  }
  static void justMessage(BuildContext context, String msg ) {
    Log.i("DialogMessageHelper - justMessage() - msg: $msg");
    AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        title: msg,
        titleTextStyle: TextStyle(fontSize: 18, color: AppColor.black, fontFamily: FontProject.w500),
        dismissOnBackKeyPress: true,
        dismissOnTouchOutside: true,
        btnOkText:  "OK".tr(),

    );
  }

  static void success(BuildContext context, String msg) {
    Log.i("DialogMessageHelper - success() - msg: $msg");
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      title: msg,
      titleTextStyle: TextStyle(fontSize: 18, color: AppColor.black, fontFamily: FontProject.w500),
      dismissOnBackKeyPress: true,
      dismissOnTouchOutside: true,


    );
  }

}