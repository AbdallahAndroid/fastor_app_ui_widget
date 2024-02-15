
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/resource/toolsFastor/network/dio/NetworkConfigDio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../NetworkRequestFile.dart';
import '../NetworkTypeDio.dart';

import 'DioService.dart';
import 'DioParameter.dart';

typedef NetworkDiocallback_dio = void Function(
    bool status, String msg, Map<String, dynamic> mapJson);


/// Callback to listen the progress for sending/receiving data.
///
/// [count] is the length of the bytes have been sent/received.
///
/// [total] is the content length of the response/request body.
/// 1.When receiving data:
///   [total] is the request body length.
/// 2.When receiving data:
///   [total] will be -1 if the size of the response body is not known in advance,
///   for example: response data is compressed with gzip or no content-length header.
typedef ProgressCallbackFastor = void Function(int count, int total);

class NetworkManagerDio  {

  final tag = "NetworkManagerDio";

  //--------------------------------------------------------------------------- variable

  String url = "";
  Map<String, dynamic> body = Map();
  Map<String, String> headers = Map();
  NetworkTypeDio? type;

  bool? handleErrorXMLHttpRequest;

  //file
  NetworkRequestFile? requestFile;

  bool? isEnableLogDioPretty;

  NetworkDiocallback_dio? callback_dio;

  NetworkConfigDio? config;

  int? timeOutSecond;

  //------------------------------------------------------------------------- constructor

  NetworkManagerDio( { this.config });

  //------------------------------------------------------------------------- types  callback not future

  Future<Response> callBack(String url,
      { required NetworkDiocallback_dio  callback,
        Map<String, dynamic>? body,
        Map<String, String>? headers,

      ///file
        NetworkRequestFile? requestFile,
        ProgressCallbackFastor? onSendProgress,
        ProgressCallbackFastor? onReceiveProgress,

        ///other
        NetworkTypeDio? type,
        bool? isEnableLogDioPretty ,
        int?  timeOutSecond,
        bool?  handleErrorXMLHttpRequest
      }) async {

    //set values
    this.url = url;
    this.type = type;
    this.requestFile = requestFile;
    this.timeOutSecond = timeOutSecond;

    // handler error
    handleErrorXMLHttpRequest ??= false;
    this.handleErrorXMLHttpRequest = handleErrorXMLHttpRequest;

    //log
    isEnableLogDioPretty ??= true  ; //default take test enviroment
    this.isEnableLogDioPretty = isEnableLogDioPretty;

    //set body and header
    if (body != null) this.body = body;
    if (headers != null) this.headers = headers;

    //edit headers
    this.headers = setDefaultHeader(headers);

    _setupNetworkTypeDefault();
    this.callback_dio = callback;

    _configureSetup();

    return await _chooseTypeNetworkThenStartService( onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
  }


  //------------------------------------------------------------------------- types

  Future<Response> get(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {

    return await any( url,  NetworkTypeDio.get, timeOutSecond : timeOutSecond,
        body: body, headers: headers, requestFile: requestFile, handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
  }


  Future<Response> post(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {

    return await any( url,  NetworkTypeDio.post, timeOutSecond : timeOutSecond,
        body: body, headers: headers, requestFile: requestFile,  handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
  }


  Future<Response> put(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {

    return await any( url,  NetworkTypeDio.put, timeOutSecond : timeOutSecond,
        body: body, headers: headers, requestFile: requestFile,  handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
  }

  Future<Response> patch(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {

    return await any( url,  NetworkTypeDio.patch, timeOutSecond : timeOutSecond,
        body: body, headers: headers, requestFile: requestFile,  handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
  }


  Future<Response> delete(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {

    return await any( url,  NetworkTypeDio.delete, timeOutSecond : timeOutSecond,
        body: body, headers: headers, requestFile: requestFile,  handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
  }

  Future<Response> file(String url,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,
        NetworkRequestFile? requestFile,
        bool? isEnableLogDioPretty ,
        int?  timeOutSecond,
        ProgressCallbackFastor? onSendProgress,
        ProgressCallbackFastor? onReceiveProgress,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {

    return await any( url,
        NetworkTypeDio.file,
        body: body,
        headers: headers,
        requestFile: requestFile,
        timeOutSecond : timeOutSecond,
        isEnableLogDioPretty: isEnableLogDioPretty,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        callback: callback );
  }


  //------------------------------------------------------------------------- any type

  Future<Response> any(String url,
      NetworkTypeDio  type,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,

        /// file
        NetworkRequestFile? requestFile,
       ProgressCallbackFastor? onSendProgress,
        ProgressCallbackFastor? onReceiveProgress,

        bool? isEnableLogDioPretty ,
        int?  timeOutSecond,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {

    //set values
    this.url = url;
    this.type = type;
    this.requestFile = requestFile;
    this.callback_dio = callback;
    this.timeOutSecond = timeOutSecond;

    //handleErrorXMLHttpRequest
    handleErrorXMLHttpRequest ??= false;
    this.handleErrorXMLHttpRequest = handleErrorXMLHttpRequest;

    //log
    isEnableLogDioPretty ??= true;
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

    _setupNetworkTypeDefault();

    _configureSetup();

    //choose type
    return await _chooseTypeNetworkThenStartService( onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress );
  }

  //-------------------------------------------------------------------- default values

  void _configureSetup()   {
    if( config == null ) return;

    //base url
    if( config?.baseUrl != null  ) {
      if( url.startsWith( "http") == false  ) {
        url = config!.baseUrl + url;
      }
    }

    //header
    if( config?.headers != null ) {
      headers.addAll( headers );
    }

    //beauty log
    if( config?.isEnableLogDioPretty != null ) {
      ///check already there is instance varible found for current request
      isEnableLogDioPretty ??= config?.isEnableLogDioPretty;
    }


  }


  void _setupNetworkTypeDefault() async {
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


  Future<Response> _chooseTypeNetworkThenStartService( {ProgressCallbackFastor? onSendProgress, ProgressCallbackFastor? onReceiveProgress}) async {
    if (type == NetworkTypeDio.file ||
        requestFile != null ) {
      if( requestFile!.filePath != null ) {
        return  file_dio();
      }  else if ( requestFile!.xFile != null ) {
        return  fileTypeXFile_dio(  onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
      } else {
        callback_dio!(false, "filePath not found or XFile not found", Map());
        return  getFailedResponse();
      }
    } else if (type == NetworkTypeDio.post) {
      return await  post_dio();
    } else if (type == NetworkTypeDio.put) {
      return await  put_dio();
    } else if (type == NetworkTypeDio.patch) {
      return await  patch_dio();
    } else if (type == NetworkTypeDio.delete) {
      return await  delete_dio();
    } else {
      return await  get_dio();
    }
  }


}
