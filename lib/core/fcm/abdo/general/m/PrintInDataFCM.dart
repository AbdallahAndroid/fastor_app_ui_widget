import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/FCMRegister.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/read/checker_app_state_ide.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

void printRemoteMessage(RemoteMessage messageRemote) {
  //messageRemote.notification
  if (messageRemote.notification != null) {
    Log.i("fcm - print() - title: ${messageRemote.notification!.title}");
    Log.i("fcm - print() - body: ${messageRemote.notification!.body}");
  }

  //print data
  Log.i("fcm - print() - data: ${messageRemote.data}");

  //print general info
  Log.i("fcm - print() - hashCode: ${messageRemote.hashCode}");
  Log.i("fcm - print() - messageId: ${messageRemote.messageId}");
  Log.i("fcm - print() - senderId: ${messageRemote.senderId}");
  Log.i("fcm - print() - threadId: ${messageRemote.threadId}");
  Log.i("fcm - print() - ttl: ${messageRemote.ttl}");
  Log.i("fcm - print() - sentTime: ${messageRemote.sentTime}");
  Log.i("fcm - print() - collapseKey: ${messageRemote.collapseKey}");

  Log.i(
      "fcm - print() - isAppTerminatedWhileReceivedMessageBackgroundInvoked: ${isAppTerminatedWhileReceivedMessageBackgroundInvoked()}");
  Log.i("fcm - print() - editionFCM: $editionFCM");
}
