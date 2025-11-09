import 'dart:io';


import 'package:fastor_app_ui_widget/core/cache/SaveApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';


final _keyAll = "setSubscribeToAllUserFCMBefore";

class FCMSubscribe {

  //---------------------------------------------------------------- all user
  static Future allUserSpecificPlatform( ) async {

    //check subscribe before
    if( await FCMSubscribe._isSubscribeToAllUserBefore() ) {
     // Log.i( "fcm - allUserSpecificPlatform() - isSubscribeToAllUserBefore -  stop !" );
      return;
    }

    //any platform to all receiptionist in all restaurant
    String keySubscribeAll = "user_panel_type_all";
    await FirebaseMessaging.instance.subscribeToTopic( keySubscribeAll  ).then((value) {
      Log.i( "fcm - allUserSpecificPlatform() - success key: " + keySubscribeAll );
      setSubscribeToAllUserBefore();
    });
  }



  static void setSubscribeToAllUserBefore(){
    SaveApp.setBool( _keyAll, true );
  }


  static Future< bool > _isSubscribeToAllUserBefore() async{
    return await SaveApp.getBool( _keyAll );
  }

  //---------------------------------------------------------------- add all


  /**
      backend send me example on 2023-06-18
      `receptionist_userid_${userId}`
   */
  static Future subscribe(String userId ) async {

    if( userId == "null" || userId.isEmpty ) return;

    String keyUser = "userid_$userId";
    await FirebaseMessaging.instance.subscribeToTopic( keyUser ).then( (value){
      Log.i( "fcm - subscribe() - keyUser: " + keyUser );
    });

  }


  /**
   * call after logout
   */
  static Future  removeSubscribe(String  userId  ) async {

    //check FirebaseMessaging.instance.isInitialized() to avoid crash
    bool supportedFcm = await FirebaseMessaging.instance.isSupported();
    Log.i( "fcm - removeSubscribe() - supportedFcm: $supportedFcm  "   );
    if( supportedFcm  = false  ) {
      Log.i( "fcm - removeSubscribe() - supportedFcm stop!  "   );
      return;
    }

    //check user id is empty
    if(ToolsValidation.isEmpty( userId ) ) {
      Log.i( "fcm - removeSubscribe() - userId is empty - stop!"   );
      return;
    }

    //by user id
    String keyUser = "userid_$userId";
    await FirebaseMessaging.instance.unsubscribeFromTopic( keyUser ).then( (value){
      Log.i( "fcm - removeSubscribe() - keyUser: " + keyUser );
    });

  }


}

