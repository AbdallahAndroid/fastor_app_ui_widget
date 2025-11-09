import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/read/converter_base64_payload_helper.dart';

class MMessageFcm {
  RemoteMessage messageRemote;

  MMessageFcm(this.messageRemote);

  //state of received
  bool receivedStateTypeForGround = false;
  bool receivedStateTypeBackGround = false;
  bool receivedStateTypeTerminated = false;
  bool receivedStateTypeUserClickOnNotification = false;

  //type
  bool typeNotifyNotification = false;
  bool typeNotifyData = false; // print notification  by data payload
  bool isHideNotification =
      false; // no need to print notification, just need socket data to do action

  String title = ""; //read title
  String body = "";

  @override
  String toString() {
    return 'MMessageFcm{messageRemote: $messageRemote,'
        ' receivedStateTypeForGround: $receivedStateTypeForGround, '
        'receivedStateTypeBackGround: $receivedStateTypeBackGround,'
        ' receivedStateTypeTerminated: $receivedStateTypeTerminated, '
        ' receivedStateTypeUserClickOnNotification: $receivedStateTypeUserClickOnNotification,'
        ' typeNotifyNotification: $typeNotifyNotification,'
        ' typeNotifyData: $typeNotifyData,'
        ' typeSocketData: $isHideNotification, '
        'title: $title,'
        ' body: $body,'
        ' data: ${messageRemote.data}';
  }

  String? getBase64Payload() {
    return encodeJsonToBase64(messageRemote.data);
  }
}
