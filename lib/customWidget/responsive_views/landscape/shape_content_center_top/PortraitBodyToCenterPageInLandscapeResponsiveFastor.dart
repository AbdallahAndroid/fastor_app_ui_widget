
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/responsive_views/helper/ResponsiveAppConstant.dart';
import 'package:flutter/material.dart';

class PortraitBodyToCenterPageInLandscapeResponsiveApp extends StatelessWidget {

  Widget body ;

  PortraitBodyToCenterPageInLandscapeResponsiveApp( { required this.body });

  @override
  Widget build(BuildContext context) {
    var boxTheChild =  Container(
     width: DeviceTools.isLandscape(context)?ResponsiveAppConstant.widthChangeInCaseLandscape : null ,
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