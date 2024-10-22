import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';

import 'package:fastor_app_ui_widget/customWidget/animate/RotationHorizontalChangeIconEveryOneSecond.dart';
import 'package:fastor_app_ui_widget/customWidget/animate/RotationHorizontalChangeIconWhenRotateComplete.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:flutter/material.dart';

class ProgressAnimation extends StatelessWidget {

  IconData icon1;
  IconData icon2;

  ProgressAnimation( {
    required this.icon1,
    required this.icon2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Figma.w( 150 ),
      height: Figma.w( 150 ),
      decoration: BoarderHelper.cardView(
          colorBackground: ColorResource.progressContainer,
          radiusSize: 15
      ),
      alignment: Alignment.center,
      child:  RotationHorizontalChangeIconWhenRotateComplete(
        icon1: icon1,
        icon2: icon2,
        secondToFinish: 5,
        counterRotation: 7,
      ),
    );
  }


}