import 'package:fastor_app_ui_widget/core/boarder/BorderRadiusTools.dart';
import 'package:flutter/material.dart';




class CardViewApp {

  static Widget t({
    required Widget child,

    //to fix size set fixed size here
    required double width,
    required double height,

    //shadow
    Color? colorBoarderLine = Colors.grey,
    Color? shadowColor = Colors.grey,
    double? elevationValue = 3 ,

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
    var cropChildToRadius = _cropRounded(child: child, width: width, height: height,
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
    Widget cardRadius = _radius(child: cropChildToRadius,
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
    return _elevationTemplatFixedSize(
        child: cardRadius,
        frame_width: width,
        frame_height: height,
        elevationValue: elevationValue);
  }



  static Widget _radius({
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
    shadowColor ??= Colors.grey.withOpacity(0.3);


    //bordler line color
    colorBoarderLine ??= Colors.grey;

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





  static Widget _elevationTemplatFixedSize(
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


  static Widget _cropRounded({
    //views
    required Widget child,

    //size
    required double width,
    required double height,

    //radius
    double? radius_all  ,
    double? radius_topLeft ,
    double? radius_topRight ,
    double? radius_bottomLeft,
    double? radius_bottomRight,

    //colors
    Color? colorBoarderLine = Colors.transparent
  }){

    //set default
    radius_all ??= 0;

    //radius
    var radiusCustom = BorderRadiusTools.get(
      radius_all: radius_all,
      radius_topLeft: radius_topLeft,
      radius_topRight: radius_topRight,
      radius_bottomLeft: radius_bottomLeft,
      radius_bottomRight: radius_bottomRight,
    );

    //box
    var roundedBox = RoundedRectangleBorder( side:
    BorderSide( color: colorBoarderLine!),
        borderRadius: radiusCustom
    );


    //crop material
    var cropChildToRadius =    Material(
      clipBehavior: Clip.antiAlias,
      shape:   roundedBox,
      child: Container(
        height: width,
        width: height,
        child:  child,

      ),
    );

    return cropChildToRadius;
  }


}

