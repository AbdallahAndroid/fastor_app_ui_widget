import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:flutter/material.dart';

class IconWithBadgeCounter extends StatelessWidget   {


  double sizeIconAndPlusBadgeSize = 0;

  double sizeIcon;
  final Widget icon;
  final int counter;

  IconWithBadgeCounter({
    required this.sizeIcon,
    required this.icon,
    this.counter = 0
  }){

    sizeIconAndPlusBadgeSize = sizeIcon + Figma.h( 10);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getSizeStackIconPlusBadgeSize(),
         Positioned(child: icon, left: 0, right: 0, top: Figma.h( 5 ),),
        if (isShowBadge() ) badgePosition(),
      ],
    );
  }


  bool isShowBadge(){
    return counter > 0;
  }

  Widget getSizeStackIconPlusBadgeSize() {
    return Container(
        color: Colors.transparent,
        width: sizeIconAndPlusBadgeSize,
        height: sizeIconAndPlusBadgeSize
    );
  }


  badgePosition() {
    return  PositionedApp.langApp(
      right: 0,
      top: 0,
      child: counterCircleShape(),
    );
  }


  counterCircleShape() {
    return Container(
      // width: Figma.h( 16 ),
      // height: Figma.h(16),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular( 6 ),
      ),
      constraints: BoxConstraints(
        minWidth: Figma.h( 16 ),
        minHeight: Figma.h( 16 ),
      ),
      child: Text(
        '$counter',
        style: TextStyle(
          color: Colors.white,
          fontSize: Figma.h( 8 ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

}
