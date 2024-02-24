

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemDimen.dart';
import 'package:fastor_app_ui_widget/resource/template/image/ImageView.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/state/FastorStateManagement.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/iphoneNotchBar/NotchBarConstant.dart';

import 'package:flutter/material.dart';

import 'package:fastor_app_ui_widget/resource/template/progressView/ProgressCircle.dart';

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';

import 'package:fastor_app_ui_widget/resource/resources/ds/DesignSystemColor.dart';
import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';

import 'package:fastor_app_ui_widget/resource/template/scrollview/ScrollViewPage.dart';
import 'package:flutter/services.dart';

import 'base/BasePageTemplateProgrees.dart';

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';


/// Page Fastor like Scaffold
class PageFastor extends StatelessWidget {
  static const tag = "PageFastor";

  //required
  State myState; //write "this" inside any class type "StateFullWidget"
  Widget content;
  BuildContext? context;

  //page info
  String? title; //page title show when app be at recent apps in android,
  //page title show at tab of new page in "Web"

  //background
  AssetImage?
  assetBackground; //image set to background of page pages "AssetImage"
  double? assetBackgroundOpacity;
  Color? backgroundColor;
  Widget?
  widgetBackground; //make widget to set as fixed background while scrolling moving

  //toolbar (top view )
  Widget? toolbar;
  double? toolbar_height;
  AppBarFastor? appBarFastor;

  //float_bottom ( bottom view )
  Widget? floatBottom;

  //  navigation: is the fixed view at align parent bottom of screen
  Widget? navigationBottom;
  double? navigationBottom_height;

  /**
   * TODO? need to do this in future
   */
  //footer
  Widget? footer; //the footer  used at web
  double? footer_height;

  //progress
  ValueChanged<ProgressCircleState>? onChangeProgressState;

  //color
  Color? statusBarColorCustom;
  Color? homeButtonsBackgroundColor;

  //drawer menu
  GlobalKey? scaffoldKey; // = GlobalKey()
  Widget? drawer;
  DrawerCallback? onDrawerChanged;

  //scroll
  ScrollController? scrollController;
  bool? isStopScroll;
  bool? thumbVisibility;

  //keybaord
  bool? resizeToAvoidBottomInset;

  PageFastor(this.myState,
      {
        required Widget this.content,
        this.title = "",
        this.assetBackground,
        this.assetBackgroundOpacity,
        this.backgroundColor,
        this.widgetBackground,
        this.toolbar,
        this.toolbar_height,
        this.appBarFastor,
        this.floatBottom,
        this.navigationBottom,
        this.navigationBottom_height,
        this.footer,
        this.footer_height,
        this.onChangeProgressState,
        this.statusBarColorCustom,
        this.homeButtonsBackgroundColor,
        this.scaffoldKey,
        this.drawer,
        this.onDrawerChanged,
        this.scrollController,
        this.isStopScroll,
        this.thumbVisibility,
        this.resizeToAvoidBottomInset
      }) {
    setDefaultValue();
  }

  //------------------------------------------------------------------------ variable

  void setDefaultValue() {
    //state manager
    FastorStateManagement.instance().addState(myState);

    // check null
    title ??= "";

    //step 1 - toolbar height
    if (toolbar != null) {
      toolbar_height ??= DSDimen.toolbar_height;
    }

    //step 2 - toolbar view
    toolbar ??= EmptyView.zero();

    //case appBarFastor
    if(  appBarFastor != null ) {
      toolbar = appBarFastor;
      toolbar_height = DSDimen.toolbar_height;
    }

    //set default navigation height
    if (navigationBottom != null) {
      navigationBottom_height ??= 70;
    }

    //navigation view
    navigationBottom ??= EmptyView.zero();

    //floatBottom view
    floatBottom ??= EmptyView.zero();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    //background (color or image )
    var myBackground = _getBackground(myState.context, backgroundColor,
        assetBackground, assetBackgroundOpacity, widgetBackground);

    //scroll all page
    Widget scrollAllPage = ScrollViewPage.t(myState.context, content,
        scrollController: scrollController,
        toolbarHeight: toolbar_height,
        footer_height: navigationBottom_height,
        isStopScroll: isStopScroll,
        thumbVisibility: thumbVisibility
    );

    // choose stack of page mobile app
    Stack stack = _putEveryBarToStack(
        myBackground,
        scrollAllPage,
        floatBottom!,
        navigationBottom!,
        navigationBottom_height,
        toolbar!,
        onChangeProgressState);

    // safe area with statusBar size and color
    var stackWithSafeArea = getSafeAreaWithPageContent( stack );


    if(statusBarColorCustom != null ) {
      stackWithSafeArea = _statusBarWithMaterialApp(stackWithSafeArea);
    }

    //scaffold
    var scaffold = Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,

        //
        body: stackWithSafeArea,

        //drawer menu
        key: scaffoldKey,
        drawer: drawer,
        onDrawerChanged: onDrawerChanged);

