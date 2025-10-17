
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/data/menu_tab_entity.dart';
import 'package:fastor_app_ui_widget/core/utils/timer/ToolsWait.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_dashboard_state.dart';

typedef DrawerCallbackComplete = Function();

class NavigationDashboardCubit extends Cubit<NavigationDashboardState> {


  late MenuTabEntity currentEntity;
  DrawerCallbackComplete? onTapMenuPendingAction;

  NavigationDashboardCubit() : super(NavigationDashboardInitialState());


  static NavigationDashboardCubit get(BuildContext context ) {
    return BlocProvider.of<NavigationDashboardCubit>(context);
  }


  void initState() {
    emit(  NavigationDashboardInitialState() );
  }


  void initCurrentPage(MenuTabEntity current) {
    currentEntity = current;
  }


  void drawerOpen(  GlobalKey<ScaffoldState> keyDrawerScaffoldState){
    Log.i("drawerOpen() - click");
    if( LangApp.isArabic ){
      keyDrawerScaffoldState.currentState?.openEndDrawer();
    } else {
      keyDrawerScaffoldState.currentState?.openDrawer();
    }
  }


  dismissDrawer({required MenuTabEntity entity,   required GlobalKey<ScaffoldState> keyDrawerScaffoldState})     {

    /// close by lang
    if( LangApp.isArabic ){
      keyDrawerScaffoldState.currentState?.closeEndDrawer();
    } else {
      keyDrawerScaffoldState.currentState?.closeDrawer();
    }

    /// validate already opened
    if( entity.index == currentEntity.index ) {
      Log.i("dismissDrawer() - already opened - stop");
      return;
    }

    Log.i("dismissDrawer() - start");
    ToolsWait.waitToDo(1000, (){
      Log.i("dismissDrawer() - end");
      emit(  UpdateSelectedPageState(entity) );
    } );
  }


}