import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';

class AppDimension {


  /// textfield
  static   double textFieldContentPaddingHorizontal = Figma.h( 15 );
  static   double textFieldContentPaddingVertical = Figma.h( 15 );
  static  double textFieldHeight = Figma.h(65) ;
  static double textFieldBoarderWidth = 0.5;
  static var textFieldRadiusBoarder = 12.r ;
  static var textFieldPadding = EdgeInsets.only(
      left: 16.5 ,
      right: 16.5 ,
      bottom:  14.h,
      top: 14.h
  );


  /// corner
  static double cornerTextField = 8 ;

  /// button
  static  double buttonHeight = Figma.h(65) ;
  static double radiusContainerButton = 12.r;

  /// spaces
  static double marginLeftRightScreen = Figma.h( 30 );
  static double marginTopBottomScreen = Figma.h( 30 );
  static double marginLeftRightSubcategory = 15.0;
  static var marginBetweenTwoInputFiled = Figma.h( 32 );
  static var marginBetweenTwoSections = Figma.h( 16 );
  static var marginBetweenItemInSingleSections = Figma.h( 8 );
  static var marginBetweenItemList = Figma.h( 16 );


  ///-------------------------------------------------------------------------------


  static var marginHorizontalScreen = 16.w ;

  static var sectionGridviewBottomPadding = 4.h;

  static double homeScreenFilterByBuildTypeHeight() =>  32.h;

  static double mapCityTriangleMarkerHeight = 20;

  static double mapRealestateTriangleMarkerHeight = 20;

  static double mapTriangleMarkerHeight = 36;

  /// marker city
  // static double mapCityMarkerCustomWidth = 200;
  // static double mapCityMarkerCustomHeight = 130;

  /// marker Cluster
  static double mapClusterMarkerCustomWidth = 200;
  static double mapClusterMarkerCustomHeight = 130;

  /// marker realestate
  static double mapRealestateMarkerCustomWidth = 100;
  static double mapRealestateMarkerCustomHeight = 23 + 13 - 3;

  /// radius
  static double  radiusTab() => 32.h;
  static radiusDialog() => 30.r ;
  static var radiusSection = 24.r;
  static var radiusSmallCard = 12.r ;
  static double  radiusAllScreen  =  32.h;

  /// appbar
  static double tapAppBarHeight() => 44.h;



  static dialogWidth() => 340.w;

  static double  factorOfRenderRepaintBoundary( double v) => v * 2.0;

  static radiusDialogBottomSheet() => 40.r ;



}