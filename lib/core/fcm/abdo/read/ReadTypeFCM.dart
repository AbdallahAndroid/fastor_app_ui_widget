

import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/MFcm.dart';

import 'DecisionsAfterReadingContent.dart';
import 'ReadContentNotification.dart';

Future readTypeNotificationWithoutPushLocalNotification(MMessageFcm mFcm) async {

  //set type
  await _setTypeFCM(mFcm);

  //read content
  await readContent( mFcm );
}


Future readTypeNotificationAndPushLocalNotification(MMessageFcm mFcm) async {

    //set type
    await _setTypeFCM(mFcm);

    //read content
    await readContent( mFcm );

    //choose
    await chooseWhatToDoPushOrEventSocketOnly( mFcm);
}


Future _setTypeFCM( MMessageFcm mFcm  ) async {

    //type data "notify"
    if (mFcm.messageRemote.data.isNotEmpty  ) {
      // Log.i( "readTypeNotification() - data: " + mFcm.messageRemote.data.toString() );
      mFcm.typeNotifyData = true;
    }

    // chooseTypeRemote "notification"
    if( mFcm.messageRemote.notification != null ) {
      mFcm.typeNotifyNotification = true;
    }

    //check have both notification and data
    if( mFcm.isHideNotification) {
      mFcm.typeNotifyNotification = false;
    }
}

