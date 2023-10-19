import 'package:flutter/material.dart';
import 'package:log_debug/log_debug.dart';

class NotchBarConstant {

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
      LogDebug.e( "NotchBarConstant - getHeight() - err: $err ");
      return 65;
    }

  }


}