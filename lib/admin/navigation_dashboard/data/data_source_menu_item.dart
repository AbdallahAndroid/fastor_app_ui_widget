import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/menu_tab_entity.dart';
import 'package:flutter/cupertino.dart';

class DataSourceMenuItem {


  static List<MenuTabEntity> getTabs( ) {
    int counterIndex = 0;
    return [
      MenuTabEntity(
        index: counterIndex++,
        title: 'Analytics'.tr(),
        icon: CupertinoIcons.chart_bar_alt_fill,
        page:  Container( child: Text("test page Analytics"),),
      ),
      MenuTabEntity(
        index: counterIndex++,
        title: 'Users'.tr(),
        icon: CupertinoIcons.person_2_fill,
        page:  Container( child: Text("test page Users"),),
      ),
      MenuTabEntity(
        index: counterIndex++,
        title: 'Employees'.tr(),
        icon: CupertinoIcons.person_crop_rectangle,
        page:  Container( child: Text("test page Employees"),),
      ),
    ];
  }

}