
import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
// import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageTools {

  //----------------------------------------------------------------------- singel tone

  LanguageTools._();

  static bool _isGetCacheBefore = false ;
  static bool isCacheArabic = false;

  static Future<LanguageTools> instance() async {
    if( _isGetCacheBefore == false ) {
      _isGetCacheBefore = true;
      isCacheArabic = await _getCacheIsArabic( );
      // Log.i("LanguageTools - instance() - isCacheArabic: " + isCacheArabic.toString() );
    }
    return LanguageTools._();
  }
  //------------------------------------------------------------------------ translation

  static const String _default = "en";

  static const enLocal =  Locale('en', 'US');
  static const arLocal =  Locale('ar', 'EG');
  static const defaultLocal = enLocal;

  static const listLocal = [
    enLocal,
    arLocal
  ];


  //-------------------------------------------------------------------- device language

  /**
      some of arabic peaple make there phone langauge is "arabic" by default
   */
  static void setArabicWhenDeviceLangaugeIsArabic(BuildContext context) {

    if( isDeviceLangaugeArabic(context) ) {
      setArabic(context);
      return ;
    }
  }

  static bool isDeviceLangaugeArabic(BuildContext context ) {
    //see https://stackoverflow.com/a/67622491/7186671
    String deviceLanguage= Platform.localeName.substring(0,2); // return "en"
    bool result =  deviceLanguage == "ar";
    // print("isDeviceLangaugeArabic() - " + deviceLanguage + " /result: " + result.toString() );
    return result;
  }

  //------------------------------------------------------------------------ check type

  static bool isArabic(BuildContext context) {
    //check get before
    LanguageTools.instance();

    //search in cache
    // Log.i( "fastor - isArabic() - result: " + isCacheArabic.toString() );
    return isCacheArabic;
    //  //see the local
    //  String name =  context.locale.toString();
    //  if ( _isEmpty( name ) ) {
    //    name = _default;
    //  }
    // // Log.i( "language - current: " + name );
    //  return name == "ar";
  }

  static bool isEnglish(BuildContext context) {
    return !isArabic( context );
  }

  static String getLocalLanguage(BuildContext context){
    if( isCacheArabic) {
      return "ar";
    } else {
      return "en";
    }
  }

  static setArabic(BuildContext context) {
    _setCacheArabic(true);
    // context.setLocale (  arLocal ) ; //Locale( "ar");
  }

  static setEnglish( BuildContext context ) {
    _setCacheArabic(false);
    // context.setLocale ( enLocal);// Locale( "en");
  }

  static setAnyLanguage(BuildContext context, Locale locale ) {
    //set in static
    // context.setLocale (   locale) ;

    //save in cache
    if( locale.languageCode ==  "ar" ) {
      _setCacheArabic( true);
    } else {
      _setCacheArabic( false);
    }
  }

  static TextDirection getTextDirection(BuildContext context){
    if ( isArabic(context) ) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }

  //------------------------------------------------------------- check empty

  static bool _isEmpty(String? str)
  {
    return !_checkHaveValue(str);
  }

  static bool _checkHaveValue(String? str)
  {
    if (str == null) {
      return false;
    }
    if (str.length == 0) {
      return false;
    }
    if (str == "") {
      return false;
    }
    if (str == "null") {
      return false;
    }
    if ("null" == str.trim().toLowerCase()) {
      return false;
    }
    if (str == " ") {
      return false;
    }
    return true;
  }

  //------------------------------------------------------------------- cache

  static const  String  keyCache = "language_cache_arabic";

  static Future _setCacheArabic(  bool v) async {
    _isGetCacheBefore = true;
    isCacheArabic = v;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyCache, v);
    // var box = await Hive.openBox('myBox');
    // box.put(keyCache, v );
  }


  static Future<bool> _getCacheIsArabic(  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool(keyCache) ?? false;
    return result;
    //  var box = await Hive.openBox('myBox');
    // // var box = Hive.box('myBox');
    //  var name = box.get( keyCache);
    //  return name;
  }



}