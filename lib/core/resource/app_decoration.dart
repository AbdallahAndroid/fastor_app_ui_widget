import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
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
        colorLine: AppColors.greenLight,
        colorBackground: AppColors.white);
  }


  ///------------------------------------------------------------- appbar

  static linearGradientBackgroundFullScreenCausingTopAppbarDark() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.primaryDark,
          AppColors.primaryLight,
          AppColors.primaryLight,
          AppColors.primaryLight,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  static cardBodyScreen() {
    return BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
        border: Border.all(color: AppColors.white));
  }


  ///----------------------------------------------------------------- appbar

  static tapAppBarPrimaryDark(double radiusSize) {
    return BoarderHelper.cardView(
      radiusSize: radiusSize,
      colorLine: AppColors.primaryDark,
      colorBackground: AppColors.primaryDark,
    );
  }

  ///----------------------------------------------------------------- navigation bottom


  static navigationBottom() {
    return BoarderHelper.cardView(
        colorLine: AppColors.white,
        colorBackground: AppColors.white,
        radiusBorder: BorderRadiusTools.top(radius: 16.r )
    );
  }

  ///----------------------------------------------------------------- card item

  static cardItem() {
    return BoarderHelper.cardView(
        radiusSize: 16.r,
        colorLine: AppColors.boarderLineCardItem,
        colorBackground: AppColors.white
    );
  }

  static cardItemSection() {
    return BoarderHelper.cardView(
        radiusSize: AppDimension.radiusSection,
        colorLine: AppColors.boarderLineCardItem,
        colorBackground: AppColors.white
    );
  }

  static cardItemFileSelected() {
    return BoarderHelper.cardView(
        radiusSize: AppDimension.placeholderFileRadiusCard,
        colorLine: AppColors.fileCardBackground,
        colorBackground: AppColors.fileCardBackground
    );
  }

  static cardSmallPrimary() {
    return BoarderHelper.cardView(
        radiusSize: AppDimension.radiusSmallCard,
        colorLine: AppColors.primary,
        colorBackground: AppColors.primary
    );
  }

  ///----------------------------------------------------------------- gradient

  static gradientCardItemAtBottomOfCard() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.black.withOpacity(0.00),
          AppColors.black.withOpacity(0.00),
          AppColors.black.withOpacity(0.0),
          AppColors.black.withOpacity(0.5),
          AppColors.black,
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      border: Border.all(
        color: AppColors.boarderLineCardItem,
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
          AppColors.black.withOpacity(0.00),
          AppColors.black,
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      border: Border.all(
        color: AppColors.boarderLineCardItem,
        width: 1,
      ),
    );
  }

  ///----------------------------------------------------------------- tap

  static tapIconTransparent({double? radiusSize}) {
    return BoarderHelper.cardView(
      radiusSize: radiusSize??16.r ,
      colorLine: AppColors.whiteTransparent,
      colorBackground: AppColors.whiteTransparent,
    );
  }


  static tapIconSolid({double? radiusSize}) {
    return BoarderHelper.cardView(
      radiusSize: radiusSize??16.r ,
      colorLine: AppColors.white ,
      colorBackground: AppColors.whiteTransparent,
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
      colorBackground: AppColors.backgroundButtonWhite,
      radiusSize: AppDimension.radiusContainerButton,
      widthLine: 2.sp,
      colorLine: Colors.white,
    );
  }

  ///----------------------------------------------------------------- bottom sheet

  static bottomSheetDecoration() {
    return BoarderHelper.cardView(
        colorLine: AppColors.boarderBottomSheet,
        colorBackground: AppColors.white,
        radiusBorder: BorderRadiusTools.top(radius: 16.r )
    );
  }

  ///----------------------------------------------------------------- select

  static selectedOrUnSelectedShape(bool isSelected) {
    return BoarderHelper.cardView(
        colorBackground:  isSelected? AppColors.selectedItemTransparentStatusSelectedBackground: AppColors.white,
        colorLine:  isSelected? AppColors.primary : AppColors.selectedItemTransparentStatusUnSelectedBoarder,
        radiusSize: 16.r
    );
  }

  static selectedOrUnSelectedCard(bool isSelected, {required double radius}) {
    return BoarderHelper.cardView(
        colorBackground: isSelected ?  AppColors.white : AppColors.shadowCardUnSelected,
        colorLine:  isSelected? AppColors.primary : Colors.transparent,
        radiusSize: radius
    );
  }


  static selectedCardItem() {
    return BoarderHelper.cardView(
        colorBackground: Colors.transparent,
        colorLine:    AppColors.primary,
        radiusSize: 16.r
    );
  }


  static selectedButton() {
    return BoarderHelper.cardView(
        colorBackground: AppColors.whiteTransparent,
        widthLine: 2.r ,
        colorLine:    AppColors.primary,
        radiusSize: 32.r
    );
  }


  static unselectedButton() {
    return BoarderHelper.cardView(
        colorBackground: AppColors.whiteTransparent,
        colorLine:    AppColors.selectedItemTransparentStatusUnSelectedBoarder,
        widthLine: 2.r ,
        radiusSize: 32.r
    );
  }

  static dialogBottomSheet() {
    return BoarderHelper.rounded(
        colorLine: AppColors.boarderBottomSheet,
        colorBackground: AppColors.backgroundDialog,
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
        colorBackground: AppColors.white,
        colorLine: AppColors.black,
        widthLine: AppDimension.factorOfRenderRepaintBoundary( 1.w)
    );
  }


  static markerBoarderInnerPrimary() {
    return BoarderHelper.cardView(
        radiusSize: 32.r ,
        colorBackground: AppColors.primary,
        colorLine: AppColors.primary,
        widthLine: 0
    );
  }

  ///------------------------------------------------------------------ textfield

  static textField() {
    return BoarderHelper.cardView(
        radiusSize: AppDimension.textFieldRadiusBoarder,
        colorLine: AppColors.textFieldBoarder,
        widthLine:   AppDimension.textFieldBoarderWidth,
        colorBackground: AppColors.white
    );
  }


  static textFieldError() {
    return BoarderHelper.cardView(
        radiusSize: AppDimension.textFieldRadiusBoarder,
        colorLine: AppColors.red,
        widthLine:AppDimension.textFieldBoarderWidth,
        colorBackground: AppColors.white
    );
  }


  static textFieldCode() {
    return BoarderHelper.cardView(
        radiusSize: 8.r,
        colorLine: AppColors.boarderLineCardItem,
        colorBackground: AppColors.white
    );
  }

  ///---------------------------------------------------------- icon

  static iconCircle({required double radius, required double widthLine}) {
    return BoarderHelper.cardView(
        radiusSize: radius,
        colorLine: AppColors.primary,
        widthLine: widthLine,
        colorBackground: AppColors.primary
    );
  }

  ///---------------------------------------------------------- photo

  static photoCircle({required double radius, required double widthLine}) {
    return BoarderHelper.cardView(
        radiusSize: radius,
        colorLine: AppColors.white,
        widthLine: widthLine,
        colorBackground: AppColors.bluePlaceholderImage
    );
  }

  static photoAddButtonCircle(double radius) {
    return BoarderHelper.cardView(
        radiusSize: radius,
        colorLine: AppColors.primary,
        widthLine: 1.w ,
        colorBackground: AppColors.white
    );
  }


  ///---------------------------------------------------------- drawer

  static drawerHeader() {
    return BoarderHelper.cardView(
        radiusSize: 0,
        colorBackground: AppColors.primary
    );
  }


  static tapMenuWithIcon({required bool isSelected} ) {
    if( isSelected ){
      return   BoarderHelper.cardView(
        colorBackground: AppColors.primaryTabTransparent,
        radiusSize:  16.sp ,
        widthLine: 1,
        colorLine: AppColors.boarderLineCardItem,
      );
    }
    return   BoarderHelper.cardView(
      colorBackground: Colors.white,
      radiusSize:  16.sp ,
      widthLine: 1,
      colorLine: AppColors.boarderLineCardItem,
    );
  }


}