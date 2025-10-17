import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/menu_tab_entity.dart';
import 'package:flutter/cupertino.dart';

class DataSourceMenuItem {


  static List<MenuTabEntity> getTabs( ) {
    return [
      MenuTabEntity(
        index: 0,
        title: 'Analytics'.tr(),
        icon: CupertinoIcons.chart_bar_alt_fill,
        page:  Container( child: Text("test page"),),
      ),
      // MenuTabEntity(
      //   index: 1,
      //   title: 'Users'.tr(),
      //   icon: CupertinoIcons.person_2_fill,
      //   page:  UsersListScreen( EnumUsersOpenBy.customers),
      // ),
      // MenuTabEntity(
      //   index: 2,
      //   title: 'Employees'.tr(),
      //   icon: CupertinoIcons.person_crop_rectangle,
      //   page:  UsersListScreen(EnumUsersOpenBy.employees),
      // ),
    ];
  }
}