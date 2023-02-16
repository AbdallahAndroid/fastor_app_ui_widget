import 'package:flutter/material.dart';


class EdgeInsetsTools {

  //-----------------------------------------------------------------------

  /**
   * exmaple: image with 100, while padding left and right = 10.
   * cause image actual width is 100 -10-10= 80
   */
  static double getNetSizeAfterPadding(double frame, EdgeInsets padding ) {

    double wPadding = - padding.left - padding.right   + frame ;
    // Log.i(   "getNetSizeAfterPadding() - wPadding: "
    //     + wPadding.toString()  + " /frame: " + frame.toString() +
    //     " /padding.left: " + padding.left.toString()  );
    return wPadding;
  }

  //----------------------------------------------------------------------- padding default space

  /**
      //fix default is 6 top and bottom
      [log]  fix margin - before - top: 50.0 /bottom: 0.0
      [log]  fix margin - after - top: 44.0 /bottom: 0.0
   */
  static EdgeInsets fixDefaultSpace(EdgeInsets? needed, double defaultValue) {
    EdgeInsets result = EdgeInsets.zero;

    if (needed == null) {
      return result;
    }

    //fix default is 6 top
    var topNeeded = needed.top;
    double topResult = 0;
    if (topNeeded <= defaultValue) {
      topResult = topNeeded;
    } else {
      topResult = -defaultValue + topNeeded;
    }

    //fix default is 6 bottom
    double bottomResult = 0;
    var bottomNeeded = needed.bottom;
    if (bottomNeeded <= defaultValue) {
      bottomResult = bottomNeeded;
    } else {
      bottomResult = -defaultValue + bottomNeeded;
    }

    result = EdgeInsets.only(
        top: topResult,
        bottom: bottomResult,
        left: needed.left,
        right: needed.right);
   // Log.i( "fixDefaultSpace - before - top: " + needed.top.toString() + " /bottom: " + needed.bottom.toString() );
  //  Log.i( "fixDefaultSpace - after - top: " + result.top.toString() + " /bottom: " + result.bottom.toString() );
    return result;
  }






}