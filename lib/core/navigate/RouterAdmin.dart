import 'package:fastor_app_ui_widget/admin/navigation_dashboard/navigation_dashboard_main_screen.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/navigate/NavigationTools.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/data_source_menu_item.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/menu_tab_entity.dart'; 
import 'package:flutter/material.dart';

class RouterAdmin {


  static void homeDashboard(BuildContext context) {
    var analytics = DataSourceMenuItem.getTabs()[0];
    var nav = NavigationDashboardMainScreen(
      entity: analytics ,
    );
    NavigationTools.pushAndRemoveUntil(context, nav );
  }


  static void navigationToMenuEntity(BuildContext context, MenuTabEntity entity ) {
    Log.i("RouterAdmin - navigationToMenuEntity() - entity: $entity");
    var nav = NavigationDashboardMainScreen(
        entity: entity
    );
    NavigationTools.pushAndRemoveUntilAnimateFade(context, nav );
  }



}