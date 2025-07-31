import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/size/StatusBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/core/resource/AppDecoration.dart';
import 'package:flutter/material.dart';

class AppBarWithCardContainerScreen extends StatelessWidget {
  Widget appBarCustom;
  double appBarHeight;
  Widget body;

  AppBarWithCardContainerScreen({ required this.body, required this.appBarCustom, required this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.linearGradientBackgroundFullScreenCausingTopAppbarDark(),
      child: Stack(
        children: [
          SizedBox( width: DeviceTools.getWidth(context), height:  DeviceTools.getHeight(context),),
          appBarCustom,
          Container(
            decoration: AppDecoration.cardBodyScreen(),
            margin: EdgeInsets.only(top: appBarHeight + StatusBarSizeHelper.getHeight(context)),
            child: body ,
          )
        ],
      ) ,
    );
  }

}

