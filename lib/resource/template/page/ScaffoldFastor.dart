

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

class ScaffoldFastor extends StatelessWidget {
  static const tag = "ScaffoldFastor";

  //required
  State? stateFullWidget; //write "this" inside any class type "StateFullWidget"
  Widget body;
  BuildContext? context;

  //page info
  String? title; //page title show when app be at recent apps in android,
  //page title show at tab of new page in "Web"

  //background
  AssetImage?
  assetBackground; //image set to background of page pages "AssetImage"
  double? assetBackgroundOpacity;
  Color? colorBackground;
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
  GlobalKey? scaffoldKey;
  Widget? drawer;
  DrawerCallback? onDrawerChanged;

  //scroll
  ScrollController? scrollController;
  bool? isPlaceBodyInsideScroll;
  bool? isStopScroll;
  bool? thumbVisibility;

  //keybaord
  bool? resizeToAvoidBottomInset;


  ScaffoldFastor(
      {
        required Widget this.body,
        this.isPlaceBodyInsideScroll ,
        this.stateFullWidget,
        this.title = "",
        this.assetBackground,
        this.assetBackgroundOpacity,
        this.colorBackground,
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
    if(stateFullWidget != null ) {
      FastorStateManagement.instance().addState(stateFullWidget!);
    }
    
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

    //isPlaceBodyInsideScroll
    if( scrollController != null ) {
      isPlaceBodyInsideScroll = true;
    }
    isPlaceBodyInsideScroll ??= false;

  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    //background (color or image )
    var myBackground = _getBackground( context, colorBackground,
        assetBackground, assetBackgroundOpacity, widgetBackground);


    // choose stack of page mobile app
    Stack stack = _putEveryBarToStack(
        myBackground,
        chooseScrollContentOrContentWithoutScroll(),
        floatBottom!,
        navigationBottom!,
        navigationBottom_height,
        toolbar!,
        onChangeProgressState);

    //
    var pageStack = _statusBar(stack, title, statusBarColorCustom);

    //scaffold
    var scaffold = Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,

        //
        body: pageStack,

        //drawer menu
        key: scaffoldKey,
        drawer: drawer,
        onDrawerChanged: onDrawerChanged);

    var theme = _getHomeButtonTheme(homeButtonsBackgroundColor, scaffold);

    //language dirction
    return Directionality(
      //textDirection: TextDirection.rtl,
      textDirection: LanguageTools.getTextDirection(context),
      child: theme,
    );
  }

  //------------------------------------------------  scroll content or content without scroll

  Widget chooseScrollContentOrContentWithoutScroll(){
    //scroll all page
    if( isPlaceBodyInsideScroll! ) {
      return scrollAllContent();
    } else {
      return contentWithoutScroll();
    }
  }


  Widget scrollAllContent(){
    return ScrollViewPage.t( context!, body,
        scrollController: scrollController,
        toolbarHeight: toolbar_height,
        footer_height: navigationBottom_height,
        isStopScroll: isStopScroll,
        thumbVisibility: thumbVisibility
    );
  }

  Widget contentWithoutScroll(){

    //default
    toolbar_height ??= 0;
    footer_height = navigationBottom_height;
    footer_height ??= 0;


    // fix toolbar + navigation
    var tallView = Column( children: [
      EmptyView.empty( toolbar_height!   , toolbar_height!  ),
      body,
      EmptyView.empty( footer_height!  , footer_height!   )
    ]);
    return tallView;
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

  /**
   * set "StatusBar"
   */
  Widget _statusBar(Stack stack, String? title, Color? statusBarColorCustome) {
    //
    var statusBarMobile = Colors.transparent; //website not need
    if (DeviceTools.isMobile()) {
      //custome color mobile
      var mobileStatus = statusBarColorCustome;

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
    var statusBar = Container(
      color: statusBarMobile,
      // StatusBarConstant.colorBackground, //statusBarMobile , // HexColor("#D486A8"),  //
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        top: marginStatusBar,
        bottom: marginNotchBar,
      ),
      child: stack,
    );

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
        home: statusBar);
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

    var stack = Stack(
      children: [

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
      ],
    );

    return stack;
  }
}