    if( homeButtonsBackgroundColor != null ) {
      return  _getHomeButtonTheme(homeButtonsBackgroundColor, scaffold);
    } else {
      return scaffold;
    }


    //language dirction
    // return Directionality(
    //   //textDirection: TextDirection.rtl,
    //   textDirection: LanguageTools.getTextDirection(context),
    //   child: theme,
    // );
  }

  //--------------------------------------------------------------- basic

  static AnnotatedRegion _getHomeButtonTheme(
      Color? homeButtonsBackgroundColor, Scaffold scaffold) {
    //navigation bar color
    homeButtonsBackgroundColor ??= DSColor.homeButtons_background;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: homeButtonsBackgroundColor, //
        ),
        child: scaffold);
  }

  //+++++++++++++++++++++++ background

  static Widget _getBackground(
      BuildContext context,
      Color? colorBackground,
      AssetImage? assetBackground,
      double? assetBackgroundOpacity,
      Widget? widgetBackground) {
    //color background default value
    colorBackground ??= DSColor.ds_background_all_screen;
    // Log.i( "PagTemplate - DeviceTools.getWidth() " + DeviceTools.getWidth().toString() );

    // case: widget background
    if (widgetBackground != null) {
      return widgetBackground;
    }

    //case : asset background
    if (assetBackground != null) {
      //myBackground =   ImageBackground.allDeviceScreen( assetBackground , opacity: assetBackgroundOpacity!);
      return ImageView(
        width: DeviceTools.getWidth(context),
        height: DeviceTools.getHeight(context),
        opacity: assetBackgroundOpacity,
        colorBackground: colorBackground,
        assetBackground: assetBackground,
      );
    }

    //case : default background  color
    var myBackground = EmptyView.colored(DeviceTools.getWidth(context),
        DeviceTools.getHeight(context), colorBackground);
    return myBackground;
  }

  //--------------------------------------------------------------------- surround

  Widget getSafeAreaWithPageContent(Stack stack,){

    var statusBarMobile = Colors.transparent; //website not need
    if (DeviceTools.isMobile()) {
      //custome color mobile
      var mobileStatus = statusBarColorCustom;

      //default mobile
      mobileStatus ??= StatusBarConstant.colorBackground;

      //set result
      statusBarMobile = mobileStatus;
    }

    // calcluate statusbar height
    double marginStatusBar = 0;
    if (DeviceTools.isMobile()) {
      marginStatusBar = StatusBarConstant.getHeight(context!);
    }

    //calculate notch bar height
    double marginNotchBar = NotchBarConstant.getHeight(context!);

    //status bar mobile + take all page
    var safeAreaWithPageContent = Container(
      color: statusBarMobile,
      // StatusBarConstant.colorBackground, //statusBarMobile , // HexColor("#D486A8"),  //
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        top: marginStatusBar,
        bottom: marginNotchBar,
      ),
      child: stack,
    );

    return safeAreaWithPageContent;
  }

  /**
   * set "StatusBar"
   */
  Widget _statusBarWithMaterialApp(Widget safeAreaWithPageContent ) {

    //thumbVisibility
    var themeDataScrollbarColored = Theme.of(context!).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all( DSColor.scrollbar_thumb ), //grey_deep
        )
    );

    //material
    var material = MaterialApp(
        title: title!, // "Home",
        debugShowCheckedModeBanner: false,
        theme: themeDataScrollbarColored,
        scrollBehavior:  MyScrollThemeHidden(),
        home: safeAreaWithPageContent
    );
    return material;
  }

  //------------------------------------------------------------------------ chosse page

  Stack _putEveryBarToStack(
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

    var stack = Stack(
      children: [
        //expanded
        // EmptyView.allDeviceScreen(context),

        //set  background (color or image or widgetBackground )
        myBackground,

        //scroll here
        scrollAllPage,

        //progress center
        Align(child: progress, alignment: Alignment.center),

        // floating
        Positioned(child: floatBottom, bottom: 0, left: 0, right: 0),

        //toolbar fixed at top of the view
        toolbar,

        // navigation
        Positioned(child: navigationBottom, bottom: 0, left: 0, right: 0),

        //test
        // Text( "4: " + StatusBarConstant.colorBackground.hexColor )
      ],
    );

    return stack;
  }
}


//-------------------------------------------------------------- scroll glow color


class MyScrollThemeHidden extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return  child;
  }
}
