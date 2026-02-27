import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/data/enum_navigation_screen_shape.dart';
import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/data/enum_menu_tab.dart';
import 'package:flutter/cupertino.dart';

class MenuTabEntity {
  int index;
  String title;
  IconData icon;
  Widget page;
  EnumMenuTab enumMenuTab;
  NavigationScreenShape shape;
  bool? isVisibleDrawerMenu ;

  @override
  String toString() {
    return 'MenuTabEntity{enumMenuTab: $enumMenuTab, index: $index, title: $title, icon: $icon, page: $page}';
  }

  MenuTabEntity({
    required this.index,
    required this.title,
    required this.icon,
    required this.page,
    required this.enumMenuTab,
    required this.shape,
    this.isVisibleDrawerMenu = true ,
  });

}

