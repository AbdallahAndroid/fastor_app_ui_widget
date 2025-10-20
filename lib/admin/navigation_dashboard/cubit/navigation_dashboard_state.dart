

import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/menu_tab_entity.dart';

abstract class NavigationDashboardState {}

class NavigationDashboardInitialState extends NavigationDashboardState {}

class UpdateSelectedPageState extends NavigationDashboardState {
  // final int selectedIndex;
  MenuTabEntity entity;
  UpdateSelectedPageState(this.entity);
}

// class DrawerCloseCompletedState extends NavigationDashboardState {}