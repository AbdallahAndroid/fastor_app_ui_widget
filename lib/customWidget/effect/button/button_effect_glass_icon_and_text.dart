
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/button/icon/ButtonIconAndText.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/card/glass/effect_glass_background_card.dart';
import 'package:flutter/material.dart';

class ButtonEffectGlassIconAndText extends StatelessWidget {


  double width;
  double height;

  String text;
  Widget image;
  GestureTapCallback onTap;

  ButtonEffectGlassIconAndText({
    required this.width,
    required this.height,
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  EffectGlassBackgroundCard(
        width:  width  ,
        height:  height ,
        radiusBorder: BorderRadiusTools.get( radius_all: 16.r )
        , child: ButtonIconAndText(
            colorBackground: Colors.transparent,
            width: DeviceTools.getWidth(context) ,
            text: text ,
            image: image ,
            onTap:  onTap
    )
    );
  }
}