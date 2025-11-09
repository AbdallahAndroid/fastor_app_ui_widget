import 'package:fastor_app_ui_widget/core/fcm/abdo/click_on_notification/converter_base64_payload_helper.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/click_on_notification/pending_payload_founder.dart';
import 'package:fastor_app_ui_widget/core/fcm/maqsafy_navigation/maqsafy_navigation.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

import '../FCMRegister.dart';

clickNotificationHappened(String? base64Payload) {
  Log.i("fcm - clickNotificationHappened() - base64Payload found data ");

  //validate not found payload
  if (base64Payload == null) {
    Log.i("fcm - clickNotificationHappened() - base64Payload == null - stop !");
    return;
  }

  //clear for next
  notificationPayloadBase64 = null; //clear data for next time

  //validate not context page
  if (contextFcm == null) {
    contextFcm = GlobalApp.getContexts();
    if (contextFcm == null) {
      Log.i(
          "fcm - clickNotificationHappened() - context == null and global also context null - stop");
    }
    return;
  }

  payloadJsonPending =
      ConverterBase64PayloadHelper.parseBase64ToJson(base64Payload);

  /// check
  if (lastMessageFcmReceived == null) {
    Log.i(
        "fcm - clickNotificationHappened() -  lastMessageFcmReceived == null - stop !");
    return;
  }

  /// type of notification received
  Log.i(
      "fcm - clickNotificationHappened() - lastMessageFcmReceived: $lastMessageFcmReceived");
  if (lastMessageFcmReceived!.receivedStateTypeForGround ||
      lastMessageFcmReceived!.receivedStateTypeTerminated) {
    whatToFoAfterClickOnNotification(payloadJsonPending);
    clearPendingPayloadAfterUse();
  }
}
