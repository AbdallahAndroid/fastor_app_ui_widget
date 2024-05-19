import 'dart:convert';

import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/NetworkTypeDio.dart';
import 'package:http/http.dart' as http;


/**
    1- in navigate write
    <uses-permission navigate:name="navigate.permission.INTERNET"/>

 */

typedef NetworkHttpCallback = void Function(  bool status, String msg, String json_string );

enum NetworkTypeHttp{
  get,
  post,
  put,
  delete,
  file,

  /**
      Access to XMLHttpRequest  has been blocked by CORS policy: Response to preflight request doesn't
      pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.
   */
  htmlContent
}

class NetworkManagerHttp {

  static final tag = "NetworkManage";



  //--------------------------------------------------------------------------- variable

  String url = "";
  Map<String, dynamic> body = Map();
  Map<String, String>?  headers = Map();
  NetworkTypeHttp type = NetworkTypeHttp.post;
  NetworkHttpCallback? callback;

  bool? isLogRequest;
  bool? isLogResponse;

  //------------------------------------------------------------------------- types constructor

  NetworkManagerHttp( String url, {
    Map<String, dynamic>? body,
    Map<String, String>?  headers,
    NetworkTypeHttp type = NetworkTypeHttp.post,
    NetworkHttpCallback? callback,
    this.isLogRequest = false,
    this.isLogResponse = false
  }  ) {

    //set url
    this.url = url;
    this.type = type;

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
    headers = _setDefaultHeader(headers);

    if( type == NetworkTypeHttp.htmlContent ) {
      headers = null;
    }

    // //set method type "GET" when no body
    // if( type == null &&  this.body.length == 0  ) {
    //   if( type != NetworkTypeHttp.htmlContent ) {
    //     this.type = NetworkTypeHttp.get;
    //   }
    // } else {
    //   this.type = type;
    // }

    // when null
    // isLogResponse ??= isLogRequest;

    //log now
    if(isLogRequest!){
      Log.k( tag, "start() url: " + url  );
      Log.k( tag, "start() body: " + this.body.toString()  );
      Log.k( tag, "start() headers: " + headers.toString()  );
    }

    //choose type
    _chooseTypeMethod( );
  }

  //----------------------------------------------------------------------- start

  void _chooseTypeMethod( ){
    if( type == NetworkTypeDio.post ) {
      _post_http();
    } else if( type == NetworkTypeHttp.put) {
      _put();
    } else if( type == NetworkTypeHttp.delete) {
      _delete();
    } else {
      _get( );
    }
  }

  //--------------------------------------------------------------------------- type: get

  Future<String> _get(   ) async {
    //edit headers
    if( type == NetworkTypeHttp.htmlContent ) {
      headers = null;
    }

    //http
    Uri uri = Uri.parse(url);
    http.Response  response = await http.get(uri,
        headers: headers
      // body: jsonEncode( body),
    );

    //log big data
    if(isLogResponse! )  Log.k( tag, "_get() - finish body - success: "  + response.body );
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

  //------------------------------------------------------------------------- type: post

  Future<String> _post_http( ) async {
    var myBody = jsonEncode( body);
    // Log.k( tag, "_post_http() - myBody: "  + myBody  );

    //http
    Uri uri = Uri.parse(url);
    http.Response  response = await http.post(uri,
      headers: headers,
      body: myBody,
    );

    //log big data
      if(isLogResponse! ) Log.k( tag, "_post_http() - finish body - success: "  + response.body );
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

  //--------------------------------------------------------------------------- type: put

  Future<String> _put() async {
    var myBody = jsonEncode( body);
    // Log.k( tag, "_put() - myBody: "  + myBody  );

    //http
    Uri uri = Uri.parse(url);
    http.Response  response = await http.post(uri,
      headers: headers,
      body: myBody,
    );

    //log big data
    if(isLogResponse! ) Log.k( tag, "_put() - finish body - success: "  + response.body );
    // Log.k( tag, "post() - finish body - success "   );

    try {
      //call back
      if( callback != null ) callback!(true, "success", response.body  );
    } catch (e){
      String msg = e.toString();
      Log.k(tag,  "_put() - e: " + msg );
      if( callback != null ) callback!(false,  msg, "" );
    }

    //return
    return response.body;
  }


  //--------------------------------------------------------------------------- type: delete

  Future<String> _delete() async {
    var myBody = jsonEncode( body);
    // Log.k( tag, "_delete() - myBody: "  + myBody  );

    //http
    Uri uri = Uri.parse(url);
    http.Response  response = await http.post(uri,
      headers: headers,
      body: myBody,
    );

    //log big data
    if(isLogResponse! ) Log.k( tag, "_delete() - finish body - success: "  + response.body );
    // Log.k( tag, "post() - finish body - success "   );

    try {
      //call back
      if( callback != null ) callback!(true, "success", response.body  );
    } catch (e){
      String msg = e.toString();
      Log.k(tag,  "_delete() - e: " + msg );
      if( callback != null ) callback!(false,  msg, "" );
    }

    //return
    return response.body;
  }

  //------------------------------------------------------------------------- header

   Map<String, String>  _setDefaultHeader(Map<String, String>? custome) {

    /// check type network
    if(type == NetworkTypeHttp.htmlContent) {
      custome ??= Map();
      if(!custome.containsKey( "Access-Control-Allow-Origin")) {
        custome["Access-Control-Allow-Origin"]  = "*";
      }
      if(!custome.containsKey( "Content-Type")) {
        custome["Content-Type"]  = "application/json";
      }
      if(!custome.containsKey( "Accept")) {
        custome["Accept"]  = "*/*";
      }
      return custome;
    }

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