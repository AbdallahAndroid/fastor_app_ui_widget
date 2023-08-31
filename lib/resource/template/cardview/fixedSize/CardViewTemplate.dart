import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/resources/boarder/BaseBoarderHelper.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/template/crop/CropTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/elevation/ElevationTemplate.dart';


import 'BaseCardViewTemplate.dart';

class CardViewTemplate {

  static Widget t({
    required Widget child,

    //to fix size set fixed size here
    required double width,
    required double height,

    //shadow
    Color? colorBoarderLine = Colors.transparent,
    Color? shadowColor,
    double? elevationValue,

    //space
    EdgeInsets? margin,
    EdgeInsets? padding,

    //radius
    double? radius_all = 0 ,
    double? radius_topLeft ,
    double? radius_topRight ,
    double? radius_bottomLeft,
    double? radius_bottomRight,
}){

    //crop child to same radius
    /**
     * why make crop?
     *   - because if the child contain any thing take all screens width and height will
     *    cause it will hide the corner of cardview.
     *   pages when child have "image" in background of view, cause the corner will hidden
     *    behind the image of background
     */
    var cropChildToRadius = CropTemplate.rounded(child: child, width: width, height: height,
    colorBoarderLine: colorBoarderLine,
      radius_all: radius_all,
      radius_topLeft: radius_topLeft,
      radius_topRight: radius_topRight,
      radius_bottomLeft: radius_bottomLeft,
      radius_bottomRight: radius_bottomRight,
    );

    //set elevation default size
    /**
     * whey elveation is Third of size of radius by divided by 3?
     *   - because the shadow is croped at cardview
     */
    elevationValue ??=  radius_all!/3;

    //card with radius
    Widget cardRadius = BaseCardViewTemplate.radius(child: cropChildToRadius,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        colorBoarderLine: colorBoarderLine,
        shadowColor: shadowColor,
        radius_all: radius_all,
        radius_topLeft: radius_topLeft,
        radius_topRight: radius_topRight,
        radius_bottomLeft: radius_bottomLeft,
        radius_bottomRight: radius_bottomRight,
        elevationValue: elevationValue);


    //fix elevation safe shadow space
    return ElevationTemplate.fixedSize(
        child: cardRadius,
        frame_width: width,
        frame_height: height,
        elevationValue: elevationValue);
  }


}

