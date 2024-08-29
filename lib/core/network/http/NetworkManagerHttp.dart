import 'dart:async';
import 'dart:convert';
import 'dart:io';



import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/NetworkTypeDio.dart';
import 'package:http/http.dart' as http;


/**
    1- in navigate write
    <uses-permission navigate:name="navigate.permission.INTERNET"/>

 */

typedef NetworkHttpCallback = void Function(
    bool status, String msg, String json_string);

int timeoutPerSecond = 20;

class NetworkManagerUniversal {

  //--------------------------------------------------------------------------- variable

  static final tag = "NetworkManagerUniversal";

  String url = "";
  Map<String, dynamic> body = Map();
  Map<String, String>? headers = Map();
  NetworkType type = NetworkType.post;
  bool isLogRequest = true;
  bool isLogResponse = true ;



  //--------------------------------------------------------------------------- config


  void _configHeader() {
    //edit headers
    headers ??= Map();

    // Map<String, String> headersConfig =  NetworkConfig.getConfigureHeader();
    // if( UserHelper.isGuest()  ) {
    //   headersConfig = NetworkHeaderTools.langAndAccessKey(   ConstantEnvironment.endPointAccessKeyPassInHeader );
    // } else {
    //   headersConfig = NetworkHeaderTools.bearerTokenAndLangAndAccessKey( UserHelper.getToken(), ConstantEnvironment.endPointAccessKeyPassInHeader );
    // }
    // headers!.addAll( headersConfig);

    //log now
    if (isLogRequest!) {
      Log.k(tag, "start() type: " + type.toString());
      Log.k(tag, "start() url: " + url);
      Log.k(tag, "start() body: " + this.body.toString());
      Log.k(tag, "start() headers: " + headers.toString());
    }
  }

  //----------------------------------------------------------------------- choose type

  Future<http.Response> chooseTypeNetworkRequest(String url,

      {
        required  NetworkType type,
        Map<String, dynamic>? body,
        Map<String, String>? headers,
        bool? isLogRequest,
        bool? isLogResponse,
        bool? isEnableLogDioPretty}
      ) async {

    this.type = type;
    this.url = url;
    this.body = body??Map();
    this.headers = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();

    if (type == NetworkType.get) {
      return await get(url, body: body, headers: headers, isLogResponse: isLogResponse, isLogRequest: isLogRequest , isEnableLogDioPretty: isEnableLogDioPretty);
    } else if (type == NetworkType.post) {
      return await post(url, body: body, headers: headers, isLogResponse: isLogResponse, isLogRequest: isLogRequest , isEnableLogDioPretty: isEnableLogDioPretty);
    } else if (type == NetworkType.put) {
      return await put(url, body: body, headers: headers, isLogResponse: isLogResponse, isLogRequest: isLogRequest , isEnableLogDioPretty: isEnableLogDioPretty);
    } else if (type == NetworkType.delete) {
      return await delete(url, body: body, headers: headers, isLogResponse: isLogResponse, isLogRequest: isLogRequest , isEnableLogDioPretty: isEnableLogDioPretty);
    } else {
      return await get(url, body: body, headers: headers, isLogResponse: isLogResponse, isLogRequest: isLogRequest , isEnableLogDioPretty: isEnableLogDioPretty);
    }
  }

  //--------------------------------------------------------------------------- type: get

