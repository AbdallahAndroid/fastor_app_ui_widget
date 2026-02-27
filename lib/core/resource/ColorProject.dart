import 'package:flutter/material.dart';

class AppColors   {


  ///theme device
  static const statusBarColorBackground =  Color( 0xffCE1226);
  static const colorBackgroundNavigation = Colors.white;


  /// primary
  static Color primaryDark = Colors.green;
  static Color primaryLight = Colors.greenAccent;
  static Color primary = Colors.green;

  /// backgroud views
  static Color backgroundAllScreens = Colors.white;
  static Color backgroundCard =  Colors.black;
  static Color backgroundItemList = Colors.white;
  static Color backgroundBottomSheet =  backgroundCard.withOpacity( 0.4);
  static var backgroundCardTransparent  =  backgroundCard.withOpacity( 0.1);
  static var blurCard =  Colors.blueAccent.withOpacity(0.5); //.withOpacity( 0.4 );

  /// dialog
  static var backgroundDialogDismissCaseHaveMessageTypeEffectGlass = Colors.black.withOpacity( 0.4 ); /// Color(0x99000000);
  static Color dialogDismisableBackground = Color(0xffFFFFFF ).withOpacity( 0.6 );
  static var backgroundDialog =  Colors.white; //figma make it white ffffff
  static var backgroundCardDialogTransparent =  Colors.white.withOpacity(0.6 ); //figma make it white ffffff
  static var backgroundDialogDismissAreaTypeEffectGlass = Colors.black.withOpacity( 0.4 );
  static Color dialogDialogDismissAreaTypeNormal = Color(0xffFFFFFF ).withOpacity( 0.6 );
  static var backgroundDialogFixingPreviousScreenInCaseWhite = Colors.black.withOpacity( 0.4 );
  static var backgroundDialogDismissAreaTypeEffectGlassPortrait = Colors.white.withOpacity( 0.4 );

  /// text
  static var textPrimary = Colors.black;
  static var textPrimaryLight = Color(0xff25A7F8 );
  static var textSecondary = Colors.white;
  static var textLight = Color(0xff69626d );
  static var textUnSelected  = Colors.white;
  static var textSelected  = Color(0xff8ECFF6);
  static var textShine  = Color(0xff8ECFF6);   // Color(0xff02263c );

  /// textfield
  static var textFieldBoarderLineBeforeFocused = Colors.white;
  static var textFieldBoarderLineFocused =  Colors.white; //Color(0xff25A7F8);
  static var textFieldBackground = Color(0xffFFF5EB);
  static var textFieldBoarderLine = Colors.grey;
  static var textFieldIcon =  Color(0xff02263c );
  static var textFieldHint = Colors.grey;
  static var textFieldText =  Color(0xff02263c );
  static var textFieldDarkBoarderLineBeforeFocused =  Colors.grey;
  static var textFieldLabel = Colors.black.withOpacity(0.60); /// figma;
  static var textFieldBoarder =  Colors.black.withOpacity( 0.38) ; /// figma
  static var textFieldError = Colors.red;
  static var textFieldIcon2 = Color(0xff767680).withOpacity(0.12) ;

  /// buttons
  static var buttonBoarder = Color(0xffC7E2F1);
  static var buttonBackground = Color(0xffC7E2F1);
  static var buttonSecondaryBoarder = Color(0xff69626d);
  static var buttonSecondaryText =  Color(0xff02263c );
  static var buttonText  = Color(0xff69626d);
  static var tapSelectedBackground =  Color(0xff02263c );
  static var tapUnSelectedBackground =  Color(0xffC7E2F1 );

  /// icon tap
  static var iconTapSelected =   Color(0xff02263c );
  static var iconTapUnSelected =   Color(0xff69626d );

  /// navigation bar
  static var navigationIconSelected =  Color(0xff8ECFF6);
  static var navigationIconUnSelected =   Color(0xff69626d );

  /// progress
  static var progressContainer = Colors.orange;
  static var iconInsideProgressContainer = Colors.blueAccent;
  static var progressCircle = Colors.orange;
  static var progress = Colors.orange;

  /// shimmer
  static var shimmerProgressCircleInside = Color(0xffC7E2F1).withOpacity( 0.5 );

  /// toast
  static var toastBackground =   Color(0xff69626d); //.withOpacity(0.9);
  static var toastText = Color(0xff8ECFF6); //Color(0xff02263c);

  /// checkbox
  static var checkboxColorActive =  Color(0xff8ECFF6);
  static var checkboxColorInActive =  Color(0xffFFF5EB);

  /// button
  static var buttonGrey = Colors.grey.withOpacity(0.5);
  static var buttonTransparent = Color(0x33AE0003); //.withAlpha(  51);

  /// appbar
  static var appBarBackground =  Color(0xff02263c );

  /// divider
  static var dividerPrimaryLight =  Color(0xff8ECFF6);
  static var dividerGray =  Color(0xff69626d).withOpacity( 0.4 );

  ///transparent
  static var transparentPrimary = Color(0xff02263c ).withOpacity( 0.4 );
  static var transparentPrimaryLight = Color(0xff8ECFF6 ).withOpacity( 0.4 );
  static var transparentGrey = Color(0xff69626d ).withOpacity( 0.1 );


