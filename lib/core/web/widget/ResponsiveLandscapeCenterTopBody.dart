

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/web/ResponsiveConstant.dart';
import 'package:flutter/material.dart';

class ResponsiveLandscapeCenterTopBody extends StatelessWidget {

  static double widthWeb = ResponsiveConstant.widthChangeInCaseLandscape;

  Widget body ;

  ResponsiveLandscapeCenterTopBody( { required this.body });

  @override
  Widget build(BuildContext context) {
    var boxTheChild =  Container(
     width: DeviceTools.isLandscape(context)?ResponsiveConstant.widthChangeInCaseLandscape : null ,
      child: body,
      alignment: DeviceTools.isLandscape(context)?Alignment.center : null,
    );

    return Container(
      width: DeviceTools.getWidth(context),
      alignment: Alignment.center,
      child: boxTheChild,
    );
  }
}