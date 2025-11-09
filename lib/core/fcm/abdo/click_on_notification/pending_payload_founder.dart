import 'package:fastor_app_ui_widget/core/fcm/abdo/FCMRegister.dart';

bool isFoundPendingPayloadAfterOpenMain(){
  return payloadJsonPending != null;
}


clearPendingPayloadAfterUse(){
  payloadJsonPending = null;
}