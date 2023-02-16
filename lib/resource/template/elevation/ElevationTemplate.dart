
import 'package:flutter/material.dart';

import 'ShadowContainer.dart';

class ElevationTemplate {




  static Widget fixedSize(
      {required Widget child,
      required double frame_width,
      required double frame_height,
      required double elevationValue}) {
    double elevationSafeShadowSideSmall = (elevationValue) / 1.5;
    double elevationSafeShadowSideBottom = (elevationValue) / 0.75;
    var safeShadowEdge = EdgeInsets.only(
        left: elevationSafeShadowSideSmall,
        right: elevationSafeShadowSideSmall,
        top: elevationSafeShadowSideSmall,
        bottom: elevationSafeShadowSideBottom);

    //bound of card
    double cardWidthSafeShadow = frame_width -
        (elevationSafeShadowSideSmall + elevationSafeShadowSideSmall);
    double cardHeightSafeShadow = frame_height -
        (elevationSafeShadowSideBottom + elevationSafeShadowSideSmall);

    return Container(
      width: cardWidthSafeShadow,
      height: cardHeightSafeShadow,
      alignment: Alignment.center,
      //Alignment.topCenter ,
      child: child,
      padding: safeShadowEdge,
    );
  }
}
