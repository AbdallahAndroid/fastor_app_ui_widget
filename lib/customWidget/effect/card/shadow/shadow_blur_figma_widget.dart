
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:flutter/material.dart';

class ShadowBlurFigmaWidget extends StatelessWidget {

  double minWidth;
  double height;
  Widget child;
  Color colorBackground;
  Color colorShadow;
  BorderRadius  radiusBorder;
  EdgeInsets? margin;


  ShadowBlurFigmaWidget( {
    required this.minWidth,
    required this.height,
    required this.child,
    required this.colorBackground,
    required this.colorShadow,
    required this.radiusBorder,
    this.margin,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // EdgeInsets.symmetric( horizontal: 16.w ),
      decoration: BoarderHelper.shadow(
          colorBackground: colorBackground,
          colorShadow: colorShadow,
          radiusBorder: radiusBorder, //BorderRadiusTools.get( radius_all: 130.r )
      ),
      child:  Container(
        alignment: Alignment.center,
        // width:  minWidth,
        constraints: BoxConstraints( minWidth: minWidth ),
        height: height,
        decoration: BoarderHelper.cardView(
          radiusBorder: radiusBorder,
          colorBackground: colorBackground,
        ),
        child: child,
      ),
    );
  }
}