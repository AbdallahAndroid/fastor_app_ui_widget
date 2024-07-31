import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



var translatorApp = new LangApp();

extension StringExtensions on String {

  String translateApp() {
    return LangApp.searchForValue( this );
  }

  /// the "tra" means  "translateApp"
  String tra() {
    return LangApp.searchForValue( this );
  }

  /// the "ar" means "Arabic"
  String ar(String arabicMeans ) {
    if(LangApp.isArabic ) {
      return arabicMeans;
    } else {
      return this;
    }
  }



}

class LangApp {

  //--------------------------------------------------------------------

  //force type
  // static bool isForceLanguageEnglish = false;
  // static bool isForceLanguageArabic = false;

  // fix plugin "  localize_and_translate "
  static String activeLanguageCode = "en";

  static Map<String, dynamic> arabicWords  = Map();

  // static bool _sync = false;

  static bool isArabic = false;
  static bool isEnglish = ! isArabic;

  //-------------------------------------------------------------------- setup

  static Future setupFromMainMethod( ) async {
    await _updateLanguageType( );
  }


  static Future setupFromBuildMethod(BuildContext context) async {
    //Log.i("Lang - setupFromBuildMethod() - start");
    await _updateLanguageType( );
    if(arabicWords.length  > 0 ) return;
    _readWordsJsonFileArabic( context );
    //Log.i("Lang - setupFromBuildMethod() - end");
  }


  static Future _readWordsJsonFileArabic(BuildContext context ) async {
    String ar =  await DefaultAssetBundle.of( context).loadString('assets/lang/ar.json') ;
    arabicWords = json.decode( ar  )  ;
    // Log.i("Lang - setupArabic() - arabicWords: $arabicWords");
    //Log.i("Lang - _readWordsJsonFileArabic() - arabicWords: ${arabicWords.length}");
  }


  static Future _updateLanguageType( ) async {

    //default boolean
    LangApp.isArabic = await _getCacheIsArabic( );

    //force type
    /**
        if( LangFastor.isForceLanguageArabic) {
        // Log.i("Lang - updateLanguageType() - EnvironmentConstant.isForceLanguageArabic ");
        await _setCacheArabic(true);
        LangFastor.isArabic = true;
        } else if(  LangFastor.isForceLanguageEnglish ) {
        //Log.i("Lang - updateLanguageType() - EnvironmentConstant.isForceLanguageEnglish ");
        await _setCacheArabic(false);
        LangFastor.isArabic = false;
        }

     */
    await updateActiveLanguageCode();

    //Log.i("Lang - _updateLanguageType() - isArabic: " + LangFastor.isArabic.toString() );
  }

  static Future updateActiveLanguageCode() async  {
    //update code
    if(LangApp.isArabic ) {
      LangApp.activeLanguageCode = "ar";
    } else {
      LangApp.activeLanguageCode = "en";
    }
  }
  //------------------------------------------------------------------- choose direction and local

  static Locale getLocale(){
    if(LangApp.isArabic ) {
      return Locale('ar' ) ;
    } else {
      return Locale( "en" );
    }
  }


  static List<Locale> getSupportedLocales(){
    return [
      Locale( "en"  ),
      Locale('ar'  )
    ];
  }


  static TextDirection getTextDirection(){
    if ( LangApp.isArabic ) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }

  static AlignmentGeometry getAlignmentGeometry(){
    if ( LangApp.isArabic ) {
      return Alignment.topRight;
    } else {
      return Alignment.topLeft;
    }
  }


  static AlignmentGeometry getAlignmentGeometryStart(){
    if ( LangApp.isArabic ) {
      return Alignment.topRight;
    } else {
      return Alignment.topLeft;
    }
  }

  static AlignmentGeometry getAlignmentGeometryEnd(){
    if ( LangApp.isArabic ) {
      return Alignment.topLeft;
    } else {
      return Alignment.topRight;
    }
  }
  // static getLocalizationDelegates() {
  //   return    [
  //     GlobalMaterialLocalizations.delegate,
  //     GlobalWidgetsLocalizations.delegate,
  //     GlobalCupertinoLocalizations.delegate,
  //   ];
  // }

  //----------------------------------------------------------- translate

  static String searchForValue(String searchFor ) {
    // Log.i( "Lang - tr() - Lang.isArabic: ${LangFastor.isArabic}");
    // Log.i( "Lang - tr() - searchFor: $searchFor");
    if( LangApp.isArabic ) {
      return _readArabicIfExist( searchFor );
    }
    return searchFor; ///default
  }


  static String _readArabicIfExist(String searchFor ) {
    if( arabicWords.containsKey( searchFor )  ) {
      var result =  arabicWords["$searchFor"];
      // Log.i( "Lang - tr() - result: $result");
      if(result != null ) {
        return "$result";
      }
    } else {
      // Log.i( "Lang - _readArabicIfExist() - not found : $searchFor");
    }
    return searchFor;
  }

  //------------------------------------------------------------------- cache

  static const  String  _keyCache = "lang_cache_arabic";

  static Future _setCacheArabic(  bool v) async {
    //Log.i("Lang - _setCacheArabic() - v: $v");
    LangApp.isArabic = v;
    await updateActiveLanguageCode();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyCache, v);
  }


  static Future<bool> _getCacheIsArabic(  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool(_keyCache) ?? false;
    //Log.i("Lang - _getCacheIsArabic() - result: $result");
    return result;
  }


  static Future setEnglish() async {
    LangApp.isArabic = false;
    LangApp.isEnglish = true;
    updateActiveLanguageCode();
    await _setCacheArabic(false);
  }


  static Future setArabic() async {
    LangApp.isArabic = true;
    LangApp.isEnglish = false;
    updateActiveLanguageCode();
    await _setCacheArabic(true);
  }

}