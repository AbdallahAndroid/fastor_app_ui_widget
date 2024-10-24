


import 'package:fastor_app_ui_widget/core/cache/SaveApp.dart';
import 'package:fastor_app_ui_widget/core/cache/UserModel.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/NetworkSingletone.dart';
import 'package:fastor_app_ui_widget/core/network/config/network_config.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';

import '../lang/LangApp.dart';
import 'CacheKeys.dart';

class UserHelper {


  //----------------------------------------------- logout clear

  static  logout( ) async {
    NetworkHelperSingleTone.setLogout();
    String userId =    UserHelper.getUserId();
    setToken( "");
    await SaveApp.setString( CacheKeys.userId,  "" );
    await SaveApp.setString( CacheKeys.username, "" );
    await SaveApp.setString( CacheKeys.email, "" );
    await SaveApp.setString( CacheKeys.country_flag, "" );
    await SaveApp.setString( CacheKeys.country_code, "" );
    await SaveApp.setString( CacheKeys.phoneOnly, "" );
    await SaveApp.setString( CacheKeys.image, "" );
    await SaveApp.setBool( CacheKeys.isStatusActive, false );
    // try {
    //   await FCMSubscribe.removeSubscribe(userId );
    // } catch (e ) {
    //   Log.i("UserHelper - logout() e: $e");
    // }

    Log.i("UserHelper - logout() ****** end");
  }

  //-------------------------------------------- save success authentication

  /**
   * call this method from login or from get profile api
   */
  static  saveProfile(UserModel user) async {
    if( ToolsValidation.isValid( user.token ) ) {
      NetworkHelperSingleTone.setLogin( user.token! );
      await setToken( user.token!);
    }

    await SaveApp.setString( CacheKeys.userId, user!.id!.toString() );
    await SaveApp.setString( CacheKeys.username, user?.name??"" );
    await SaveApp.setString( CacheKeys.email, user?.email??"" );
    await SaveApp.setString( CacheKeys.country_flag, user?.countryCode??"" );
    await SaveApp.setString( CacheKeys.country_code, user?.countryCode??"" );
    await SaveApp.setString( CacheKeys.phoneOnly, user?.phone??"" );
    await SaveApp.setString( CacheKeys.image, user?.picture??"" );

    // await SaveApp.setBool( CacheKeys.isCompletedProfile, user?.completedProfile??false );
    //add subscribe fcm
    // FCMSubscribe.subscribe(  );

    Log.i("UserHelper - saveProfile() - .......... end");
  }


  //------------------------------------------------ is login

  static bool isLogin(){
    String loginToken = SaveApp.getString( CacheKeys.loginToken) ?? "";
    bool isLogin = ToolsValidation.isValid( loginToken );
   // Log.i("UserHelper - isLogin() : $isLogin");
    return isLogin;
  }

  static bool isGuest(){
    return ! isLogin();
  }

  //------------------------------------------------ firebase

  static String getFirebaseToken() {
    var result =  SaveApp.getString(CacheKeys.fcm) ?? "";
    Log.i("getFirebaseToken() - result: $result ");
    return result;
  }


  static void setFirebaseToken(String? value) {
    Log.i("setFirebaseToken() - value: $value ");
    SaveApp.setString(CacheKeys.fcm, value??"");
  }


  static bool isFirebaseTokenEmpty() {
    var result =  SaveApp.getString(CacheKeys.fcm) ?? "";
    bool isEmpty = ToolsValidation.isEmpty(result);
    //Log.i("isFirebaseTokenEmpty() - isEmpty: $isEmpty ");
    return isEmpty;
  }
  //-------------------------------------------- token

  static String getToken() {
    String token =  SaveApp.getString(CacheKeys.loginToken) ?? "";
   // Log.i("UserHelper - getToken() : $token");
    return token;
  }

  static setToken(String token) {
    SaveApp.setString(CacheKeys.loginToken, token);
  }

  //-------------------------------------------- phone

  static String getCountryCode() {
    return SaveApp.getString(CacheKeys.country_code) ?? "";
  }
  static String getCountryFlag() {
    return SaveApp.getString(CacheKeys.country_flag) ?? "";
  }

  static setCountryCode(String s) {
    SaveApp.setString(CacheKeys.country_code, s);
  }


  static String getPhoneOnly() {
    var phoneOnly =  SaveApp.getString(CacheKeys.phoneOnly) ?? "";
    Log.i("UserHelper - getPhoneOnly() phoneOnly: $phoneOnly");
    return phoneOnly;
  }

  static setPhoneOnly(String s) {
    SaveApp.setString(CacheKeys.phoneOnly, s);
    Log.i("UserHelper - setPhoneOnly() s: $s");
  }

  //-------------------------------------------- user id

  static String getUserId() {
    return SaveApp.getString(CacheKeys.userId) ?? "";
  }

  //-------------------------------------------- name

  static String? getName() {
    return SaveApp.getString(CacheKeys.username) ;
  }

  static String getProfilePic() {
    return SaveApp.getString(CacheKeys.image) ?? "";
  }


  //-------------------------------------------- photo

  static String getPhoto() {
    return SaveApp.getString(CacheKeys.image) ?? "";
  }

  //-------------------------------------------- email

  static String getEmail() {
    String email =  SaveApp.getString(CacheKeys.email) ?? "";
    Log.i("UserHelper - getEmail() email: $email");
    return email;
  }


  static setEmail(String s) {
    SaveApp.setString(CacheKeys.email, s);
    Log.i("UserHelper - setEmail() s: $s");
  }



}