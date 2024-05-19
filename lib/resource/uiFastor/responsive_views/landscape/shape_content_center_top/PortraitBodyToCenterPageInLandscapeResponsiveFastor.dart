
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/responsive_views/helper/ResponsiveFastorConstant.dart';
import 'package:flutter/material.dart';

class PortraitBodyToCenterPageInLandscapeResponsiveFastor extends StatelessWidget {

  Widget body ;

  PortraitBodyToCenterPageInLandscapeResponsiveFastor( { required this.body });

  @override
  Widget build(BuildContext context) {
    var boxTheChild =  Container(
     width: DeviceTools.isLandscape(context)?ResponsiveFastorConstant.widthChangeInCaseLandscape : null ,
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