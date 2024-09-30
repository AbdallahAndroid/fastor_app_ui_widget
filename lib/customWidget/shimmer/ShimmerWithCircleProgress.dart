
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerWithCircleProgress extends StatelessWidget {

  double width;
  double height;
  double radiusCard;


  ShimmerWithCircleProgress({
    required this.width,
    required this.height,
    required this.radiusCard
});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: true,
      duration: Duration(seconds: 1),
      child: Container(
        // margin: EdgeInsets.all(  10 ),
        decoration: BoarderHelper.cardView(
            radiusSize: radiusCard,
            colorBackground: Colors.grey.withOpacity( 0.5)
        ),
        width: width,
        height:  height,
        alignment: Alignment.center,
        child: ProgressCircleApp( color:Colors.orange , size: 40 ,),
      ),
    );
  }
}