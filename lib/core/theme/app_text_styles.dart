import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {


  static TextStyle fontGrey = TextStyle(
    fontSize: 18.sp,
    color: AppColors.grey,
    fontWeight: FontWeight.normal,
  );

  //----------------------------------------------------------------  default

  static TextStyle getTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
  }) {
    return TextStyle(
        color: color ?? AppColors.white,
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height ?? 1);
  }



  //----------------------------------------------------------------   regular

  static TextStyle font12OpacityWhite400 = getTextStyle(
    fontSize: 12.sp,
    color: AppColors.whiteTransparent,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font10OpacityWhite500 = getTextStyle(
    fontSize: 10.sp,
    color: AppColors.whiteTransparent,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font12OpacityWhite500 = getTextStyle(
    fontSize: 12.sp,
    color: AppColors.whiteTransparent,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font22White400 =
  getTextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400);

  static TextStyle font50White400 =
  getTextStyle(fontSize: 50.sp, fontWeight: FontWeight.w400);

  static TextStyle font50White500 =
  getTextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500);

  static TextStyle font60White400 =
  getTextStyle(fontSize: 60.sp, fontWeight: FontWeight.w400);

  //----------------------------------------------------------------   medium

  static TextStyle mediumFont8White = getTextStyle(
    fontSize: 8.sp,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font12WhiteMedium = getTextStyle(
      fontSize: 12.0.sp, color: AppColors.white, fontWeight: FontWeight.w500);
  static TextStyle font12BlackMedium = getTextStyle(
      fontSize: 12.0.sp, color: AppColors.black, fontWeight: FontWeight.w500);
  static TextStyle font12GreyMedium = getTextStyle(
      fontSize: 12.0.sp,
      color: AppColors.grey,
      fontWeight: FontWeight.w500);

  static TextStyle font12PrimaryMedium = getTextStyle(
      fontSize: 12.0.sp, color: AppColors.primary, fontWeight: FontWeight.w500);

  static TextStyle font12PrimaryBold = getTextStyle(
      fontSize: 12.0.sp, color: AppColors.primary, fontWeight: FontWeight.w900);

  static TextStyle font13PrimaryBold = getTextStyle(
      fontSize: 13.sp, color: AppColors.primary, fontWeight: FontWeight.w900);

  static TextStyle font12WhiteBold = getTextStyle(
      fontSize: 12.0.sp, color: AppColors.white, fontWeight: FontWeight.w900);

  static TextStyle font14BlackBold = getTextStyle(
      fontSize: 14.0.sp, color: AppColors.black, fontWeight: FontWeight.w700);

  static TextStyle font18PrimaryMedium = getTextStyle(
      fontSize: 18.0.sp, color: AppColors.primary, fontWeight: FontWeight.w500);

  static TextStyle font18Black500 = getTextStyle(
      fontSize: 18.0.sp, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle font20PrimaryMedium = getTextStyle(
      fontSize: 20.sp, color: AppColors.primary, fontWeight: FontWeight.w500);

  static TextStyle font20Black500 = getTextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle font20Black900 = getTextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w900, color: Colors.black);

  static TextStyle mediumFont12blackResponsive = getTextStyle(
      fontSize: 12.0.sp, color: AppColors.black, fontWeight: FontWeight.w500);

  static TextStyle mediumFont12black = getTextStyle(
      fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w500);

  static TextStyle mediumFont14Black = getTextStyle(
      fontSize: 14.sp, color: AppColors.black, fontWeight: FontWeight.w500);

  static TextStyle font22White500 =
  getTextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500);

  static TextStyle font22Black500 = getTextStyle(
      fontSize: 22.sp, fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle font22Primary500 = getTextStyle(
      fontSize: 22.sp, fontWeight: FontWeight.w500, color: AppColors.primary);

  static TextStyle font22Primary900 = getTextStyle(
      fontSize: 22.sp, fontWeight: FontWeight.w900, color: AppColors.primary);

  static TextStyle font22white900 = getTextStyle(
      fontSize: 22.sp, fontWeight: FontWeight.w900, color: AppColors.white);

  static TextStyle font14White500 =
  getTextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle font10Grey500 = getTextStyle(
      fontSize: 10.0.sp, fontWeight: FontWeight.w500, color: Color(0xFF949494));

  static TextStyle font10Black500 = getTextStyle(
      fontSize: 10.0.sp, fontWeight: FontWeight.w500, color: AppColors.black);

  static TextStyle font10Primary500 = getTextStyle(
      fontSize: 10.0.sp, fontWeight: FontWeight.w500, color: AppColors.primary);

  static TextStyle font10White500 = getTextStyle(
      fontSize: 10.0.sp, fontWeight: FontWeight.w500, color: AppColors.white);

  static TextStyle font14Black500 = getTextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.black);

  static TextStyle font14Primary500 = getTextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.primary);

  static TextStyle font14White500Height =
  getTextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle font15Grey500 = getTextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w500, color: Color(0xFF949494));
  static TextStyle font17Primary500 = getTextStyle(
      fontSize: 17.sp, fontWeight: FontWeight.w500, color: AppColors.primary);

  static TextStyle font16GreyMedium500 = getTextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.greenMedium);

  static TextStyle font18lack500 = getTextStyle(
      fontSize: 18.0.sp, fontWeight: FontWeight.w500, color: AppColors.black);

  static TextStyle font18GreyLight500 = getTextStyle(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textGrey);

  static TextStyle font18Grey500 = getTextStyle(
      fontSize: 18.0.sp, fontWeight: FontWeight.w500, color: AppColors.grey);

  static TextStyle font18white500 = getTextStyle(
      fontSize: 18.0.sp, fontWeight: FontWeight.w500, color: AppColors.white);

  static TextStyle font18white900 = getTextStyle(
      fontSize: 18.0.sp, fontWeight: FontWeight.w900, color: AppColors.white);

  static TextStyle font16Red500 = getTextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFFCF0000),
  );

  static TextStyle font8Red500 = getTextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
  );
  static TextStyle font16primary500 = getTextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle font16blackMedium = getTextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle font16White500Height = getTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle font16White500 = getTextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle font16Black500 = getTextStyle(
    fontSize: 16.0.sp,
    // 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle font16Grey500 = getTextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.boarderLineCardItem,
  );

  static TextStyle font14Grey500 = getTextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Color(0xFF949494),
  );
  static TextStyle font25Black500 = getTextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle font25white500 = getTextStyle(
      fontSize: 25.sp, fontWeight: FontWeight.w500, color: AppColors.white);

  static TextStyle font30white500 = getTextStyle(
      fontSize: 30.sp, fontWeight: FontWeight.w500, color: AppColors.white);

  static var font15Black500 = getTextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColors.black);

  static var font14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle font20Green = TextStyle(
    fontSize: 18.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.normal,
  );

  static var font10Error500 = getTextStyle(
      fontSize: 10.0.sp, fontWeight: FontWeight.w500, color: AppColors.red);

}
