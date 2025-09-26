
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/card/glass/effect_glass_background_card.dart';
import 'package:flutter/material.dart';

class IconEffectShadowAndGlassWidget extends StatelessWidget {


  String assetName;
  GestureTapCallback onTap;
  double sizeIcon;
  double containerSize;
  Color colorBackground;
  Color? colorIcon;
  double  radiusSize;
  Decoration? decoration;
  double? percentageBlur;

  IconEffectShadowAndGlassWidget({
    required this.assetName,
    required this.containerSize,
    required this.sizeIcon,
    required this.onTap,
    required this.radiusSize,
    required this.colorBackground,
    this.colorIcon,
    this.percentageBlur = 1,
    this.decoration
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      /// shadow
      child:  Container(
        decoration: BoxDecoration(
          color: AppColor.whiteTransparent, // opaque color behind shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // black with 25% opacity
              offset:  Offset(0, 4), // vertical shift (bottom shadow)
              blurRadius: 6, // how blurry
              spreadRadius: 0, // optional
            ),
          ],
          borderRadius: BorderRadiusTools.get(radius_all: radiusSize ?? 0),
        ),

        /// glass
        child:   EffectGlassBackgroundCard(
            width:  containerSize ,
            height: containerSize,
            radiusBorder: BorderRadiusTools.get( radius_all: radiusSize??0 ),
            colorBackground: colorBackground,
            percentageBlur: percentageBlur,
            child: contentIcon(),
          ),
      ),
    );
  }

  contentIcon() {
    return Container(
      width: containerSize,
      height: containerSize,
      alignment: Alignment.center,
      // decoration: decoration ?? BoarderHelper.cardView(
      //     colorBackground: colorBackground, // AppColor.whiteTransparent,
      //     radiusSize: 16.r,
      //     colorLine: Colors.transparent
      // ),
      child: Image.asset( assetName , width: sizeIcon, height:  sizeIcon, color: colorIcon,  ),
    );
  }

}