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
      decoration: AppbarCornerBottomInnerUtils.appBarPrimaryLinearGradientNoRadius(),
      child: Stack(
        children: [
          SizedBox( width: DeviceTools.getWidth(context), height: DeviceTools.getHeight(context),),
          appBarCustomWidget,
          containerBody(context)

        ],
      )
    );
  }

  containerBody(BuildContext context ) {
    return Container(
      decoration: AppbarCornerBottomInnerUtils.childBodyDecoration(),
      margin: EdgeInsets.only(top: AppbarCornerBottomInnerUtils.getAppBarHeight(context)),
      child: body,
    );
  }

}