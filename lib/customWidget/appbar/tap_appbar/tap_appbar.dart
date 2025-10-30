import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class TapAppbar extends StatelessWidget {

  String? title;
  String assetName;
  VoidCallback onTap;
  double frameWidth;
  double frameHeight;
  double? iconWidth;
  double? iconHeight;
  Color? colorIcon;

  TapAppbar({
      this.title,
    required this.assetName,
    required this.frameWidth,
    required this.frameHeight,
    required this.onTap,
    this. iconWidth,
    this.iconHeight,
    this.colorIcon,
  }) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: AppDecoration.tapAppBarPrimaryDark( frameHeight / 2 ),
        width: frameWidth,
        height: frameHeight,
        alignment: Alignment.center,
        // padding: title != null ? EdgeInsets.symmetric(horizontal: 7.5.h  , vertical: 8.h ) : EdgeInsets.all( 10.h ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetName,
              width:  iconWidth??17.25.wTabletLandscapeExact,
              height: iconHeight??17.25.wTabletLandscapeExact,
              color: colorIcon,
            ),

            if(title != null )SizedBox( width: 3.45.w ),
            if(title != null )TextApp(
              title ?? '',
              // style: TextStyle(fontSize: 13.8.h , color: AppColor.white  ),
              fontFamily: FontProject.w500,
              fontSize: 13.8.h ,
              color: AppColors.white ,
              textAlign: TextAlign.center,
            ),
            if(title != null ) SizedBox(width: 2.w ),
          ],
        ),
      ),
    );
  }
}