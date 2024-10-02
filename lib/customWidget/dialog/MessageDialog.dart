import 'dart:math';

import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonPrimary.dart';
import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';


class MessageDialog {


  static redownloadButton(BuildContext context, String title, Function() btnOkOnPress) async {

    // String msg = "trying again to download data".tra();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      width: Figma.w(350),

      /// title
      title: title,
      titleTextStyle:   TextStyle(
          // fontFamily: FontResource.semibold,
          fontSize: 20
      ),

      /// description message
      // desc: msg,
      descTextStyle:   TextStyle(
          // fontFamily: FontResource.regular,
          fontSize: 14
      ),

      /// ok button
      btnOk:    ButtonPrimary(
        "Download".tra(), (){
        Navigator.pop( context);
        btnOkOnPress();
    },
    // width: Figma.w(figmaSize),
    radius: 15,
    ),
      btnOkOnPress: () {
        Navigator.pop( context);
      },



    ).show();
  }





  static message(BuildContext context, String title, String msg, Function() btnOkOnPress) async {

    AwesomeDialog(
      context: context,
      // dialogBackgroundColor: ColorResource.backgroundDialog,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      width: Figma.w(350),

      /// title
      title: title,
      titleTextStyle:   TextStyle(
          // fontFamily: FontResource.semibold,
          // color: ColorResource.textPrimary,
          fontSize: 20
      ),

      /// description message
      desc: msg,
      descTextStyle:   TextStyle(
          // fontFamily: FontResource.regular,
          // color: ColorResource.textPrimary,
          fontSize: 14
      ),

      /// ok button
      btnOk:    ButtonPrimary(
        "OK".tra(), (){
        Navigator.pop( context);
        btnOkOnPress();
      },
        // width: Figma.w(figmaSize),
        radius: 15,
      ),
      btnOkOnPress: () {
        Navigator.pop( context);
      },



    ).show();
  }



}