import 'package:fastor_app_ui_widget/core/fcm/abdo/FCMRegister.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/click_on_notification/FCMNavigateToSpecificPage.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/click_on_notification/converter_base64_payload_helper.dart';
import 'package:fastor_app_ui_widget/core/fcm/maqsafy_navigation/maqsafy_navigation.dart';

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/MFcm.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';




   Future eventData(MMessageFcm mFcm ) async {
    Log.i( "eventData- mFcm: " + mFcm.toString() );

     if ( mFcm.receivedStateTypeUserClickOnNotification
         && mFcm.receivedStateTypeBackGround == false  ) {
       var base64Payload =   mFcm.getBase64Payload();
       if( ToolsValidation.isValid(base64Payload ) ) {
         payloadJsonPending =  ConverterBase64PayloadHelper.parseBase64ToJson(base64Payload!);
         whatToFoAfterClickOnNotification(payloadJsonPending);
       }
     }


   }


