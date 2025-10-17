
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/data_source_menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/widget/drawer/widget/menu_item_tab.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/photo_picker_widget/shape_name/photo_picker_shape_name_widget.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


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
    var entities = DataSourceMenuItem.getTabs( );
    entities.forEach( (entity ) {

      var widgetMenu =  MenuItemTabWidget(
        title:  entity.title, //'Analytics'.tr(),
        iconLeft: entity.icon, // Icons.home ,
        onTap: (){
          cubit.dismissDrawer( entity: entity , keyDrawerScaffoldState: keyDrawerScaffoldState);
        },
      );

      ls.add( widgetMenu);

    } );
    return ls;
  }
}