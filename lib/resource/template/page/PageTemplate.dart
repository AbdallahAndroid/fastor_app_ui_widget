

import 'package:fastor_app_ui_widget/resource/template/image/ImageView.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/state/FastorStateManagement.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/iphoneNotchBar/NotchBarConstant.dart';



import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressCircle.dart';



import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';

import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollViewPage.dart';
import 'package:flutter/services.dart';


import 'base/BasePageTemplateProgrees.dart';

/// Page like Scaffold
class PageTemplate {

  static const tag = "PageTemplate";

  //------------------------------------------------------------------------ type : Scaffold

  static Widget t (
      State myState,
      {

        //body
        required Widget content,

        //page info
        String? title = "",  //page title show when app be at recent apps in android,
        //page title show at tab of new page in "Web"

        //background
        AssetImage? assetBackground, //image set to background of page pages "AssetImage"
        double? assetBackgroundOpacity,
        Color? colorBackground,
        Widget? widgetBackground, //make widget to set as fixed background while scrolling moving

        //toolbar (top view )
        Widget? toolbar,
        double? toolbar_height ,

        //float_bottom ( bottom view )
        Widget? floatBottom,

        //  navigation: is the fixed view at align parent bottom of screen
        Widget? navigationBottom ,
        double? navigationBottom_height ,

        /**
         * TODO? need to do this in future
         */
        //footer
        Widget? footer,             //the footer  used at web
        double? footer_height,


        //progress
        ValueChanged<ProgressCircleState>? onChangeProgressState,

        //color
        Color? statusBarColorCustom,
        Color?  homeButtonsBackgroundColor,

        //drawer menu
        GlobalKey? scaffoldKey, // = GlobalKey()
        Widget? drawer,
        DrawerCallback? onDrawerChanged,

        //scroll
        ScrollController? scrollController,

        //keybaord
        bool? resizeToAvoidBottomInset
      }){

    //state manager
    FastorStateManagement.instance().addState( myState );

    // check null
    title ??= "";


    //step 1 - toolbar height
    if( toolbar != null ){
      toolbar_height ??= 70;
    }

    //step 2 - toolbar view
    toolbar ??= EmptyView.zero();

    //set default navigation height
    if( navigationBottom != null ) {
      navigationBottom_height ??= 70;
    }

    //navigation view
    navigationBottom ??= EmptyView.zero();

    //floatBottom view
    floatBottom ??= EmptyView.zero();

    //background (color or image )
    var myBackground = _getBackground( myState.context, colorBackground,
        assetBackground, assetBackgroundOpacity, widgetBackground );

    //scroll all page
    Widget scrollAllPage = ScrollViewPage.t( myState.context, content,
        scrollController: scrollController,
        toolbarHeight: toolbar_height,
        footer_height: navigationBottom_height );

    // choose stack of page mobile app
    Stack stack = _putEveryBarToStack(myState.context, myBackground, scrollAllPage, floatBottom,
        navigationBottom, navigationBottom_height,
        toolbar, onChangeProgressState );

    var pageStack =  _statusBar(myState.context, stack, title , statusBarColorCustom);

    //scaffold
    var scaffold =  Scaffold(

        resizeToAvoidBottomInset: resizeToAvoidBottomInset ,

        //
        body: pageStack,

        //drawer menu
        key:  scaffoldKey,
        drawer: drawer,
        onDrawerChanged: onDrawerChanged
    );


    return _getHomeButtonTheme( homeButtonsBackgroundColor, scaffold );
  }


  //--------------------------------------------------------------- basic

  static AnnotatedRegion _getHomeButtonTheme( Color? homeButtonsBackgroundColor, Scaffold scaffold ) {
    //navigation bar color
    homeButtonsBackgroundColor ??= DSColor.homeButtons_background;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: homeButtonsBackgroundColor, //
        ),
        child: scaffold
    );

  }
  //+++++++++++++++++++++++ background

  static Widget _getBackground( BuildContext context, Color? colorBackground,
      AssetImage? assetBackground, double? assetBackgroundOpacity,
      Widget? widgetBackground) {

    //color background default value
    colorBackground ??= DSColor.ds_background_all_screen;
    // Log.i( "PagTemplate - DeviceTools.getWidth() " + DeviceTools.getWidth().toString() );

    // case: widget background
    if( widgetBackground != null ) {
      return widgetBackground;
    }

    //case : asset background
    if( assetBackground != null ) {
      //myBackground =   ImageBackground.allDeviceScreen( assetBackground , opacity: assetBackgroundOpacity!);
      return ImageView(
        width: DeviceTools.getWidth( context),
        height: DeviceTools.getHeight(  context ),
        opacity: assetBackgroundOpacity,
        colorBackground: colorBackground,
        assetBackground: assetBackground,
      );
    }

    //case : default background  color
    var myBackground =  EmptyView.colored(
        DeviceTools.getWidth( context),
        DeviceTools.getHeight(context ),
        colorBackground);
    return myBackground;
  }

  //--------------------------------------------------------------------- surround

  /**
   * set "StatusBar"
   */
  static Widget _statusBar(BuildContext context, Stack stack, String? title, Color? statusBarColorCustome) {
    //
    var statusBarMobile = Colors.transparent; //website not need
    if( DeviceTools.isMobile() ) {

      //custome color mobile
      var mobileStatus  = statusBarColorCustome ;

      //default mobile
      mobileStatus  ??= StatusBarConstant.colorBackground;

      //set result
      statusBarMobile = mobileStatus;
    }

    // calcluate statusbar height
    double marginStatusBar = 0;
    if( DeviceTools.isMobile() ) {
      marginStatusBar = StatusBarConstant.getHeight( context);
    }

    //calculate notch bar height
    double marginNotchBar = NotchBarConstant.getHeight(context);

    //status bar mobile + take all page
    var statusBar = Container(
      color: statusBarMobile , // StatusBarConstant.colorBackground, //statusBarMobile , // HexColor("#D486A8"),  //
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          top: marginStatusBar,
        bottom: marginNotchBar,
      ),
      child: stack,
    );


    //material
    var material =  MaterialApp(
        title: title!,// "Home",
        debugShowCheckedModeBanner: false,
        home: statusBar);
    return material;
  }

  //------------------------------------------------------------------------ chosse page

  static Stack _putEveryBarToStack(
      BuildContext context,
      Widget myBackground,
      Widget scrollAllPage,
      Widget floatBottom,
      Widget navigationBottom,
      double? navigation_height,
      Widget toolbar,
      ValueChanged<ProgressCircleState>? onChangeProgressState) {


    //progress
    var progress = BasePageTemplateProgress.progressView(onChangeProgressState);

    // var statusBarHeight = StatusBarConstant.getHeight();

    var stack =  Stack(
      children: [

        //expanded
        EmptyView.allDeviceScreen(context),

        //set  background (color or image or widgetBackground )
        myBackground,

        //scroll here
        scrollAllPage,

        //progress center
        Align( child: progress , alignment: Alignment.center ),

        // floating
        Positioned(child: floatBottom, bottom: 0, left: 0, right: 0 ),

        //toolbar fixed at top of the view
        toolbar,

        // navigation
        Positioned(child: navigationBottom, bottom: 0, left: 0, right: 0 ),

        //test
        // Text( "4: " + StatusBarConstant.colorBackground.hexColor )

      ],
    );

    return stack;
  }




}
