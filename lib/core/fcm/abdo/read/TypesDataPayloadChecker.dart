
import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/MFcm.dart';

  //--------------------------------------------------------------------- data type


bool isDataType_notify(MMessageFcm mFcm ) {
    return mFcm.messageRemote.data['type'] == 'notify';
  }

  // static bool isDataType_adminNotifiyUsers(MMessageFcm mFcm ) {
  //   return mFcm.messageRemote.data['type'] == 'admin';
  // }
  //
  bool isDataType_mail(MMessageFcm mFcm ) {
    return mFcm.messageRemote.data['type'] == 'mail';
  }

  bool isDataType_location(MMessageFcm mFcm ) {
    return mFcm.messageRemote.data['type'] == 'location';
  }

