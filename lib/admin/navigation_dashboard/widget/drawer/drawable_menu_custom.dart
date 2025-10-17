import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/navigate/RouterAdmin.dart';
import 'package:fastor_app_ui_widget/core/navigate/RouterPage.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/cubit/navigation_dashboard_cubit.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/widget/drawer/widget/body_drawer_header.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/widget/drawer/widget/body_drawer_listview.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/widget/drawer/widget/menu_item_tab_widget.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/photo_picker_widget/shape_name/photo_picker_shape_name_widget.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class DrawableMenuCustom  extends Drawer {

  late NavigationDashboardCubit cubit;
  GlobalKey<ScaffoldState> keyDrawerScaffoldState;

  DrawableMenuCustom( this.keyDrawerScaffoldState);

  @override
  Widget build(BuildContext context) {
    cubit = NavigationDashboardCubit.get(context);
    return Directionality(
        textDirection: LangApp.getTextDirection(),
        child: Drawer(
          width:   300.wt,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // 👈 removes corner rounding
          ),
          backgroundColor: AppColor.dialogDialogDismissAreaTypeNormal,
          child:  ListView(
            padding: EdgeInsets.zero,
            children: [

              /// header
              DrawerHeader(
                  decoration: AppDecoration.drawerHeader(),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child:  BodyDrawerHeader(keyDrawerScaffoldState)
              ),


              /// tabs drawer
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.hr  ),
                color: AppColor.drawerBackgroundCard,
                // color: Colors.green,
                height: DeviceTools.getHeight(context),
                child: BodyDrawerListview(keyDrawerScaffoldState),
              )
            ],
          ),

        )
    );
  }
}