  Future<http.Response> get(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        bool? isLogRequest,
        bool? isLogResponse,
        bool? isEnableLogDioPretty}
      ) async {

    type = NetworkType.get;
    this.url = url;
    this.body = body??Map();
    this.headers = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();
    try {
      //http
      Uri uri = Uri.parse(url);
      http.Response response = await http
          .get(uri, headers: this.headers
        // body: jsonEncode( body),
      )
          .timeout(
        Duration(seconds: timeoutPerSecond),
        onTimeout: () => responseFailedInstanceTimeout(),
      ) ;


      //log big data
      if (this.isLogResponse!)
        Log.k(tag, "_get() - finish body - success: " + response.body);
      Log.k( tag, "get() - status: ${response.statusCode}" );

      //call back
      // if( callback != null ) callback!(true, "success", response.body  );
      return response;
    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_get() - e: " + msg);
      // if( callback != null ) callback!(false, msg, "");
      return responseFailedInstance();
    }
  }

  //------------------------------------------------------------------------- type: post

  Future<http.Response> post(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        bool? isLogRequest,
        bool? isLogResponse,
        bool? isEnableLogDioPretty}
      ) async {

    type = NetworkType.post;
    this.url = url;
    this.body = body??Map();
    this.headers = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();

    var myBody = jsonEncode(this.body);
    // Log.k( tag, "_post_http() - myBody: "  + myBody  );

    try {
      //http
      Uri uri = Uri.parse(url);
      http.Response response = await http
          .post(
        uri,
        headers: this.headers,
        body: myBody,
      )
          .timeout(
        Duration(seconds: timeoutPerSecond),
        onTimeout: () => responseFailedInstanceTimeout(),

      );

      //log big data
      if (this.isLogResponse!)
        Log.k(tag, "post() - finish body - success: " + response.body);
      Log.k( tag, "post() - status: ${response.statusCode}" );

      //call back
      // if( callback != null ) callback!(true, "success", response.body  );
      //return
      return response;
    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_post_http() - e: " + msg);
      // if( callback != null ) callback!(false,  msg, "" );
      return responseFailedInstance();
    }
  }

  //--------------------------------------------------------------------------- type: put

  Future<http.Response> put(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        bool? isLogRequest,
        bool? isLogResponse,
        bool? isEnableLogDioPretty}
      ) async {

    type = NetworkType.put;
    this.url = url;
    this.body = body??Map();
    this.headers = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();
    try {
      var myBody = jsonEncode(this.body);
      // Log.k( tag, "_put() - myBody: "  + myBody  );

      //http
      Uri uri = Uri.parse(url);
      http.Response response = await http
          .post(
        uri,
        headers: this.headers,
        body: myBody,
      )
          .timeout(
        Duration(seconds: timeoutPerSecond),
        onTimeout: () => responseFailedInstanceTimeout(),
      );

      //log big data
      if (this.isLogResponse!)
        Log.k(tag, "_put() - finish body - success: " + response.body);
      Log.k( tag, "put() - status: ${response.statusCode}" );

      //call back
      // if( callback != null ) callback!(true, "success", response.body  );
      return response;
    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_put() - e: " + msg);
      // if( callback != null ) callback!(false,  msg, "" );
      return responseFailedInstance();
    }
  }

  //--------------------------------------------------------------------------- type: delete

  Future<http.Response> delete(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        bool? isLogRequest,
        bool? isLogResponse,
        bool? isEnableLogDioPretty}
      ) async {

    type = NetworkType.delete;
    this.url = url;
    this.body = body??Map();
    this.headers = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();
    var myBody = jsonEncode(this.body);
    // Log.k( tag, "_delete() - myBody: "  + myBody  );
    try {
      //http
      Uri uri = Uri.parse(url);
      http.Response response = await http
          .post(
        uri,
        headers: this.headers,
        body: myBody,
      )
          .timeout(
        Duration(seconds: timeoutPerSecond) ,
        onTimeout: () => responseFailedInstanceTimeout(),
      );

      //log big data
      if (this.isLogResponse!)
        Log.k(tag, "_delete() - finish body - success: " + response.body);
      Log.k( tag, "delete() - status: ${response.statusCode}" );

      //call back
      // if( callback != null ) callback!(true, "success", response.body  );
      return response;
    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_delete() - e: " + msg);
      // if( callback != null ) callback!(false,  msg, "" );
      return responseFailedInstance();
    }
  }

  //--------------------------------------------------------------------- type: file

  // Future<http.Response> file(String url,
  //     {
  //       String? fileRequestKeyInJson,
  //       Map<String, dynamic>? body,
  //       Map<String, String>? headers,
  //       XFile? xFileToUpload,
  //       File? fileToUpload,
  //       bool? isTypeMethodPUT,
  //       bool? isEnableLogDioPretty ,
  //       int?  timeOutSecond, }) async {
  //
  //
  // }

  //------------------------------------------------------------------------- shape error



  http.Response responseFailedInstance()   {
    return http.Response(
      jsonEncode( {
        "message": "failed network"
      }),
      500,
    );
  }


  http.Response responseFailedInstanceTimeout()   {
    return http.Response(
      jsonEncode( {
        "message": "Request Timeout"
      }),
      408,
    );
  }


}
