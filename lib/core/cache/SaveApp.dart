import 'dart:convert';
import 'dart:core';

import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';
import 'package:flutter/material.dart';



import 'package:shared_preferences/shared_preferences.dart';


class SaveFastor {

  static const tag = "SaveApp";

  static SharedPreferences? prefs;

  //-----------------------------------------------------------------------  init

  static  Future  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //-----------------------------------------------------------------------  map list

  static Future setMapList( String key,  List< Map<String, dynamic>> mapList  ) async {

    //save all backend by index array
    int len = mapList.length;
    for(int i = 0; i < len; i++ ) {
      Map<String, dynamic> singleMap = mapList[i];
      String keyIndex = _generateKeyMapList(key, i );
      await setMap( keyIndex, singleMap );
    }

    //save size
    String keySize = _generateKeySize(key );
    await setInt( keySize, len);
  }


  static List<Map<String,dynamic>>  getMapList( String key   )   {
    List < Map<String,dynamic> > mapList =  [];

    //get len
    String keySize = _generateKeySize(key );
    int len =   getInt( keySize );

    //get backend
    for(int i = 0; i < len; i++ ) {
      String keyIndex = _generateKeyMapList(key, i );
      Map<String, dynamic> singleMap =   getMap( keyIndex );
      //add
      mapList.add( singleMap);
    }

    //
    return mapList;
  }

  static String _generateKeySize(String key ) {
    return  key + "_size"  ;
  }


  static String _generateKeyMapList(String key, int index ) {
    return  key + "_index" + index.toString();
  }

  // ----------------------------------------------------------------- single map

  static Future setMap( String key,  Map<String, dynamic> mapJson ,{  VoidCallback? callback} ) async {
    // Map<String, Object> values = <String, Object>{'counter': 1};

    //convert to json
    String json  = jsonEncode(mapJson);
    // Log.k( tag,  "setObject() mapJson: " + mapJson.toString() );
    // Log.k( tag,  "setObject() json: " + json  );

    //set json to cache
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json);

    //callback
    if(callback != null ) callback();
  }


  static  Map<String, dynamic>  getMap( String key,  {   ValueChanged<Map<String, dynamic>>? callback} )   {

    if( prefs == null ) {
     // throw Exception(messageThrowException());
      return Map();
    }

    String jsonString = prefs!.getString(key) ?? "";

    // Log.k( "save class",  "getString() - key: " + key + " /value: " + result );
    if( ToolsValidation.isEmpty( jsonString ) ) {
      jsonString = "";
    }
    // Log.k( tag,  "getObject() jsonString: " + jsonString  );

    //convert to mapJson
    Map<String, dynamic> mapJson  = jsonDecode(jsonString);
    // Log.k( tag,  "getObject() Map<String, dynamic>: " + mapJson.toString()  );

    //callback
    if(callback != null ) callback(mapJson);
    return mapJson;
  }

  //------------------------------------------------------------------ int

  static Future setInt(String key, int v) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setInt(key, v);
    // var box = Hive.box('myBox');
    // box.put(key, v );
  }

  static int  getInt(String key)   {
    if( prefs == null ) {
      // throw Exception(messageThrowException());
      return 0;
    }

    var result = prefs!.getInt(key) ?? 0;
    return result;
    // var box = Hive.box('myBox');
    // var name = box.get( key);
    // return name;
  }


  //------------------------------------------------------------------ string

  static Future setString(String key, String v) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setString(key, v);
    //  Log.k( "save class",  "setString() - key: " + key + " /v: " + v );
  }


  static String  getString(String key)   {
    if( prefs == null ) {
      // throw Exception(messageThrowException());
      return "";
    }

    String result = prefs!.getString(key) ?? "";
    if( result == null ) return "";
    if( ToolsValidation.isEmpty( result ) ) return "";

    return result;
  }

  //------------------------------------------------------------------ bool

  static Future setBool(String key, bool v) async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.setBool(key, v);
  }


  static bool  getBool(String key)   {
    if( prefs == null ) {
      // throw Exception(messageThrowException());
      return false;
    }

    bool result = prefs!.getBool(key) ?? false;
    return result;

  }



}