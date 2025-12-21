
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/dashed_boarder/container_boarder_dashed.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImagePlaceHolder.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextError.dart';
import 'package:flutter/material.dart';


class PreviewSelectedAttachment extends StatelessWidget {
  final String title; // center title (english text; direction handled by LangApp)
  final VoidCallback onChangeCallback; // tap on chip
  final String? errorMessage; // optional error shown below

  double radiusCard = AppDimension.placeholderFileRadiusCard;
  double width;
  double height;


  PreviewSelectedAttachment({
    Key? key,
    required this.title,
    required this.width,
    required this.height,
    required this.onChangeCallback,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LangApp.getTextDirection(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardContentUI(context),

          if ((errorMessage ?? '').isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: TextError(errorMessage!),
            ),
        ],
      ),
    );
  }

  cardContentUI(BuildContext context) {
    return GestureDetector(
      onTap: onChangeCallback,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 12.5 .w),
        decoration: AppDecoration.cardItemFileSelected(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

            /// file icon
            Container(
              width: 24.w,
              height: 24.w,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icons/file_selected.png',
                width: 24.w,
                height: 24.w,
              ),
            ),

            //   title
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w ),
              alignment: Alignment.center,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14.sp ,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),


            /// trash
            Spacer( ),
            Container(
              child: Image.asset(
                'assets/icons/file_trash.png',
                width: 24.w,
                height: 24.w,
                // color: AppColor.textGrey,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
