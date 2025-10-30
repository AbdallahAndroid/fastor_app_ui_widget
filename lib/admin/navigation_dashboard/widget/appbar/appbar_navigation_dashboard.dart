import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/cubit/navigation_dashboard_cubit.dart';
import 'package:fastor_app_ui_widget/core/utils/size/NotchBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/TitleAppBar.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/tap_appbar/tap_appbar.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/card/glass/effect_glass_background_card.dart';
import 'package:flutter/material.dart';

class AppbarNavigationDashboard extends StatelessWidget {


  static double height(BuildContext context ) => Figma.h(67) + NotchBarSizeHelper.getTop(context);

  late NavigationDashboardCubit cubit;

  GlobalKey<ScaffoldState> keyDrawerScaffoldState;
  BuildContext pageContext;
  String title;

  AppbarNavigationDashboard({
    required this.pageContext,
    required this.title,
    required this.keyDrawerScaffoldState
});


  @override
  Widget build(BuildContext context) {
    cubit = NavigationDashboardCubit.get(context);
    return   Directionality(
      textDirection:   LangApp.getTextDirection(),
      child: contentUIUnderNotchHeight(context ),
    );
  }


  Widget contentUIUnderNotchHeight(BuildContext context ){
    return Container(
      alignment: LangApp.getAlignmentGeometryStartCenter(),
      padding: EdgeInsets.only(top:  NotchBarSizeHelper.getTop( context)),
      color: AppColors.appBarBackground,
      height:   AppbarNavigationDashboard.height(context),
      width: DeviceTools.getWidth(context),
      // child:  stackContent(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(padding:  EdgeInsetsDirectional.only( start: 20.w  ) , child: buttonIconMenuDrawer(context) ,),

              Padding(padding:  EdgeInsetsDirectional.only( start: 10.w ) , child: tv_title() ,),
            ],
          ),

          // Padding(padding:  EdgeInsetsDirectional.only( end: 20.w ) , child: buttonIconMenuDrawer( context) ,),
        ],
      ),
    );
  }


  Widget tv_title(){
    return TitleAppBar( title:  title  );
  }


  Widget buttonIconMenuDrawer(BuildContext context) {
    return TapAppbar(
      assetName:  "assets/icons/menu.png",
      iconWidth: DeviceTools.isLandscape(context) ? 20.w : 24.w,
      iconHeight: DeviceTools.isLandscape(context) ? 20.w : 24.w ,
      frameWidth: AppDimension.tapAppBarHeight(),
      frameHeight:  AppDimension.tapAppBarHeight(),
      colorIcon: AppColors.iconAppbarColor,

      onTap:  () => cubit.drawerOpen( keyDrawerScaffoldState ),
    );
  }


}