import 'package:fastor_app_ui_widget/admin/shared/responsive_half_form_half_list_admin_panel/cubit/page_selection_cubit.dart';
import 'package:fastor_app_ui_widget/admin/shared/responsive_half_form_half_list_admin_panel/cubit/page_selection_state.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/size/NotchBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/cubit/navigation_dashboard_cubit.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/TitleAppBar.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/project/project_app_bar.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/tap_appbar/tap_appbar.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/card/glass/effect_glass_background_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarNavigationDashboard extends StatelessWidget {


  static double height(BuildContext context ) => 67.h + NotchBarSizeHelper.getTop(context);

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

              /// left
              Padding(
                padding:  EdgeInsetsDirectional.only( start: AppDimension.marginAllScreen   ) ,
                child: blocBuilderPageSelectionChooseShapeButtonLeft( ) ,
              ),

              Padding(padding:  EdgeInsetsDirectional.only( start: 10.w ) , child: tv_title() ,),
            ],
          ),

          // Padding(padding:  EdgeInsetsDirectional.only( end: 20.wt ) , child: buttonIconMenuDrawer( context) ,),
        ],
      ),
    );
  }


  Widget tv_title(){
    return TitleAppBar( title:  title  );
  }

  ///------------------------------------------------------------------ left button

  Widget blocBuilderPageSelectionChooseShapeButtonLeft(){
    return BlocBuilder<PageSelectionDashboardHalfHalfShapeCubit, PageSelectionState>(
        builder:  ( ctx, state ){
          PageSelectionDashboardHalfHalfShapeCubit cubit = PageSelectionDashboardHalfHalfShapeCubit.get(ctx);
          Log.i("blocBuilderPageSelectionChooseShapeButtonLeft() - state: ${cubit.state } ");
          Log.i("blocBuilderPageSelectionChooseShapeButtonLeft() - isFirstPageViewed: ${cubit.isFirstPageViewed(ctx )} ");
          if( cubit.isShapeHalfHalf(ctx) || cubit.isFirstPageViewed(ctx )  ) {
            return buttonIconMenuDrawer(ctx);
          } else {
            return buttonIconBack(ctx);
          }
        }
    );
  }


  Widget buttonIconBack(BuildContext context) {
    return LangApp.rotateIconFromArabicToEnglish(
        child: TapAppbar(
            assetName:  "assets/icons/back_appbar.png",
            iconWidth: 24.h,
            iconHeight: 24.h,
            frameWidth: 44.h,
            frameHeight:  44.h,
            onTap:  ()  {
              PageSelectionDashboardHalfHalfShapeCubit.get(context).onBackClicked(context);
            }
        )
    );
  }


  Widget buttonIconMenuDrawer(BuildContext context) {
    return TapAppbar(
      assetName:  "assets/icons/menu.png",
      iconWidth: 24.h,
      iconHeight: 24.h,
      frameWidth: 44.h,
      frameHeight:  44.h,
      colorIcon: AppColors.iconAppbarColor,

      onTap:  () => cubit.drawerOpen( keyDrawerScaffoldState ),
    );
  }



}