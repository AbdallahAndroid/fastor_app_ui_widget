 
import 'package:fastor_app_ui_widget/core/navigate/RouterAdmin.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/cubit/navigation_dashboard_cubit.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/cubit/navigation_dashboard_state.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/menu_tab_entity.dart';
import 'package:fastor_app_ui_widget/customWidget/scaffold/ScaffoldApp.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/widget/drawer/drawable_menu_custom.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/menu_tab_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/appbar/appbar_navigation_dashboard.dart';



class NavigationDashboardMainScreen extends StatefulWidget {

  // Widget childPage;
  // String title;
  // int? indexTabChangeColor;

  MenuTabEntity entity;

  NavigationDashboardMainScreen( {
    required this.entity,
  });

  @override
  NavigationDashboardMainState createState() => NavigationDashboardMainState();
}

class NavigationDashboardMainState extends State<NavigationDashboardMainScreen>{

  GlobalKey<ScaffoldState> keyDrawerScaffoldState = GlobalKey<ScaffoldState>();


  late NavigationDashboardCubit cubit;

  @override
  void initState() {
    cubit = NavigationDashboardCubit.get(context);
    cubit.initCurrentPage( widget.entity);
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationDashboardCubit, NavigationDashboardState>(
      listener: (ctx, state ){
        if( state is UpdateSelectedPageState ) {
          cubit.initState();
          RouterAdmin.navigationToMenuEntity( ctx , state.entity);
        }
      },
        builder: (ctx, state ){
          cubit = NavigationDashboardCubit.get(ctx);
        return ScaffoldApp(

           /// app bar
            appBarCustom: AppbarNavigationDashboard(
              pageContext: context,
              title: widget.entity.title,
                keyDrawerScaffoldState: keyDrawerScaffoldState,
            ),

            /// drawer
            keyDrawer:  keyDrawerScaffoldState,
            drawer: DrawableMenuCustom(keyDrawerScaffoldState),

            /// body
            putBodyInsideSafeArea: true ,
            body: widget.entity.page,

        );
    });
  }
}