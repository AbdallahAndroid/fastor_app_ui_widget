
import 'package:flutter/material.dart';


class ScaffoldFastor  extends StatelessWidget {

  Widget body;
  bool? putBodyInsideScroll;
  BuildContext? context;
  ScrollController? scrollController;
  GlobalKey<ScaffoldState>? keyDrawer;
  Drawer? drawer;
  DrawerCallback? onDrawerChanged;
  String? titleAppbar;
  final PreferredSizeWidget? appBar;
  Widget? appBarCustom;
  bool? isShowBackButtonAppBar;
  final Widget? floatingActionButton;
  final bool? makeStatusBarTransparent;
  FloatingActionButtonLocation? floatingActionButtonLocation;

  Color? backgroundColor;
  Widget? widgetBackground; //make widget to set as fixed background while scrolling moving

  //transparent
  bool? shapeTransparent;
  Color? shapeTransparentColor;

  ScaffoldFastor({
    super.key,
    required this.body,
    this.putBodyInsideScroll = false ,
    this.backgroundColor,
    this.floatingActionButton,
    this.titleAppbar,
    this.appBar,
    this.appBarCustom,
    this.widgetBackground,
    this.isShowBackButtonAppBar,
    this.scrollController,
    this.keyDrawer,
    this.drawer,
    this.onDrawerChanged,
    this.makeStatusBarTransparent,
    this.floatingActionButtonLocation,

    //transparent
    this.shapeTransparent = false ,
    this.shapeTransparentColor,
  }) {


  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return scaffoldContent(context);
  }

  Widget scaffoldContent(context) {
    return Scaffold(
        backgroundColor: shapeTransparent!? Colors.transparent : backgroundColor,
        key: keyDrawer,
        drawer: drawer,
        onDrawerChanged: onDrawerChanged,
        floatingActionButton: floatingActionButton,
        appBar: appBar,
        body: Directionality(
          textDirection: LangFastor.getTextDirection(),
          child: SafeArea(
            child: scaffoldBody(context),
          ),
        ),
        resizeToAvoidBottomInset: true,
        floatingActionButtonLocation: floatingActionButtonLocation
    );
  }

  Widget scaffoldBody(context) {
    return Stack(
      children: [
        if( isNormalBackground() ) _decorationBackgroundCustom(),
        if( shapeTransparent! ) _SizeBoxBackgroundShapeDialogTransparent(),
        chooseBodyPutInsideScrollONot(),
        chooseShowAppBar(),
      ],
    );
  }

  //-------------------------------------------------------- background

  bool isNormalBackground(){
    return shapeTransparent == false  ;
  }

  Widget _decorationBackgroundCustom() {
    double notchHeight = MediaQuery.of(context!).viewPadding.bottom;
    double statusBar = StatusBarConstant.getHeight(context!);

    return Container(
        child: widgetBackground,
        width: DeviceTools.getWidth(context!),
        height: DeviceTools.getHeight(context!) - notchHeight - statusBar
    );
  }

  Widget _SizeBoxBackgroundShapeDialogTransparent(){
    double notchHeight = MediaQuery.of(context!).viewPadding.bottom;
    double statusBar = StatusBarConstant.getHeight(context!);

    shapeTransparentColor ??= Colors.black.withOpacity( 0.5 );

    var dismissBackgroundColoredAllScreen =  Container(
      width: DeviceTools.getWidth(context!),
      height: DeviceTools.getHeight(context!) - notchHeight - statusBar,
      color: shapeTransparentColor,
      child: widgetBackground,
    );

    return GestureDetector(
      onTap: (){
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
    return ScrollFastor(
      scrollController: scrollController,
      child: body,
    );
  }

  //-------------------------------------------------------- app bar

  Widget chooseShowAppBar() {
    ///case custom
    if (appBarCustom != null) {
      return appBarCustom!;
    }

    ///validate not need
    bool notNeedBackAppBarAndNotHaveTitle = isShowBackButtonAppBar == null &&
        titleAppbar == null;
    if (notNeedBackAppBarAndNotHaveTitle) return const SizedBox();

    /// set default back
    isShowBackButtonAppBar ??=  true;
    bool isHideBack = isShowBackButtonAppBar == false ;
    ///case transparent
    return ToolbarSimpleFastor( context!,  titleAppbar ?? "", hideBackButton: isHideBack ,);
  }
}
