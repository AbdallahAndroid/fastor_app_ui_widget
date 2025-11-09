


import 'package:fastor_app_ui_widget/core/constant/env.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fastor_app_ui_widget/core/fcm/abdo/general/m/MFcm.dart';

import '../FCMRegister.dart';
import '../click_on_notification/GeneratePathPayload.dart';
import 'GroupNotificationFCM.dart';


  //------------------------------------------------------------------------- package: local_notification_flutter

Future pushByLocalNotification(MMessageFcm mFcm) async {

    //delete old
    await deleteOldFCMGroupId( mFcm);

    //print working in background
    _printSourceDebug( mFcm);

    //set every platform
    var _androidDetail ;
    if( DeviceTools.isAndroid() ) {
      _androidDetail = _androidNotificationDetails(mFcm);
    }

    if( mFcm.receivedStateTypeBackGround  ){
      Log.i( "fcm - pushByLocalNotification() - receivedStateTypeBackGround" );
      return;
    }


    //push local notification
    FlutterLocalNotificationsPlugin().show(
      mFcm.messageRemote.hashCode,
      mFcm.title,
      mFcm.body,
      NotificationDetails(
        android: _androidDetail,
        // iOS: _iosDetail
      ),
      payload:  GeneratePathPayload.generatePathPayloadChooseType(mFcm),
    );
}


    AndroidNotificationDetails _androidNotificationDetails(MMessageFcm mFcm){

    //generate channel
    String fcmGroupId =  getFCMGroupId(mFcm).toString();
    AndroidNotificationChannel _singleChannel = generateAndroidSingleChannel(  fcmGroupId );

    // set channel
    FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel( _singleChannel  );

    return AndroidNotificationDetails(
      _singleChannel.id,
      "Description FCM Group",
      color: AppColors.primary,
      icon:  drawableIconAndroid_packageFlutterLocal, // "@drawable/notification_icon",
      priority: Priority.max,
      //  groupKey : fcm_group_id, //FCMRegister.groupAndroid.id,

    );
  }


    AndroidNotificationChannel generateAndroidSingleChannel(String fcm_group_id) {
   // Log.i( "generateAndroidSingleChannel() - channelId: " + fcm_group_id );
    return AndroidNotificationChannel(
        fcm_group_id,
        "Description FCM Group",
        importance: Importance.max,
        playSound: true
    );
  }


    Future deleteOldFCMGroupId(MMessageFcm mFcm ) async {
    String channelId = getFCMGroupId(mFcm).toString();
   // Log.i( "fcm - deleteOldFCMGroupId() - channelId: " + channelId );

    //case android
    if( DeviceTools.isAndroid() ) {
      await FlutterLocalNotificationsPlugin()
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.deleteNotificationChannel(channelId);
      return;
    }

    // //case ios
    // if( DeviceTools.isAndroid() ) {
    //   var iosPlugin = IOSFlutterLocalNotificationsPlugin();
    //   // var obj = await FlutterLocalNotificationsPlugin()
    //   //     .resolvePlatformSpecificImplementation<iosPlugin>();
    //
    //   iosPlugin!.deleteNotificationChannelGroup(channelId);
    //   return;
    // }
  }


  //----------------------------------------------- test enviroment

    Future _printSourceDebug(MMessageFcm mFcm ) async {
    if( isLiveEnvironment) {
      return;
    }

    if( mFcm.receivedStateTypeBackGround ) {
      mFcm.title = mFcm.title + " {background} $editionFCM"  ;
    }
    if( mFcm.receivedStateTypeForGround ) {
      mFcm.title = mFcm.title + " {ForGround} $editionFCM"  ;
    }
    if( mFcm.receivedStateTypeUserClickOnNotification ) {
      mFcm.title = mFcm.title + " {MessageOpenApp} $editionFCM"  ;
    }
    if( mFcm.receivedStateTypeTerminated ) {
      mFcm.title = mFcm.title + " {Terminated} $editionFCM"  ;
    }
  }
