import 'dart:async';
import 'dart:convert';
// import 'dart:io';


import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/NetworkHeaderTools.dart';
import 'package:fastor_app_ui_widget/core/network/NetworkTypeDio.dart';
import 'package:http/http.dart' as http;

import 'package:universal_io/io.dart' as io ;


/**
    1- in navigate write
    <uses-permission navigate:name="navigate.permission.INTERNET"/>

 */

typedef NetworkHttpCallback = void Function(
    bool status, String msg, String json_string);

int timeoutPerSecond = 20;

class NetworkUniversalHelper {

  //--------------------------------------------------------------------------- variable

  static final tag = "NetworkUniversalHelper";

  String url = "";
  Map<String, dynamic> body = Map();
  Map<String, String>? headersWithConfigure = Map();
  NetworkType type = NetworkType.post;
  bool isLogRequest = true;
  bool isLogResponse = true ;



  //--------------------------------------------------------------------------- config


  void _configHeader() {
    //edit headers
    headersWithConfigure ??= Map();

    // Map<String, String> headersConfig =  NetworkConfig.getConfigureHeader();
    // if( UserHelper.isGuest()  ) {
    //   var headerGuest = NetworkHeaderTools.langAndAccessKey(   ConstantEnvironment.endPointAccessKeyPassInHeader );
    //   headersConfig.addAll( headerGuest);
    // } else {
    //   var headersLogin = NetworkHeaderTools.bearerTokenAndLangAndAccessKey( UserHelper.getToken(), ConstantEnvironment.endPointAccessKeyPassInHeader );
    //   headersConfig.addAll( headersLogin);
    // }
    // headersWithConfigure!.addAll( headersConfig);

    //log now
    if (isLogRequest!) {
      Log.k(tag, "start() type: " + type.toString());
      Log.k(tag, "start() url: " + url);
      Log.k(tag, "start() body: " + this.body.toString());
      Log.k(tag, "start() headersWithConfigure: " + headersWithConfigure.toString());
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
    this.headersWithConfigure = headers;

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
    this.headersWithConfigure = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();
    try {
      Uri uri = Uri.parse(url);

      final request = await io.HttpClient().getUrl(uri );
      this.headersWithConfigure?.forEach((key, value) {
        request.headers.set(key, value);
      });
      if( body != null && body.isNotEmpty ) {
        final bodyEncode = jsonEncode(body);
        request.write(bodyEncode);
      }
      io.HttpClientResponse responseUniversal = await request.close();
      String decoderBody = await responseUniversal.transform(utf8.decoder).join();
      // var decoderBody = json.decode(data);
      if (this.isLogResponse!) Log.k(tag, "_get() - finish body - success: " + decoderBody);
      Log.k( tag, "get() - status: ${responseUniversal.statusCode}" );
      return responseSuccessMapUniversalToHttp( responseUniversal.statusCode, decoderBody);
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
    this.headersWithConfigure = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();

    try {
      Uri uri = Uri.parse(url);
      final request = await io.HttpClient().postUrl(uri );
      this.headersWithConfigure?.forEach((key, value) {
        request.headers.set(key, value);
      });
      if( body != null && body.isNotEmpty ) {
        final bodyEncode = jsonEncode(body);
        request.write(bodyEncode);
      }
      io.HttpClientResponse responseUniversal = await request.close();
      String decoderBody = await responseUniversal.transform(utf8.decoder).join();
      if (this.isLogResponse!) Log.k(tag, "post() - finish body - success: " + decoderBody);
      Log.k( tag, "post() - status: ${responseUniversal.statusCode}" );
      return responseSuccessMapUniversalToHttp( responseUniversal.statusCode, decoderBody);
    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "post() - e: " + msg);
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
    this.headersWithConfigure = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();
    try {
      Uri uri = Uri.parse(url);
      final request = await io.HttpClient().putUrl(uri );
      this.headersWithConfigure?.forEach((key, value) {
        request.headers.set(key, value);
      });
      if( body != null && body.isNotEmpty ) {
        final bodyEncode = jsonEncode(body);
        request.write(bodyEncode);
      }
      io.HttpClientResponse responseUniversal = await request.close();
      String decoderBody = await responseUniversal.transform(utf8.decoder).join();
      if (this.isLogResponse!) Log.k(tag, "_put() - finish body - success: " + decoderBody);
      Log.k( tag, "_put() - status: ${responseUniversal.statusCode}" );
      return responseSuccessMapUniversalToHttp( responseUniversal.statusCode, decoderBody);
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
    this.headersWithConfigure = headers;

    if(isEnableLogDioPretty??false  ) {
      isLogRequest = true;
      isLogResponse = true;
    }
    this.isLogRequest = isLogRequest??true;
    this.isLogRequest = isLogResponse??true;

    _configHeader();

    // Log.k( tag, "_delete() - myBody: "  + myBody  );
    try {
      Uri uri = Uri.parse(url);
      final request = await io.HttpClient().deleteUrl(uri );
      this.headersWithConfigure?.forEach((key, value) {
        request.headers.set(key, value);
      });
      if( body != null && body.isNotEmpty ) {
        final bodyEncode = jsonEncode(body);
        request.write(bodyEncode);
      }
      io.HttpClientResponse responseUniversal = await request.close();
      String decoderBody = await responseUniversal.transform(utf8.decoder).join();
      if (this.isLogResponse!) Log.k(tag, "_delete() - finish body - success: " + decoderBody);
      Log.k( tag, "_delete() - status: ${responseUniversal.statusCode}" );
      return responseSuccessMapUniversalToHttp( responseUniversal.statusCode, decoderBody);
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

  http.Response responseSuccessMapUniversalToHttp(int statusCode, String decoderBody) {
    return http.Response(
      decoderBody,
      statusCode,
    );
  }


}
