
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/size/NotchBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/core/size/StatusBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/simple/AppBarSimple.dart';
import 'package:fastor_app_ui_widget/customWidget/scrollview/ScrollApp.dart';
import 'package:flutter/material.dart';

class ScaffoldApp extends StatelessWidget {
  Color? statusBarColorIOSDevice;

  bool isNeedAppBarCustom = false;
  bool isNoAppBarNormalOrAppBarCustomFound = false;

  Widget body;
  bool? putBodyInsideScroll;
  bool? putBodyInsideSafeArea;
  BuildContext? context;
  ScrollController? scrollController;
  GlobalKey<ScaffoldState>? keyDrawer;
  Drawer? drawer;
  DrawerCallback? onDrawerChanged;
  String? titleAppbar;
  final PreferredSizeWidget? appBar;
  Widget? appBarCustom;
  double? appBarCustomHeight;
  bool? isShowBackButtonAppBar;
  final Widget? floatingActionButton;
  final bool? makeStatusBarTransparent;
  FloatingActionButtonLocation? floatingActionButtonLocation;

  Color? backgroundColor;
  Widget?
  widgetBackground; //make widget to set as fixed background while scrolling moving

  //transparent
  bool? shapeTransparent;
  Color? shapeTransparentColor;
  Widget? bottomSheet;

  ScaffoldApp(
      {super.key,
        required this.body,
        this.putBodyInsideSafeArea = false,
        this.putBodyInsideScroll = false,
        this.backgroundColor,
        this.floatingActionButton,
        this.titleAppbar,
        this.appBar,
        this.appBarCustom,
        this.appBarCustomHeight,
        this.widgetBackground,
        this.isShowBackButtonAppBar,
        this.scrollController,
        this.keyDrawer,
        this.drawer,
        this.onDrawerChanged,
        this.makeStatusBarTransparent,
        this.floatingActionButtonLocation,

        // status bar
        this.statusBarColorIOSDevice,

        //transparent
        this.shapeTransparent = false,
        this.shapeTransparentColor,
        this.bottomSheet}) {
    _setDefaultValues();
  }

  _setDefaultValues() {
    backgroundColor ??= Colors.white;

    statusBarColorIOSDevice ??= statusBarColorBackgroundBlackSecond;

    isNeedAppBarCustom = appBarCustom != null  || titleAppbar != null;
    if (isNeedAppBarCustom) {
      appBarCustomHeight ??= AppBarSimple.frameHeight;
    }

    putBodyInsideSafeArea ??= false;

    fixUserEnterManyTypesOfAppBarAtSameTime();

    isNoAppBarNormalOrAppBarCustomFound =   appBar  == null &&  appBarCustom == null && titleAppbar == null ;
  }

