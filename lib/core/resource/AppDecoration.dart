import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';

abstract class AppDecoration {

  //
  // ///------------------------------------------------------------- dialog
  ///
  static dialogWhite() {
    return BoarderHelper.cardView(
        radiusSize: 30.h,
        colorLine: AppColor.greenLight,
        colorBackground: AppColor.white);
  }


  ///------------------------------------------------------------- appbar

  static linearGradientBackgroundFullScreenCausingTopAppbarDark() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColor.primaryDark,
          AppColor.primaryLight,
          AppColor.primaryLight,
          AppColor.primaryLight,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  static cardBodyScreen() {
    return BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        border: Border.all(color: AppColor.white));
  }


  ///----------------------------------------------------------------- appbar

  static tapAppBarPrimaryDark(double radiusSize) {
    return BoarderHelper.cardView(
      radiusSize: radiusSize,
      colorLine: AppColor.primaryDark,
      colorBackground: AppColor.primaryDark,
    );
  }

  ///----------------------------------------------------------------- navigation bottom


  static navigationBottom() {
    return BoarderHelper.cardView(
        colorLine: AppColor.white,
        colorBackground: AppColor.white,
        radiusBorder: BorderRadiusTools.top(radius: 16.r )
    );
  }

  ///----------------------------------------------------------------- card item

  static cardItem() {
    return BoarderHelper.cardView(
        radiusSize: 16.r,
        colorLine: AppColor.boarderLineCardItem,
        colorBackground: AppColor.white
    );
  }

  static cardItemSection() {
    return BoarderHelper.cardView(
        radiusSize: AppDimension.radiusSection,
        colorLine: AppColor.boarderLineCardItem,
        colorBackground: AppColor.white
    );
  }

  static cardSmallPrimary() {
    return BoarderHelper.cardView(
        radiusSize: AppDimension.radiusSmallCard,
        colorLine: AppColor.primary,
        colorBackground: AppColor.primary
    );
  }

  ///----------------------------------------------------------------- gradient

  static gradientCardItemAtBottomOfCard() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColor.black.withOpacity(0.00),
          AppColor.black.withOpacity(0.00),
          AppColor.black.withOpacity(0.0),
          AppColor.black.withOpacity(0.5),
          AppColor.black,
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      border: Border.all(
        color: AppColor.boarderLineCardItem,
        width: 1,
      ),
    );
  }


  static gradientCardItemBlackAllItem() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColor.black.withOpacity(0.00),
          AppColor.black,
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      border: Border.all(
        color: AppColor.boarderLineCardItem,
        width: 1,
      ),
    );
  }

  ///----------------------------------------------------------------- tap

  static tapIconTransparent({double? radiusSize}) {
    return BoarderHelper.cardView(
      radiusSize: radiusSize??16.r ,
      colorLine: AppColor.whiteTransparent,
      colorBackground: AppColor.whiteTransparent,
    );
  }


  static tapIconSolid({double? radiusSize}) {
    return BoarderHelper.cardView(
      radiusSize: radiusSize??16.r ,
      colorLine: AppColor.white ,
      colorBackground: AppColor.whiteTransparent,
    );
  }


  static buttonWithIcon(Color color) {
    return BoarderHelper.cardView(
      radiusSize:  16.r ,
      colorLine: color ,
      colorBackground: color,
    );
  }


  static buttonWhite( ) {
    return   BoarderHelper.cardView(
      colorBackground: AppColor.backgroundButtonWhite,
      radiusSize: AppDimension.radiusContainerButton,
      widthLine: 2.sp,
      colorLine: Colors.white,
    );
  }


  ///----------------------------------------------------------------- bottom sheet

  static bottomSheetDecoration() {
    return BoarderHelper.cardView(
        colorLine: AppColor.boarderBottomSheet,
        colorBackground: AppColor.white,
        radiusBorder: BorderRadiusTools.top(radius: 16.r )
    );
  }

  ///----------------------------------------------------------------- select

  static selectedOrUnSelectedShape(bool isSelected) {
    return BoarderHelper.cardView(
        colorBackground:  isSelected? AppColor.selectedItemTransparentStatusSelectedBackground: AppColor.white,
        colorLine:  isSelected? AppColor.primary : AppColor.selectedItemTransparentStatusUnSelectedBoarder,
        radiusSize: 16.r
    );
  }

  static selectedOrUnSelectedCard(bool isSelected, {required double radius}) {
    return BoarderHelper.cardView(
        colorBackground: isSelected ?  AppColor.white : AppColor.shadowCardUnSelected,
        colorLine:  isSelected? AppColor.primary : Colors.transparent,
        radiusSize: radius
    );
  }


  static selectedCardItem() {
    return BoarderHelper.cardView(
        colorBackground: Colors.transparent,
        colorLine:    AppColor.primary,
        radiusSize: 16.r
    );
  }


  static selectedButton() {
    return BoarderHelper.cardView(
        colorBackground: AppColor.whiteTransparent,
        widthLine: 2.r ,
        colorLine:    AppColor.primary,
        radiusSize: 32.r
    );
  }


  static unselectedButton() {
    return BoarderHelper.cardView(
        colorBackground: AppColor.whiteTransparent,
        colorLine:    AppColor.selectedItemTransparentStatusUnSelectedBoarder,
        widthLine: 2.r ,
        radiusSize: 32.r
    );
  }

  static dialogBottomSheet() {
    return BoarderHelper.rounded(
        colorLine: AppColor.boarderBottomSheet,
        colorBackground: AppColor.backgroundDialog,
        radiusSize: 25.r ,
        radiusBorder: BorderRadiusTools.get(
            radius_topLeft: 25.r,
            radius_topRight: 25.r
        )
    );
  }

  ///---------------------------------------------------------------- marker

  static markerBoarderOuterBlack() {
    return BoarderHelper.cardView(
        radiusSize: 32.r ,
        colorBackground: AppColor.white,
        colorLine: AppColor.black,
        widthLine: AppDimension.factorOfRenderRepaintBoundary( 1.w)
    );
  }


  static markerBoarderInnerPrimary() {
    return BoarderHelper.cardView(
        radiusSize: 32.r ,
        colorBackground: AppColor.primary,
        colorLine: AppColor.primary,
        widthLine: 0
    );
  }

  ///------------------------------------------------------------------ textfield


  static textField() {
    return BoarderHelper.cardView(
        radiusSize: 12.r,
        colorLine: AppColor.boarderLineCardItem,
        colorBackground: AppColor.white
    );
  }


  static textFieldError() {
    return BoarderHelper.cardView(
        radiusSize: 12.r,
        colorLine: AppColor.red,
        widthLine: 1,
        colorBackground: AppColor.white
    );
  }


  static textFieldCode() {
    return BoarderHelper.cardView(
        radiusSize: 8.r,
        colorLine: AppColor.boarderLineCardItem,
        colorBackground: AppColor.white
    );
  }

  ///---------------------------------------------------------- photo

  static photoCircle(double radius) {
    return BoarderHelper.cardView(
        radiusSize: radius,
        colorLine: AppColor.white,
        widthLine: 7.w ,
        colorBackground: AppColor.bluePlaceholderImage
    );
  }


}