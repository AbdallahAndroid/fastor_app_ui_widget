import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';



class BorderRadiusTools {


  static BorderRadius top({
    //radius
    required double  radius
  }) {

    return getByLang(
        radius_topLeft: radius,
        radius_topRight: radius
    );
  }


  static BorderRadius bottom({
    //radius
    required double  radius
  }) {

    return getByLang(
        radius_bottomRight: radius,
        radius_bottomLeft: radius
    );
  }


  static BorderRadius topRight({
    //radius
    required double  radius
  }) {
    return getByLang(
      radius_topRight: radius,
    );
  }


  static BorderRadius getByLang({
    //radius
    double? radius_all = 0,
    double? radius_topLeft = 0,
    double? radius_topRight = 0,
    double? radius_bottomLeft = 0,
    double? radius_bottomRight = 0,
  }) {


    //set default radius
    radius_all ??= 0;
    radius_topLeft ??= 0;
    radius_topRight ??= 0;
    radius_bottomLeft ??= 0;
    radius_bottomRight ??= 0;

    /** ------- set default designSystem
     *
        radius_topLeft ??= DesignSystemDimen.ds_size_corner_level_2;
        radius_topRight ??= DesignSystemDimen.ds_size_corner_level_2;
        radius_bottomLeft ??= DesignSystemDimen.ds_size_corner_level_2;
        radius_bottomRight ??= DesignSystemDimen.ds_size_corner_level_2;

     */

//set all if found
    if (radius_all != 0) {
      radius_topLeft = radius_all;
      radius_topRight = radius_all;
      radius_bottomLeft = radius_all;
      radius_bottomRight = radius_all;
    }

    if( LangApp.isArabic ) {
      return   BorderRadius.only(
        topLeft: Radius.circular(radius_topRight ),
        topRight: Radius.circular(radius_topLeft ),
        bottomLeft: Radius.circular(radius_bottomRight ),
        bottomRight: Radius.circular(radius_bottomLeft ),
      );
    } else {
      return   BorderRadius.only(
        topLeft: Radius.circular(radius_topLeft ),
        topRight: Radius.circular(radius_topRight ),
        bottomLeft: Radius.circular(radius_bottomLeft ),
        bottomRight: Radius.circular(radius_bottomRight ),
      );
    }
  }


  static left(double radius) {
    return getByLang(
        radius_topLeft: radius,
        radius_bottomLeft: radius
    );
  }


}
