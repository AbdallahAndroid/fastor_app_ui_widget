import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/resources/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';



class BaseCardViewTemplate {

  static Widget radius({
    required Widget child,

    //to fix size set fixed size here
    required double? width,
    required double? height,

    //shadow
    Color? colorBoarderLine = Colors.transparent,
    Color? shadowColor,
    double? elevationValue,

    //space
    EdgeInsets? margin,
    EdgeInsets? padding,

    //radius
    double? radius_all ,
    double? radius_topLeft ,
    double? radius_topRight ,
    double? radius_bottomLeft,
    double? radius_bottomRight,
}){

    //shadow color
    shadowColor ??= DSColor.cardview_shadow;


    //bordler line color
    colorBoarderLine ??= DSColor.cardview_boarderLine;

    //get smallest/largest radius
    /**
     *     List<double > array = [radius_all, radius_topLeft, radius_topRight, radius_bottomLeft, radius_bottomRight];
        final smallestRadius = ToolsNumber.getSmallestNumber(array);
        final largestRadius = ToolsNumber.getLargestNumber(array);
     */

    //radius
    var radiusCustom = BorderRadiusTools.get(
      radius_all: radius_all,
      radius_topLeft: radius_topLeft,
      radius_topRight: radius_topRight,
      radius_bottomLeft: radius_bottomLeft,
      radius_bottomRight: radius_bottomRight,
    );

    //card
    var card =  Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorBoarderLine, width: 1),
        borderRadius: radiusCustom,
      ),
      child:  child,
      shadowColor:  shadowColor,
      elevation : elevationValue,
      borderOnForeground: true,
      // margin: margin,
    );

    //space
    var container = Container( child:  card , margin: margin, padding:  padding );

    //fix when take frame is fixed size make crash in view
    var sizeCard = SizedBox( width: width , height: height, child : container );
    return sizeCard ;
  }


}