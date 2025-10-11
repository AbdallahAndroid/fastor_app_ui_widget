import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog/shared/title_dialog.dart';
import 'package:flutter/material.dart';

class TitleAndBackDialog extends StatelessWidget {

  String title;
  double width;
  double? iconSize;

  TitleAndBackDialog({
    required this.title,
    required this.width ,
    this.iconSize
  }) {
    this.iconSize = 38.h;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,// DeviceTools.getWidth(context),
          height: iconSize ,
        ),
        Container(
          width: width,
          constraints: BoxConstraints( minHeight: iconSize??0 ),
          alignment: Alignment.center ,
          child: TitleDialog( this.title ),
        ),

        PositionedApp.langApp(
            left: 0,
            child: iconBackButtonCircle(context )
        )
      ],
    );
  }

  iconBackButtonCircle(BuildContext context ){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Image.asset( "assets/icons/back_circle.png",
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}