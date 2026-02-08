
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class ButtonIconAndText extends StatelessWidget {

  Widget? image;
  Icon? icon;
  double? radiusSize;
  double? padding;
  Widget? textWidget;
  String text;
  Color? colorBackground;
  GestureTapCallback? onTap;
  double width;

  ButtonIconAndText({
    this.icon,
    this.image,
    this.radiusSize,
    this.padding,
    this.colorBackground,
    required this.text,
    required this.width,
      this.textWidget,
    required  this.onTap
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        height: 56.h ,
        alignment: Alignment.center ,
        // padding: EdgeInsets.all( padding??10),
        decoration: BoarderHelper.cardView(
          radiusSize: radiusSize??15,
          colorLine: colorBackground??AppColors.white,
          colorBackground: colorBackground??AppColors.backgroundLight
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

            chooseIconOrAssets(),
            SizedBox( width: 5.w,),
            choosTextWidget(),

        ],),
      ),
      onTap: onTap,
    );
  }

  Widget chooseIconOrAssets(){
    if( icon != null ) return icon!;
    if( image != null ) return image!;
    return Container(
    );
  }

  Widget choosTextWidget() {
    if( textWidget != null )return textWidget!;

    return TextApp( text ,
      fontFamily: FontProject.w600,
      fontSize: 16.sp ,
      color: AppColors.textColor,
    );
  }

}