import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';

import 'package:fastor_app_ui_widget/customWidget/animate/RotationHorizontalChangeIconEveryOneSecond.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:flutter/material.dart';

class ProgressWithIcon extends StatelessWidget {

  IconData icon;

  ProgressWithIcon( {
    required this.icon
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Figma.w( 150 ),
      decoration: BoarderHelper.cardView(
          colorBackground: AppColor.progressContainer,
          radiusSize: 15
      ),
      padding: EdgeInsets.all( 20 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon( icon, // Icons.notification_important_outlined
            color: AppColor.iconInsideProgressContainer,
            size: Figma.h( 100),
          ),
          SizedBox( height: AppDimension.marginBetweenTwoSections ,),
          ProgressCircleApp(color: AppColor.progressCircle, size: Figma.h( 40),),
        ],),
    );
  }


}