
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/MFcm.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/PrintInDataFCM.dart';



  Future readContent(MMessageFcm mFcm) async {

    //type data "notify"
    if (mFcm.messageRemote.data.isNotEmpty  ) {
      await readDataPayloadContent(mFcm);
    }

    // chooseTypeRemote "notification"
    if( mFcm.messageRemote.notification != null ) {
      await _mapMFcmWithMessage_typeNotification(mFcm);
    }

    //check have both notification and data
    if( mFcm.isHideNotification) {
      mFcm.typeNotifyNotification = false;
    }

    //log
    printRemoteMessage( mFcm.messageRemote);

    //log result
    Log.i( "readTypeNotification() - isHideNotification: " + mFcm.isHideNotification.toString() );
    Log.i( "readTypeNotification() - typeNotifyNotification: " + mFcm.typeNotifyNotification.toString() );
    Log.i( "readTypeNotification() - typeNotifyData: " + mFcm.typeNotifyData.toString() );


  }


    Future readDataPayloadContent(MMessageFcm mFcm ) async {
    mFcm.title = mFcm.messageRemote.data['title']??"";
    mFcm.body = mFcm.messageRemote.data['body']??"";

    try {

      String result  =   mFcm.messageRemote.data['isHideNotification'].toString();
    //  Log.i( "readDataPayloadContent()  - isHideNotification result: " + result.toString()  );
      mFcm.isHideNotification = result.toLowerCase() == 'true';
    } catch ( e) {
      Log.i( "readDataPayloadContent()  - e: " + e.toString()  );
    }

  }


    Future _mapMFcmWithMessage_typeNotification(MMessageFcm mFcm ) async {
    mFcm.title = mFcm.messageRemote.notification!.title!;
    mFcm.body = mFcm.messageRemote.notification!.body!;
  }

