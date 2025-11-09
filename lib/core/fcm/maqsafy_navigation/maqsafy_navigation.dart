
import 'package:fastor_app_ui_widget/core/cache/SaveApp.dart';
import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/FCMRegister.dart';
import 'package:fastor_app_ui_widget/core/network/parse/ApiParserApp.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';


/// see Readme file in section ( #  Notification scenarios when to send and how to handle  )
void whatToFoAfterClickOnNotification(Map<String, dynamic>? json) {
  ///validate not context page
  if (contextFcm == null) {
    contextFcm = GlobalApp.getContexts();
    if (contextFcm == null) {
      Log.i(
          "fcm - fastor_app_ui_widgetWhatToFoAfterClickOnNotification() - context == null - stop");
    }
    return;
  }

  /// init values for get from cache
  SaveApp.init();

  /// validate null
  if (json == null) {
    // AppNavigator.navigateTo(contextFcm!, RouterKeys.notification_screen);
    return;
  }

  /// get data
  int userPanelIdNotification = makeInt(json?["user_panel"]);
  int userId = makeInt(json["user_id"]);
  String action = makeString(json["action"]);
  int objectId = makeInt(json["object_id"]);
  Log.i("fcm - fastor_app_ui_widgetWhatToFoAfterClickOnNotification() - action: $action /user_panel_id_notification: $userPanelIdNotification /user_id: $userId /objectId: $objectId");
  //
  // /// validate  case guest
  // if (UserHelper.isGuestNoWait()) {
  //   AppNavigator.pushAndReplacement(
  //       contextFcm!, RouterKeys.notification_screen);
  //   return;
  // }
  //
  // /// validate if user-id not match
  // if (UserHelper.getUserId() != userId.toString()) {
  //   Log.i("fcm - fastor_app_ui_widgetWhatToFoAfterClickOnNotification() -  not mach userid");
  //   AppNavigator.navigateTo(contextFcm!, RouterKeys.notification_screen);
  //   return;
  // }
  //
  // /// validate if user-panel found in cache >> some times backend send user-panel not exist in cache"
  // /// convert user_panel in cache when user click on notification,
  // ///  where userpanel is diferrence
  // UserPanelModel? userPanelModelNotification;
  // if (UserHelper.getUserPanelId() != userPanelIdNotification.toString()) {
  //   userPanelModelNotification = UserPanelMapper.searchInCacheForUserPanelId(
  //       userPanelIdNotification.toString());
  //   if (userPanelModelNotification != null) {
  //     UserHelper.switchUserPanel(userPanelModelNotification);
  //     Log.i(
  //         "fcm - fastor_app_ui_widgetWhatToFoAfterClickOnNotification() - is valid to be (isValidForSwitchUserPanel)");
  //   }
  }

  /// open home before specific screen
  // AppNavigator.pushAndReplacement(contextFcm!, RouterKeys.main_home);
  // ToolsWait.waitToDo(1000,  (){
  //   Log.i("fcm - fastor_app_ui_widgetWhatToFoAfterClickOnNotification() - timer end to open switch screen" );
  //  _chooseSwitchPage(action, objectId );
  // });
  // _chooseSwitchPage(action, objectId);
  // }

//
// _openOrderDetail(String action, int objectId) {
//   AppNavigator.navigateToOrderDetails(contextFcm!, objectId, "pending",
//       onChangeStatus: (a, b) {});
// }
