import 'dart:convert';

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'NetworkType.dart';
// import 'package:http/http.dart';

/**
    1- in navigate write
    <uses-permission navigate:name="navigate.permission.INTERNET"/>

 */

typedef NetworkHttpCallback = void Function(  bool status, String msg, String json_string );

class NetworkManagerHttp {

  static final tag = "NetworkManage";



  //--------------------------------------------------------------------------- variable

  String url = "";
  Map<String, dynamic> body = Map();
  Map<String, String>  headers = Map();
  NetworkType type = NetworkType.post;
  NetworkHttpCallback? callback;

  //------------------------------------------------------------------------- types constructor

  NetworkManagerHttp( String url, {
    Map<String, dynamic>? body,
    Map<String, String>?  headers,
    NetworkType type = NetworkType.post,
    NetworkHttpCallback? callback}  ) {

    //set url
    this.url = url;

    //set body and header
    if( body != null ) this.body = body;
    if( headers != null ) this.headers = headers;

    //set call back
    if( callback != null ) this.callback = callback;

    //constructor
    _initConstructor();
  }

  //-------------------------------------------------------------------- init constructor

  void _initConstructor(){
    //edit headers
    headers = setDefaultHeader(headers);

    //set method type "GET" when no body
    if( type == null &&  this.body.length == 0  ) {
      this.type = NetworkType.get;
    } else {
      this.type = type;
    }


    //log now
    Log.k( tag, "start() url: " + url  );
    Log.k( tag, "start() body: " + this.body.toString()  );
    Log.k( tag, "start() headers: " + headers.toString()  );

    /**
     * not to print secure data "have token'
        if( FLConstant.isTest ) {
        Log.k( tag, "start() headers: " + headers.toString()  );
        }

     */


    //choose type
    chooseTypeToStart( );
  }
  //----------------------------------------------------------------------- start

  void chooseTypeToStart( ){
    if( type == NetworkType.post ) {
      /**
       * test here choose type of network
       */

      _post_http();
    } else {
      _get( );
    }
  }

  Future<String> _post_http( ) async {
    var myBody = jsonEncode( body);
    Log.k( tag, "_post_http() - myBody: "  + myBody  );

    //http
    Uri uri = Uri.parse(url);
    http.Response  response = await http.post(uri,
      headers: headers,
      body: myBody,
    );

    //log big data
    Log.k( tag, "_post_http() - finish body - success: "  + response.body );
    // Log.k( tag, "post() - finish body - success "   );

    try {
      //call back
      if( callback != null ) callback!(true, "success", response.body  );
    } catch (e){
      String msg = e.toString();
      Log.k(tag,  "post() - e: " + msg );
      if( callback != null ) callback!(false,  msg, "" );
    }

    //return
    return response.body;
  }
  //--------------------------------------------------------------------------- get

  Future<String> _get(   ) async {

    //http
    Uri uri = Uri.parse(url);
    http.Response  response = await http.get(uri,
        headers: headers
      // body: jsonEncode( body),
    );

    //log big data
    Log.k( tag, "_get() - finish body - success: "  + response.body );
    // Log.k( tag, "post() - finish body - success "   );

    try {
      //call back
      if( callback != null ) callback!(true, "success", response.body  );
    } catch (e){
      String msg = e.toString();
      Log.k(tag,  "post() - e: " + msg );
      if( callback != null ) callback!(false, msg, "");
    }

    //return
    return response.body;
  }

  //------------------------------------------------------------------------- header

  static Map<String, String>  setDefaultHeader(Map<String, String>? custome) {

    /**
     * check already write another "Content-Type"
     */
    if( custome != null ) {
      bool containAlready = custome.containsKey( "Content-Type" );
      if (containAlready )return custome;
    }

    //default
    /**
     * the "POSTMAN" already found content-type hidden header already send by default
     * so we need here to pass this "Content-Type"
     */
    custome ??= Map();
    custome[ "Content-Type"] =  "application/json";
    return custome;
  }



}