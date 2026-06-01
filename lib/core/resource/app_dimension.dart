import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:flutter/material.dart';

class AppDimension  {



  /// dropdown
  static double dropdownWidthDialogFilter(BuildContext context) => DeviceTools.getWidth(context) - 16.5.hTabletInputField - 16.5.hTabletInputField  ;
  static double dropdownFloatingPaddingTopToFixTitleFloating =  12.sp /2 ;

  /// textField
  static var textFieldHeight = 56.sp  ;
  static var textFieldIconWidth = 24.sp    ;
  static var textFieldRadiusBoarder = 12.r ;
  static var textFieldBoarderWidth = 0.5;
  static var textfieldTextFontSize =  16.sp  ;
  static var textFieldPadding = EdgeInsets.only(
      left: 16.5.hTabletInputField,
      right: 16.5.hTabletInputField,

      /// controller height of textfield
      bottom:  17.hTabletInputField,
      top: 17.hTabletInputField
  );
  static var textfieldMobileCountryCodeWidth = 110.sp  ;
  static var textfieldPaddingIcon = 16.sp  ;
  static var authInputfieldWidth = 305.sp   ;
  static var adminButtonWidth = 150.hTabletInputField  ;

  /// margin
  static var marginBetweenCardItem = 16.h  ;
  static var marginUnderHeaderTitle = 20.h  ;
  static var marginBetweenInputFields = 16.h  ;
  static var marginBetweenSectionsInsideCard = 16.h ;
  static var marginInsideSectionsInsideCard = 8.h ;
  static var marginAboveSaveButton = 20.h ;
  static var marginHorizontalScreen = 16.w ;
  static var marginVerticalScreen = 16.w ;
  static var marginAllScreen = 16.w  ;

  /// gridview
  static var sectionGridviewBottomPadding = 4.h;


  /// specific page: filter dialog
  static double homeScreenFilterByBuildTypeHeight() =>  32.h;

  /// specific page: map page
  static double mapCityTriangleMarkerHeight = 20;
  static double mapRealestateTriangleMarkerHeight = 20;
  static double mapTriangleMarkerHeight = 36;
  static double  factorOfRenderRepaintBoundary( double v) => v * 2.0;
  static double homescreenWidthButtonListViewCounter = 143.w ;

  ///specific page: map page for marker Cluster
  static double mapClusterMarkerCustomWidth = 200;
  static double mapClusterMarkerCustomHeight = 130;

  ///specific page: map page for marker realestate
  static double mapRealestateMarkerCustomWidth = 100;
  static double mapRealestateMarkerCustomHeight = 23 + 13 - 3;

  /// specific page: auth


  /// radius any
  static double  radiusTab() => 32.h;
  static radiusDialog() => 30.r ;
  static var radiusSection = 24.r;
  static var radiusCard = 16.r;
  static double  radiusAllScreen  =  32.h;
  static double  radiusSmallCard  =  32.h;
  static double  radiusContainerButton  =  8.h;
  static BorderRadius radiusAuthDialog() {
    return BorderRadius.circular(40.r);
  }
  static BorderRadius radiusDialogBottomSheet() {
    return BorderRadiusTools.top(radius: 30.r );
  }


  /// appbar
  static double tapAppBarHeight() => 44.h;


  /// dialog
  static var paddingDialogBottomSheet = EdgeInsets.only(
      left: 16.5.w,
      right: 16.5.w,
      bottom:  16.w,
      top: 0.h
  );

  static double titleAuthDialog() {
    // if(DeviceTools.isLandscape( GlobalApp.getContextForceUnWarp()) ) return 14.ht;
    return   20.sp ;
  }

  static dialogWidth() => 340.w;


  static dialogBottomSheet(BuildContext context ) {
    if(DeviceTools.isLandscape(context)) return 340.w;
    return DeviceTools.getWidth(context);
  }


  static double? dialogWidthAwesome(BuildContext context) {
    if(DeviceTools.isLandscape(context)) return 340.w;
    return null ;
  }


  /// icons
  static double icon = 20.w ;
  static double iconContainer = 54.w ;
  static double iconAdmin = 14.w ;
  static double iconContainerAdmin = 27.w ;

  /// dialog picker
  static double dialogPickerWidthCard(BuildContext context ) {
    return DeviceTools.isLandscapeOrSemiBox(context) ? 450.w : DeviceTools.getWidth(context);
  }

  static double dialogPickerWidthInputField(BuildContext context ) {
    return DeviceTools.isLandscapeOrSemiBox(context) ? 360.w : DeviceTools.getWidth(context) - 90.w ;
  }


  /// file
  static var placeholderFileHeight = 56.h ;
  static double placeholderFileRadiusCard = 16.r;

  /// paginate
  static double paginateHeightFrame = 66.h ;
  static double paginateHeightTapButton = 30.h;
  static double paginateFontTapSize = 16.sp;
  static double paginateRadius = 8.r ;

  /// admin panel
  static double adminInputfieldWidth(BuildContext context) => 305.sp;
  static double adminInputfieldSearchList(BuildContext context)  {
    return DeviceTools.isLandscapeOrSemiBox(context) ? 305.sp : 280.w;
  }

}