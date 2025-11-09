import 'package:fastor_app_ui_widget/core/fcm/maqsafy_navigation/maqsafy_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/FCMRegister.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/click_on_notification/converter_base64_payload_helper.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/click_on_notification/pending_payload_founder.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/read/checker_app_state_ide.dart';

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';


import '../general/m/MFcm.dart';
import '../read/ReadTypeFCM.dart';

//----------------------------------------------------------------------- receiver state background

/**
    /// This provided handler must be a top-level function and cannot be
    /// anonymous otherwise an [ArgumentError] will be thrown.
 */
@pragma('vm:entry-point')
Future receiverStateOnBackground() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } catch (e) {
    Log.i("fcm - receiverStateOnBackground() - e $e");
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage messageRemote) async {
  Log.i(
      "fcm - _firebaseMessagingBackgroundHandler() - messageRemote $messageRemote");
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  /// avoid duplicated message
  var newFcm = MMessageFcm(messageRemote);
  bool avoidDuplicatedMessage = lastMessageFcmReceived != null &&
      (newFcm.messageRemote.messageId ==
          lastMessageFcmReceived!.messageRemote.messageId);
  if (avoidDuplicatedMessage) {
    Log.i(
        "fcm - _firebaseMessagingBackgroundHandler() - avoidDuplicatedMessage ");
    return;
  }

  /// set last message
  lastMessageFcmReceived = MMessageFcm(messageRemote);
  lastMessageFcmReceived!.receivedStateTypeBackGround = true;

  /// choose when to push local notification
  if (isAppTerminatedWhileReceivedMessageBackgroundInvoked()) {
    await readTypeNotificationWithoutPushLocalNotification(
        lastMessageFcmReceived!);
  } else {
    await readTypeNotificationAndPushLocalNotification(lastMessageFcmReceived!);
  }
}

//----------------------------------------------------------------------- receiver state forGround

Future receiverStateOnForGround() async {
  // Log.i( "fcm - receiverStateOnForGround() - start "  );
  FirebaseMessaging.onMessage.listen((RemoteMessage messageRemote) async {
    Log.i("fcm - _handleMessageForGround() - RemoteMessage: $messageRemote");

    /// set last message
    lastMessageFcmReceived = MMessageFcm(messageRemote);
    lastMessageFcmReceived!.receivedStateTypeForGround = true;

    //read
    await readTypeNotificationAndPushLocalNotification(lastMessageFcmReceived!);

    refreshNotificationBadgeCounter();
  });
}

//-------------------------------------------------------------------- counter

Future refreshNotificationBadgeCounter() async {
  Log.i("fcm - refreshNotificationBadgeCounter() - contextFcm: $contextFcm");
  if (contextFcm == null) return;
  if (contextFcm!.mounted == false) return;
  // NotificationsCubit.get(contextFcm).getCounter();

}

//--------------------------------------------------------------------- state: message open app

Future receiverStateOnMessageOpenApp() async {
  FirebaseMessaging.onMessageOpenedApp.listen(_handleOnMessageOpenedApp);
}

Future _handleOnMessageOpenedApp(RemoteMessage messageRemote) async {
  Log.i("fcm - _handleOnMessageOpenedApp() - RemoteMessage: $messageRemote");

  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  /// avoid duplicated message
  var newFcm = MMessageFcm(messageRemote);
  bool avoidDuplicatedMessage = lastMessageFcmReceived != null &&
      (newFcm.messageRemote.messageId ==
          lastMessageFcmReceived!.messageRemote.messageId);
  if (avoidDuplicatedMessage) {
    Log.i("fcm - _handleOnMessageOpenedApp() - avoidDuplicatedMessage ");
    return;
  }

  /// set last message
  lastMessageFcmReceived = newFcm;
  lastMessageFcmReceived!.receivedStateTypeUserClickOnNotification = true;

  /// choose when to push local notification
  // if( isAppTerminatedWhileReceivedMessageBackgroundInvoked() ) {
  //   await readTypeNotificationWithoutPushLocalNotification( lastMessageFcmReceived!);
  // } else {
  //   await readTypeNotificationWithoutPushLocalNotification( lastMessageFcmReceived!);
  //   var base64Payload = lastMessageFcmReceived!.getBase64Payload();
  //   payloadJsonPending =  ConverterBase64PayloadHelper.parseBase64ToJson(base64Payload??"");
  //   fastor_app_ui_widgetWhatToFoAfterClickOnNotification(payloadJsonPending);
  //   clearPendingPayloadAfterUse();
  // }

  /// read and push
  await readTypeNotificationWithoutPushLocalNotification(
      lastMessageFcmReceived!);
  var base64Payload = lastMessageFcmReceived!.getBase64Payload();
  payloadJsonPending =
      ConverterBase64PayloadHelper.parseBase64ToJson(base64Payload ?? "");
  whatToFoAfterClickOnNotification(payloadJsonPending);
  clearPendingPayloadAfterUse();
}

//----------------------------------------------------------------------- receiver app termninated

Future checkAppTerminated() async {
  // //show to ui
  // if( notificationPayloadBase64 != null  ) {
  //   Log.i( "fcm - _checkThereIsClickNotificationHappened() - payload found data "   );
  //   clickNotificationHappened(    notificationPayloadBase64 );
  //   notificationPayloadBase64 = null;
  //   return;
  // }
  // if( isFoundPendingPayloadAfterOpenMain() )  {
  //   Log.i( "fcm - _checkThereIsClickNotificationHappened()  YES  "  );
  //   fastor_app_ui_widgetWhatToFoAfterClickOnNotification( payloadJsonPending );
  //   clearPendingPayloadAfterUse();
  // }

  messagingInstance ??= FirebaseMessaging.instance;

  /// fix emulator not have google play services
  if (messagingInstance == null) return;
  initialMessageAppTermniatedData =
      await messagingInstance!.getInitialMessage();
  if (initialMessageAppTermniatedData != null) {
    Log.i(
        "fcm - checkAppTerminated() - getInitialMessage() - value: $initialMessageAppTermniatedData ");

    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    /// avoid duplicated message
    var newFcm = MMessageFcm(initialMessageAppTermniatedData!);
    bool avoidDuplicatedMessage = lastMessageFcmReceived != null &&
        (newFcm.messageRemote.messageId ==
            lastMessageFcmReceived!.messageRemote.messageId);
    if (avoidDuplicatedMessage) {
      Log.i("fcm - checkAppTerminated() - avoidDuplicatedMessage ");
      return;
    }

    /// set last message
    lastMessageFcmReceived = MMessageFcm(initialMessageAppTermniatedData!);
    lastMessageFcmReceived!.receivedStateTypeTerminated = true;

    ///read and push
    await readTypeNotificationWithoutPushLocalNotification(
        lastMessageFcmReceived!);

    // ///navigate to specific screen if needed
    // clickNotificationHappened(lastMessageFcmReceived!.getBase64Payload());

    var base64Payload = lastMessageFcmReceived!.getBase64Payload();
    payloadJsonPending =
        ConverterBase64PayloadHelper.parseBase64ToJson(base64Payload ?? "");
    whatToFoAfterClickOnNotification(payloadJsonPending);
    clearPendingPayloadAfterUse();
  }
}
