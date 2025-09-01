import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/AppDecoration.dart';
import 'package:fastor_app_ui_widget/customWidget/page/ScaffoldApp.dart';
import 'package:flutter/material.dart';


/// example
/**
    1- navigation
    NavigationTools.pushTransparentAnimateFade(context, MoneyTransferSonDialog( ));

    2- used :

    @override
    Widget build(BuildContext context) {
    return BaseDialogFullScreen(
    child: Column( children: []),
    );
    }

 */
class BaseDialogFullScreen extends StatelessWidget {
  Decoration? decoration;
  Widget child;
  Alignment? alignment;

  BaseDialogFullScreen({required this.child, this.decoration, this.alignment});

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
        shapeTransparent: true,
        shapeTransparentColor: AppColor.areaAroundDialogTransparent,
        body: Container(
            alignment: alignment ?? Alignment.center,
            width: DeviceTools.getWidth(context),
            height: DeviceTools.getHeight(context),
            padding: EdgeInsets.only(
              // top: 100.hr,
              left: 30.w ,
              right: 30.w ,
            ),
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(20.h ),
                decoration: decoration ?? AppDecoration.dialogWhite(),
                child: child,
              ),
            )));
  }
}