  /// placeholder
  static var placeholderIcon = Color(0xff69626d);
  static var backgroundImagePlaceholderDark = Colors.black;
  static var backgroundImagePlaceholderLight = Color(0xff69626d);
  static const  Color statusbarColor =   Color(0xff02263c );

  /// green
  static var greenLight = Colors.green.withOpacity( 0.5 );
  static var greenMedium = Colors.green.withOpacity( 0.8 );
  static var greenDark = Colors.green;

  /// red
  static var red = Colors.red.withOpacity( 0.5 );
  static var redLight = Colors.red.withOpacity( 0.5 );
  static var redMedium = Colors.red.withOpacity( 0.8 );
  static var redDark = Colors.red;
  static var redMaterial = Colors.red;

  /// black
  static var black = Colors.black;

  ///
  static var iconEmptyDataFound = Color(0xffFFF5EB);

  static var white = Colors.white;

  static var areaAroundDialogTransparent = Color(0x99000000); // Black with 60% opacity;

  /// grey
  static var grey = Color(0xff69626d );

  /// white
 static var whiteTransparent = Colors.white.withOpacity(0.7);

 ///---------------------------------------------------- new

  ///theme device
  static const colorBackgroundNavigationSystemBar = Colors.white;

  /// background
  static var backgroundDark = backgroundAllScreens ;
  static var backgroundScreenHome = primary ;
  static var backgroundMedium = backgroundAllScreens;
  static var backgroundLight = backgroundAllScreens;

  static var backgroundGallery = Color(0xff151515);
  static var backgroundTransparent70 = Colors.white.withOpacity(0.7);

  /// navigation
  static var colorBackgroundNavigationBottom = Colors.white.withOpacity( 0.5 );
  static var colorBoarderLineNavigationBottom = Colors.black.withOpacity(0.15);

  /// red
  static var primaryTabTransparent = Color(0xffCE1226).withOpacity(0.2 ); // figma
  static Color redLight2 = redLight;  // figma

  /// blue
  static Color blueMarkerMap = Color(0xff5429CA );
  static var blueLight = blueMarkerMap.withOpacity(0.5 );
  static var blueMedium = blueMarkerMap.withOpacity(0.8 );

  /// green
  static var greenSelected = Color(0xff1BF99C ); //figma
  static var greenBright = Color(0xff1BF99C);


  ///yellow
  static var secondary = white.withOpacity(0.7 );

  /// boarderline
  static var dropdownLinePrimary =  primary ;
  static var boarderLineCardItem = Color(0xffE8E8E8);
  static var boarderBottomSheet = Color(0xff9E9E9E); ///#9E9E9E

  /// text
  static var textColor =  Color(0xff161A22) ;
  static var textGrey = Color(0xff757575);
  static var textGrey2 = Color(0xff6C737F);
  static var textBlackLight = Color(0xff505050);

  static var whiteRedLight = Color(0xffF2F2F2);//#F2F2F2

  /// transparent
  static var transparentDarkPrimary =  primary.withOpacity( 0.5 );
  static var transparentWhitePrimary = white.withOpacity( 0.6 );

  /// shadow
  static var shadowLine = white.withOpacity( 0.6 );
  static var shadowCardForWaterLogo = AppColors.black.withOpacity(0.1);
  static var shadowCardUnSelected = AppColors.black.withOpacity(0.4);

  /// black
  static Color blackLight = black.withOpacity(0.5 ) ;
  static Color blackLight2 = black.withOpacity(0.6 ) ;

  /// grey
  static var greyLight = Colors.grey.withOpacity(0.5);
  static var tabGrey = Color(0xff7F7F7F66).withOpacity(0.4);


  /// divider
  static var dividerGrey = Color(0xffB1B1B1);
  static var dividerPrimaryLight20Percentage = primary.withOpacity(0.2);

  /// textField / dropdown shape inputField
  static var textFieldDialogHint =  Colors.black.withOpacity(0.60); /// figma

  /// selected
  static var selectedItemTransparentStatusSelectedBackground = Color(0xffCE1226).withOpacity(0.05);
  static var selectedItemTransparentStatusUnSelectedBoarder = Color(0xffE1E3E8);

  /// image
  static var imageBackgroundPlaceHolder = Color(0xffE8E8E8);
  static var imageWaterLogoDark = Color(0xffB1B1B1).withOpacity( 0.5 );
  static var bluePlaceholderImage = Color(0xff218EE7);

  /// video
  static var videoBackgroundPlaceHolder =   black.withOpacity(0.5 ) ;

  /// button
  static var buttonGray = Colors.black.withOpacity(0.05);
  static var buttonSecondaryBackgroundGray = Color(0xffF4F4F6);
  static var buttonTextSecondary = Color(0xff1F1F1F);
  static var progressButton = white ;
  static var backgroundButtonWhite = Color(0xffffffff).withOpacity(0.30 );

  /// appbar
  static var iconAppbarColor = AppColors.white;

  /// drawer
  static var drawerBackgroundCard = AppColors.white;
  static var drawerIconMenu = AppColors.primary;

  /// placeholder picker image
  static var placeholderImagePickerBoxCardBackground = Color(0xffEFF4F7);
  static Color blueTextPlaceholderImagePicker  = Color(0xff0066FF); //#0066FF
  static Color blueBoarderLine = Color(0xff0066FF); //#0066FF

  /// file
  static var fileCardBackground = Color(0xFFF2F2F2) ;



}