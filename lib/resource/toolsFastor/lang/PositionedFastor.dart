import 'package:fastor_app_ui_widget/resource/toolsFastor/lang/LangFastor.dart';
import 'package:flutter/material.dart';

class PositionedFastor {


  static Positioned langFastor( {

    required Widget child,
    double? left,
    double? right,
    double? top,
    double? bottom,
  } ) {
    bool isArabic = LangFastor.isArabic;
    if( isArabic ) {
      return Positioned(child: child,
        top: top,
        bottom: bottom,
        right: left,
        left: right,
      );
    } else {
      return Positioned(child: child,
        top: top,
        bottom: bottom,
        right:  right,
        left: left,
      );
    }

  }


  static Positioned directional( {

    required TextDirection textDirection,
    required Widget child,
    double? start,
    double? end,
    double? top,
    double? bottom,
  } ) {
    bool isArabic = textDirection == TextDirection.rtl;
    if( isArabic ) {
      return Positioned(child: child,
        top: top,
        bottom: bottom,
        right: end,
        left: start,
      );
    } else {
      return Positioned(child: child,
        top: top,
        bottom: bottom,
        right: start,
        left: end,
      );
    }

  }

/**
    static double? stackEnglishRight(double? valueRight ) {
    if( LangFastor.isArabic ) {
    return valueRight;
    } else {
    return null;
    }
    }


    static double? stackEnglishLeft(double? valueLeft ) {
    if( LangFastor.isArabic ) {
    return null;
    } else {
    return valueLeft;
    }
    }



    static stackEnglishRightByTextDirection(TextDirection textDirection, double? valueRight ) {
    bool isArabic = textDirection == TextDirection.rtl;
    if( isArabic ) {
    return valueRight;
    } else {
    return null;
    }
    }


    static stackEnglishLeftByTextDirection(TextDirection textDirection, double? valueLeft ) {
    bool isArabic = textDirection == TextDirection.rtl;
    if( isArabic ) {
    return null;
    } else {
    return valueLeft;
    }
    }


 */
}