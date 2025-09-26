import 'dart:ui';


import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:flutter/material.dart';

class EffectGlassBackgroundCard extends StatelessWidget {


  Widget child;
  double width;
  double height;
  double? percentageBlur;
  BorderRadius radiusBorder;
  Color? colorBackground;
  Color? colorLine ;

  EffectGlassBackgroundCard({
    required this.child,
    required this.width,
    required  this.height ,
    required this.radiusBorder,
    this.percentageBlur = 100,
    this.colorBackground  ,
    this.colorLine  ,
  });


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radiusBorder,
      child: Container(
          width: width,
          height: height,
          // color: Colors.yellow,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10 * (percentageBlur!/100), sigmaY: 10 * (percentageBlur!/100)), // blur background
              child: Container(
                child: child ,
                width: width,
                height: height,
                decoration: BoarderHelper.cardView(
                    colorBackground: colorBackground??AppColor.backgroundCardDialogTransparent ,
                    radiusBorder: radiusBorder,
                    colorLine:  colorLine??AppColor.dialogDismisableBackground
                ),
              ) // ,
          )
      ),
    );
  }

}