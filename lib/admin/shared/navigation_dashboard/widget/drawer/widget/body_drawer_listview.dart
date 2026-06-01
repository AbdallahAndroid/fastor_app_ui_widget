
import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/data/data_source_menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/cubit/navigation_dashboard_cubit.dart';
import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/widget/drawer/widget/menu_item_tab_widget.dart';


class BodyDrawerListview extends StatelessWidget {


  late NavigationDashboardCubit cubit;


  GlobalKey<ScaffoldState> keyDrawerScaffoldState;

  BodyDrawerListview( this.keyDrawerScaffoldState);


  @override
  Widget build(BuildContext context) {
    cubit = NavigationDashboardCubit.get(context);


    return  Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: getChildrenMenuItems(),
    );
  }


/**
    MenuItemTab(
    title:  'Analytics'.tr(),
    iconLeft: Icons.home ,
    onTap: (){
    cubit.dismissDrawer( index: 0 , keyDrawerScaffoldState: keyDrawerScaffoldState);
    },
    ),
 */
  List<Widget> getChildrenMenuItems(){
    List<Widget> ls = [];
    var entities = DataSourceMenuItem.getTabsDrawerMenu( );
    entities.forEach( (entity ) {

      var widgetMenu =  MenuItemTabWidget(
        title:  entity.title,
        iconLeft: entity.icon,
        isSelected: cubit.currentEntity.index == entity.index,
        onTap: (){
          cubit.dismissDrawer( entity: entity , keyDrawerScaffoldState: keyDrawerScaffoldState);
        },
      );

      ls.add( widgetMenu);

    } );
    return ls;
  }
}