import 'package:flutter/material.dart';

class AppColor   {


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
  static var backgroundDialogDismissHome = Colors.black.withOpacity( 0.4 ); /// Color(0x99000000);
  static Color dialogDismisableBackground = Color(0xffFFFFFF ).withOpacity( 0.6 );
  static var backgroundDialog =  Colors.white; //figma make it white ffffff
  static var backgroundCardDialogTransparent =  Colors.white.withOpacity(0.6 ); //figma make it white ffffff


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


}