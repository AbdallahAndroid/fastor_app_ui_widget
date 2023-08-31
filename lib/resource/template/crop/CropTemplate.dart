
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/resource/resources/boarder/BorderRadiusTools.dart';

class CropTemplate {


  static Widget rounded({
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