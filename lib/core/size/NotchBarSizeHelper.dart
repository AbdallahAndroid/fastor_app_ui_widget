import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';

class NotchBarSizeHelper {

  static double? _paddingBottom ;


  static double getTop( BuildContext context ) {
    try {
      var result=  MediaQuery.of(context).viewPadding.top;
      //Log.i( "NotchBarConstant - getTop() - result: $result ");
      return result;
    }  catch (err) {
      Log.e( "NotchBarConstant - getTop() - err: $err ");
      return 65;
    }
  }

  static double getBottom( BuildContext context ) {
    try {
      if( _paddingBottom != null ) return _paddingBottom!;
      _paddingBottom =  MediaQuery.of(context).viewPadding.bottom;
      //var result =  MediaQuery.of(context).padding.bottom;
      //  Log.i( "NotchBarConstant - getHeight() - result: $r2 ");
      return _paddingBottom!;
    }  catch (err) {
      Log.e( "NotchBarConstant - getHeight() - err: $err ");
      return 65;
    }
  }


  static double getHeightTopAndDown( BuildContext context ) {
    return getTop(context) +  getBottom(context) ;
  }

}