  fixUserEnterManyTypesOfAppBarAtSameTime(){
    if( isNeedAppBarCustom  && appBar != null ) {
      appBarCustomHeight = null;
      appBarCustom = null;
      isNeedAppBarCustom = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return scaffoldContent(context);
  }


  Widget scaffoldContent(context) {
    return Scaffold(
      // backgroundColor: shapeTransparent! ? Colors.transparent : statusBarColorIOSDevice,
      backgroundColor: shapeTransparent! ? Colors.transparent : backgroundColor,
      key: keyDrawer,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body:  bodyChooseInsideSafeAreaOrNotAndChangeDirectionArabicEnglish(),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomSheet: bottomSheet,
    );
  }


  Widget bodyChooseInsideSafeAreaOrNotAndChangeDirectionArabicEnglish() {
    return Directionality(
      textDirection: LangApp.getTextDirection(),
      child: putBodyInsideSafeArea!
          ? Container(
        margin: EdgeInsets.only(
          top: isNoAppBarNormalOrAppBarCustomFound ? NotchBarSizeHelper.getTop(context!) : 0 ,
          bottom: NotchBarSizeHelper.getBottom(context!),
        ),
        child: bodyScaffold(context),
      )
          : bodyScaffold(context),
    );
  }

  Widget bodyScaffold(context) {
    // print("bodyScaffold() - appBarCustomHeight: $appBarCustomHeight /isNeedAppBarCustom: $isNeedAppBarCustom");
    return Stack(
      children: [

        /// set frame size
        SizedBox(
          width: DeviceTools.getWidth(context),
          height: DeviceTools.getHeight(context),
        ),

        /// set background
        if (isNormalBackground()) _decorationBackgroundCustom(),
        if (shapeTransparent!) _SizeBoxBackgroundShapeDialogTransparent(),

        /// body
        Container(
          margin: getMarginTopToMakeBodyContentUnderAppBarCustom(context), //
          child: chooseBodyPutInsideScrollONot(),
        ),

        /// app bar
        chooseShowAppBar(),
      ],
    );
  }


  EdgeInsets? getMarginTopToMakeBodyContentUnderAppBarCustom(context){
    if( isNeedAppBarCustom == false  ) return null;
    return EdgeInsets.only(     top: (appBarCustomHeight  ?? 0)  + NotchBarSizeHelper.getTop(context) );
  }


  //-------------------------------------------------------- background

  bool isNormalBackground() {
    return shapeTransparent == false;
  }

  Widget _decorationBackgroundCustom() {
    double notchHeight = MediaQuery.of(context!).viewPadding.bottom;
    double statusBar = StatusBarSizeHelper.getHeight(context!);

    if (putBodyInsideSafeArea!) {
      return Container(
          child: widgetBackground,
          color: backgroundColor,
          width: DeviceTools.getWidth(context!),
          height: DeviceTools.getHeight(context!) - notchHeight - statusBar);
    } else {
      return Container(
          child: widgetBackground,
          color: backgroundColor,
          width: DeviceTools.getWidth(context!),
          height: DeviceTools.getHeight(context!));
    }
  }

  Widget _SizeBoxBackgroundShapeDialogTransparent() {
    double notchHeight = MediaQuery.of(context!).viewPadding.bottom;
    double statusBar = StatusBarSizeHelper.getHeight(context!);
    double minesSafeArea = notchHeight + statusBar;
    if (putBodyInsideSafeArea! == false) {
      minesSafeArea = 0;
    }

    shapeTransparentColor ??= Colors.black.withOpacity(0.5);

    var dismissBackgroundColoredAllScreen = Container(
      width: DeviceTools.getWidth(context!),
      height: DeviceTools.getHeight(context!) - minesSafeArea,
      color: shapeTransparentColor,
      child: widgetBackground,
    );

    return GestureDetector(
      onTap: () {
        // Log.i("backgroundClickAnySpaceAreaToDismiss() - click");
        Navigator.pop(context!);
      },
      child: dismissBackgroundColoredAllScreen,
    );
  }

  Widget chooseBodyPutInsideScrollONot() {
    if (putBodyInsideScroll!) {
      return scrollTheChildContent();
    } else {
      return body;
    }
  }

  //-------------------------------------------------------- body

  Widget scrollTheChildContent() {
    return ScrollApp(
      scrollController: scrollController,
      child: body,
    );
  }

  //-------------------------------------------------------- app bar

  Widget chooseShowAppBar() {

    /// case not need
    if(isNeedAppBarCustom == false ) return SizedBox();

    /// case found normal appBar material app, skip use custom
    if( appBar != null ) return SizedBox();

    ///case custom
    if (appBarCustom != null) {
      return appBarCustom!;
    }

    ///validate not need
    bool notNeedBackAppBarAndNotHaveTitle =
        isShowBackButtonAppBar == null && titleAppbar == null;
    if (notNeedBackAppBarAndNotHaveTitle) return const SizedBox();

    /// set default back
    isShowBackButtonAppBar ??= true;
    bool isHideBack = isShowBackButtonAppBar == false;

    ///case transparent
    return AppBarSimple(
      context!,
      titleAppbar ?? "",
      hideBackButton: isHideBack,
    );
    // return Text("app customer test", style: TextStyle(color: Colors.blue),);
  }


}