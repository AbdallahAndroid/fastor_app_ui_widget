
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../NetworkRequestFile.dart';
import '../NetworkType.dart';

import 'DioService.dart';
import 'DioParameter.dart';

typedef NetworkDiocallback_dio = void Function(
    bool status, String msg, Map<String, dynamic> mapJson);

class NetworkManagerDio {

    final tag = "NetworkManagerDio";

  //--------------------------------------------------------------------------- variable

  String url = "";
  Map<String, dynamic> body = Map();
  Map<String, String> headers = Map();
  NetworkTypeDio? type;

  //file
  NetworkRequestFile? requestFile;

  bool isEnableLogDioPretty = true;

  NetworkDiocallback_dio? callback_dio;

  //------------------------------------------------------------------------- types  call

  callBack(String url, NetworkDiocallback_dio  callback,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        NetworkTypeDio? type,
        bool? isEnableLogDioPretty ,  //PrettyDioLogger
        }) {

    //set values
    this.url = url;
    this.type = type;
    this.requestFile = requestFile;


    //log
    isEnableLogDioPretty ??= true  ; //default take test enviroment
    this.isEnableLogDioPretty = isEnableLogDioPretty;

    //set body and header
    if (body != null) this.body = body;
    if (headers != null) this.headers = headers;

    //edit headers
    this.headers = setDefaultHeader(headers);

    _setupNetworkType();
    this.callback_dio = callback;

  _chooseTypeNetworkThenStartService();
  }

  //------------------------------------------------------------------------- type Future listener

    Future<Response> get(String url,
        {Map<String, dynamic>? body,
          Map<String, String>? headers,
          NetworkRequestFile? requestFile,
          NetworkTypeDio? type,
          bool? isEnableLogDioPretty ,  //PrettyDioLogger
          NetworkDiocallback_dio? callback}) async {

      return await any( url,  NetworkTypeDio.get,
          body: body, headers: headers, requestFile: requestFile,
        isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
    }


    Future<Response> post(String url,
        {Map<String, dynamic>? body,
          Map<String, String>? headers,
          NetworkRequestFile? requestFile,
          NetworkTypeDio? type,
          bool? isEnableLogDioPretty ,  //PrettyDioLogger
          NetworkDiocallback_dio? callback}) async {

      return await any( url,  NetworkTypeDio.post,
          body: body, headers: headers, requestFile: requestFile,
          isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
    }


    Future<Response> put(String url,
        {Map<String, dynamic>? body,
          Map<String, String>? headers,
          NetworkRequestFile? requestFile,
          NetworkTypeDio? type,
          bool? isEnableLogDioPretty ,  //PrettyDioLogger
          NetworkDiocallback_dio? callback}) async {

      return await any( url,  NetworkTypeDio.put,
          body: body, headers: headers, requestFile: requestFile,
          isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
    }


    Future<Response> delete(String url,
        {Map<String, dynamic>? body,
          Map<String, String>? headers,
          NetworkRequestFile? requestFile,
          NetworkTypeDio? type,
          bool? isEnableLogDioPretty ,  //PrettyDioLogger
          NetworkDiocallback_dio? callback}) async {

      return await any( url,  NetworkTypeDio.delete,
          body: body, headers: headers, requestFile: requestFile,
          isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
    }

    Future<Response> file(String url,
        {Map<String, dynamic>? body,
          Map<String, String>? headers,
          NetworkRequestFile? requestFile,
          NetworkTypeDio? type,
          bool? isEnableLogDioPretty ,  //PrettyDioLogger
          NetworkDiocallback_dio? callback}) async {

      return await any( url,  NetworkTypeDio.delete,
          body: body, headers: headers, requestFile: requestFile,
          isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
    }

  Future<Response> any(String url,
      NetworkTypeDio  type,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        bool? isEnableLogDioPretty ,  //PrettyDioLogger
        NetworkDiocallback_dio? callback}) async {

    //set values
    this.url = url;
    this.type = type;
    this.requestFile = requestFile;

    //log
    isEnableLogDioPretty ??= true  ; //default take test enviroment
    this.isEnableLogDioPretty = isEnableLogDioPretty;

    //set body and header
    if (body != null) this.body = body;
    if (headers != null) this.headers = headers;

    //set values
    this.url = url;
    this.type = type;

    //set body and header
    if (body != null) this.body = body;
    if (headers != null) this.headers = headers;

    //edit headers
    this.headers = setDefaultHeader(headers);

    _setupNetworkType();

    //choose type
    return await _chooseTypeNetworkThenStartService();
  }

  //-------------------------------------------------------------------- init constructor

  void _setupNetworkType() async {

    //set method type "POST" when have body
    if (type == null && this.body.length > 0) {
      this.type = NetworkTypeDio.post;

      //case no body here is Get
    } else if (type == null) {
      this.type = NetworkTypeDio.get;
    }

    //log now
    //Log.k(tag, "start() url: " + url);
    //Log.k( tag, "start() body: " + this.body.toString()  );
    // Log.k( tag, "start() method.type: " + type.toString()  );
    // Log.k( tag, "start() header: " + this.headers.toString()  );
  }

  //----------------------------------------------------------------------- start

  Future<Response> _chooseTypeNetworkThenStartService() async {
    if (type == NetworkTypeDio.file ||
        requestFile != null ) {
      if( requestFile!.filePath != null ) {
        return _file();
      }  else if ( requestFile!.xFile != null ) {
        return _fileTypeXFile();
      } else {
        callback_dio!(false, "filePath not found or XFile not found", Map());
        return _getFailedResponse();
      }
    } else if (type == NetworkTypeDio.post) {
      return await _post_dio();
    } else if (type == NetworkTypeDio.put) {
      return await _put();
    } else {
      return await  _get();
    }
  }


}
