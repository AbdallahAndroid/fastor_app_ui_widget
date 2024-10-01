import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:flutter/material.dart';


class IconCustomWidget extends StatelessWidget {
  
  String assetName;
  GestureTapCallback onTap;

  IconCustomWidget({
    required this.assetName,
    required this.onTap
});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: contentIcon(),
    );
  }
  
  Widget contentIcon(){
    return Container(
      width: Figma.h(28),
      height: Figma.h(28),
      child: Image.asset( assetName, width: Figma.h(16), height: Figma.h(16),),
      alignment: Alignment.center,
      decoration: BoarderHelper.cardView(
          colorBackground: Colors.grey.withOpacity(0.5),
          colorLine: Colors.transparent,
          radiusSize: 5
      ),
    );
  }
}