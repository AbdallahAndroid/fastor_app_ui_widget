
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDownloadWhileScrolling extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceTools.getWidth(context),
      padding: EdgeInsets.all( DimensionResource.marginLeftRightScreen),
      alignment: Alignment.center,
      child: ProgressCircleApp( color: Colors.orange, size: 40,),
    );
  }



}