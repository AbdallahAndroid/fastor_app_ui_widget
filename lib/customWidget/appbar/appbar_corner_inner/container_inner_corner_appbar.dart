import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/appbar_corner_inner/appbar_corner_bottom_inner_utils.dart';
import 'package:flutter/material.dart';

/// shape corner appbar by corner inside
class ContainerInnerCornerAppbar extends StatelessWidget {

  Widget body;
  Widget appBarCustomWidget;
  double heightAppbar;


  ContainerInnerCornerAppbar( {
    required this.appBarCustomWidget,
    required this.heightAppbar,
    required this.body,
  } );

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: AppbarCornerBottomInnerUtils.appBarPrimaryLnearGradientNoRadius(),
        color: AppColor.appBarBackground,
        child: Stack(
          children: [
            Container(
              width: DeviceTools.getWidth(context),
              height: DeviceTools.getHeight(context),
              color: AppColor.appBarBackground,
            ),
            Container(
              margin: EdgeInsets.only(top: heightAppbar),
              child: cropBodyInsideRadius(context),
            ),
            appBarCustomWidget

          ],
        )
    );
  }

  cropBodyInsideRadius(BuildContext context ) {
    return ClipRRect(
      borderRadius:   BorderRadius.only(
        topLeft: Radius.circular(32.r ),
        topRight: Radius.circular(32.r ),
      ),
      child: Container(
        color:  AppColor.backgroundAllScreens,
        // decoration: AppbarCornerBottomInnerUtils.childBodyDecoration(),
        constraints: BoxConstraints(
          minHeight: DeviceTools.getHeight(context) - heightAppbar,
          minWidth: DeviceTools.getWidth(context),
        ),
        child: body,
      ),
    );
  }

}