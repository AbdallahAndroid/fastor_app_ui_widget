import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';

class NotchBarSizeHelper {

  static double? paddingBottom ;

  // static void initNotchBarValues(BuildContext context) {
  //   paddingBottom = null;
  //
  //   //get again
  //   getHeight(context);
  // }


  //size
  static double getHeight( BuildContext context ) {

    try {

      if( paddingBottom != null ) return paddingBottom!;

      paddingBottom =  MediaQuery.of(context).viewPadding.bottom;
      //var result =  MediaQuery.of(context).padding.bottom;
    //  Log.i( "NotchBarConstant - getHeight() - result: $r2 ");
      return paddingBottom!;
    }  catch (err) {
      Log.e( "NotchBarConstant - getHeight() - err: $err ");
      return 65;
    }

  }


}