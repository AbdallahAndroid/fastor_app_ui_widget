import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/data/enum_navigation_screen_shape.dart';
import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/data/enum_menu_tab.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/admin/shared/navigation_dashboard/data/menu_tab_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataSourceMenuItem {

  static  MenuTabEntity  searchByKey( EnumMenuTab searchType  ) {
    var list = getTabs();
    for( int i = 0 ; i < list.length ; i++ ) {
      var item = list[i];
      if( item.enumMenuTab == searchType ) return item;
    }

    /// default first
    return getTabs()[0];
  }

  static List<MenuTabEntity> getTabsDrawerMenu( ) {
    var list = getTabs();
    return list.where((element) => element.isVisibleDrawerMenu == true ).toList();
  }

  /**
   * 1- By Permission
   * 2- by visibility drawer menu
   */
  static List<MenuTabEntity> getTabs( ) {
    int counterIndex = 0;
    List<MenuTabEntity> ls  = [];
    //
    // ///+++++++++++++++++++++++ section: users
    //
    // if( UserPermissionHelper.isPageAllowedEmployeeManager() ) {
    //   ls.add( MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.customer,
    //     index: counterIndex++,
    //     title: 'Customers'.tr(),
    //     icon: CupertinoIcons.person_2_fill,
    //     page:  UsersManageScreen( EnumAdminPanelUsersOpenBy.customers),
    //     shape: NavigationScreenShape.halfHalf,
    //   ));
    // }
    //
    // if( UserPermissionHelper.isPageAllowedEmployeeManager() ) {
    //   ls.add(      MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.employee,
    //     index: counterIndex++,
    //     title: 'Employees'.tr(),
    //     icon: CupertinoIcons.person_crop_rectangle,
    //     shape: NavigationScreenShape.halfHalf,
    //     page:  UsersManageScreen(EnumAdminPanelUsersOpenBy.employees),
    //   ),);
    // }
    //
    // ///+++++++++++++++++++++++ section: realestate
    //
    // if( UserPermissionHelper.isPageAllowedRealestateManager() ) {
    //   ls.add( MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.realestate,
    //     index: counterIndex++,
    //     title: 'Real Estate'.ar( "العقارات"),
    //     icon: CupertinoIcons.home,
    //     shape: NavigationScreenShape.halfHalf,
    //     page:  RealestateManageScreen(  ),
    //   ));
    // }
    // if( UserPermissionHelper.isPageAllowedRealestateManager() ) {
    //   ls.add( MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.realestateAds,
    //     index: counterIndex++,
    //     title: "Ads With Realestate".ar( "إعلانات داخل العقارات"),
    //     icon: CupertinoIcons.arrow_down_right_arrow_up_left,
    //     shape: NavigationScreenShape.halfHalf,
    //     page:  RealestateAdsManageScreen(  ),
    //   ));
    // }
    //
    // ///+++++++++++++++++++++++ section: service
    //
    //   if( UserPermissionHelper.isPageAllowedServiceManager() ) {
    //     ls.add( MenuTabEntity(
    //       enumMenuTab: EnumMenuTab.service,
    //       index: counterIndex++,
    //       title: 'Services'.ar("بيانات الخدمات"),
    //       icon: Icons.miscellaneous_services,
    //       shape: NavigationScreenShape.halfHalf,
    //       page:  ServiceInfoManageScreen(  ),
    //     ));
    //   }
    //
    // if( UserPermissionHelper.isPageAllowedServiceManager() ) {
    //   ls.add( MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.serviceProvider,
    //     index: counterIndex++,
    //     title: 'Services Provider'.ar("مقدمي الخدمات"),
    //     icon: Icons.man,
    //     shape: NavigationScreenShape.halfHalf,
    //     page:  UsersManageScreen( EnumAdminPanelUsersOpenBy.serviceProvider),
    //   ));
    // }
    //
    //
    // if( UserPermissionHelper.isPageAllowedServiceManager() ) {
    //   ls.add( MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.serviceProviderAssigned,
    //     index: counterIndex++,
    //     title: 'Assign Services to Provider'.ar("تعيين خدمات لمقدم الخدمة"),
    //     icon: Icons.man,
    //     shape: NavigationScreenShape.singlePage,
    //       isVisibleDrawerMenu: false,
    //     page:  ServiceAssignerManageScreen( ),
    //   ));
    // }
    //
    //
    // if( UserPermissionHelper.isPageAllowedServiceManager() ) {
    //   ls.add( MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.serviceRequest,
    //     index: counterIndex++,
    //     title: 'Services Request'.ar("طلبات الخدمات"),
    //     icon: Icons.design_services_sharp,
    //     shape: NavigationScreenShape.halfHalf,
    //     page:  ServiceInfoManageScreen(  ),
    //   ));
    // }
    //
    // ///+++++++++++++++++++++++ section: setting
    //
    // if( UserPermissionHelper.isPageSettingAllowed() ) {
    //   ls.add( MenuTabEntity(
    //     enumMenuTab: EnumMenuTab.setting,
    //     index: counterIndex++,
    //     title: 'Setting'.ar("الإعدادات"),
    //     icon: CupertinoIcons.settings,
    //     page:  SettingManageScreen(  ),
    //     shape: NavigationScreenShape.singlePage,
    //   ));
    // }
    return ls;
  }
}