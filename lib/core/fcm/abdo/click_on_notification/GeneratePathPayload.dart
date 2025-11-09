
import 'package:fastor_app_ui_widget/core/fcm/abdo/click_on_notification/converter_base64_payload_helper.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/MFcm.dart';

class GeneratePathPayload {


  //------------------------------------------------------------------- path payload


  static String generatePathPayloadChooseType(MMessageFcm mFcm ) {
    /**
     * for this version there is not notificaiton except mail type
     */
    Map<String,dynamic> jsonDataPayload = mFcm.messageRemote.data;
    return ConverterBase64PayloadHelper.encodeJsonToBase64( jsonDataPayload);
  }




}