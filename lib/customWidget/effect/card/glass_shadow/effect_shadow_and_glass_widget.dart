
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/card/glass/effect_glass_background_card.dart';
import 'package:flutter/material.dart';

class EffectShadowAndGlassWidget extends StatelessWidget {

  double width;
  double height;
  Widget child;
  Color colorBackground;
  Color colorShadow;
  BorderRadius  radiusBorder;
  EdgeInsets? margin;
  double? percentageBlur;


  EffectShadowAndGlassWidget( {
    required this.width,
    required this.height,
    required this.child,
    required this.colorBackground,
    required this.colorShadow,
    required this.radiusBorder,
    this.percentageBlur = 1,
    this.margin,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoarderHelper.shadow(
          colorBackground: colorBackground,
          colorShadow: colorShadow,
          radiusBorder: radiusBorder
      ),
      child:  Container(
        alignment: Alignment.center,
        width:  width ,
        height: height,
        decoration: BoarderHelper.cardView(
          radiusBorder: radiusBorder,
          colorBackground: colorBackground,
        ),
        child: EffectGlassBackgroundCard(
          width:  width ,
          height: height,
          radiusBorder: radiusBorder,
          colorBackground: colorBackground,
          percentageBlur: percentageBlur,
          child: child,
        ),
      ),
    );
  }
}