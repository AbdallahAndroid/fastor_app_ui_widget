
import 'package:flutter/material.dart';

@Deprecated( "use class (PositionedFastor) instead ")
class PositionApp  {


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

}