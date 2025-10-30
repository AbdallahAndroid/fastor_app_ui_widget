
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';

class IconShadowCustom extends StatelessWidget {

  String assetName;
  GestureTapCallback onTap;
  double sizeIcon;
  double containerSize;
  Color? colorIcon;
  double? radiusSize;
  Decoration? decoration;

  IconShadowCustom({
    required this.assetName,
    required this.containerSize,
    required this.sizeIcon,
    required this.onTap,
    this.radiusSize,
    this.colorIcon,
    this.decoration
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      /// shadow
      child:  Container(
        decoration: BoxDecoration(
          color: AppColors.whiteTransparent, // opaque color behind shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // black with 25% opacity
              offset: const Offset(0, 4), // vertical shift (bottom shadow)
              blurRadius: 6, // how blurry
              spreadRadius: 0, // optional
            ),
          ],
          borderRadius: BorderRadiusTools.get(radius_all: radiusSize ?? 0),
        ),

        child: ClipRRect(
          borderRadius: BorderRadiusTools.get( radius_all: radiusSize??0 ),
          child: Container(
            width: containerSize,
            height: containerSize,
            alignment: Alignment.center,
            decoration: decoration ?? BoarderHelper.cardView(
                colorBackground: AppColors.whiteTransparent,
                radiusSize: 16.r,
                colorLine: Colors.transparent
            ),
            child: Image.asset( assetName , width: sizeIcon, height:  sizeIcon, color: colorIcon,  ),
          ),
        ),
      ),
    );
  }
}