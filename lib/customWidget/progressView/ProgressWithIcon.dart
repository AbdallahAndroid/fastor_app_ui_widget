import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
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
          colorBackground: ColorResource.progressContainer,
          radiusSize: 15
      ),
      padding: EdgeInsets.all( 20 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon( icon, // Icons.notification_important_outlined
            color: ColorResource.iconInsideProgressContainer,
            size: Figma.h( 100),
          ),
          SizedBox( height: DimensionResource.marginBetweenTwoSections ,),
          ProgressCircleApp(color: ColorResource.progressCircle, size: Figma.h( 40),),
        ],),
    );
  }


}