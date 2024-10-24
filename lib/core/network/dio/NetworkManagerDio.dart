

import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/config/network_config.dart';
import '../NetworkRequestFile.dart';
import '../NetworkTypeDio.dart';

import 'DioServiceMyApp.dart';
import 'DioParameter.dart';




import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';


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

class   NetworkManagerDio  {

  final tag = "NetworkManagerDio";

  //--------------------------------------------------------------------------- variable

  String url = "";
  Map<String, dynamic> body = Map();
  Map<String, String> headers = Map();
  NetworkType? type;

  bool? handleErrorXMLHttpRequest;

  //file
  NetworkRequestFile? requestFile;

  bool? isEnableLogDioPretty;

  NetworkDiocallback_dio? callback_dio;


  int? timeOutSecond;


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
        NetworkType? type,
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

    _configureDefaultSetup();

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

    return await _any( url,  NetworkType.get, timeOutSecond : timeOutSecond,
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

    return await _any( url,  NetworkType.post, timeOutSecond : timeOutSecond,
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

    return await _any( url,  NetworkType.put, timeOutSecond : timeOutSecond,
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

    return await _any( url,  NetworkType.patch, timeOutSecond : timeOutSecond,
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

    return await _any( url,  NetworkType.delete, timeOutSecond : timeOutSecond,
        body: body, headers: headers, requestFile: requestFile,  handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        isEnableLogDioPretty: isEnableLogDioPretty, callback: callback );
  }

  //--------------------------------------------------------------------- file

  Future<Response> file(String url,
      {
        required String fileRequestKeyInJson,
        Map<String, dynamic>? body,
        Map<String, String>? headers,
        XFile? xFileToUpload,
        File? fileToUpload,
        FormData? formData,
        NetworkRequestFile? requestFile,
        bool? isTypeMethodPUT,
        bool? isEnableLogDioPretty ,
        int?  timeOutSecond,
        ProgressCallbackFastor? onSendProgress,
        ProgressCallbackFastor? onReceiveProgress,
        bool?  handleErrorXMLHttpRequest,
        NetworkDiocallback_dio? callback}) async {


    this.requestFile = requestFile;

    initRequestFileObject(fileRequestKeyInJson, xFileToUpload, fileToUpload, formData,  body, isTypeMethodPUT);


    return await _any( url,
        NetworkType.file,
        body: body,
        headers: headers,
        requestFile: this.requestFile,
        timeOutSecond : timeOutSecond,
        isEnableLogDioPretty: isEnableLogDioPretty,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        handleErrorXMLHttpRequest: handleErrorXMLHttpRequest,
        callback: callback );
  }


  void initRequestFileObject(
      String fileRequestKeyInJson, XFile? xFileToUpload, File? fileToUpload,
      FormData? formData, Map<String, dynamic>? body, bool? isTypeMethodPUT) {

    if(formData != null ){
      requestFile = NetworkRequestFile.fromFormData(formData);
    } else if( xFileToUpload != null ) {
      requestFile = NetworkRequestFile.fromXFileAndBody(xFileToUpload!, body);
    } else if ( fileToUpload != null ) {
      if(body != null ) {
        requestFile = NetworkRequestFile.fromFilePathAndBody(fileToUpload!.path, body!);
      } else {
        requestFile = NetworkRequestFile.fromFilePath(fileToUpload!.path );
      }
    }
    // Log.i("NetworkManagerDio - initRequestFileObject() - formData: $formData");
    // Log.i("NetworkManagerDio - initRequestFileObject() - requestFile: $requestFile");
    if(requestFile == null )  {
      throw Exception("missed XFile or File or FormData");
    }

    requestFile!.fileRequestKeyInJson = fileRequestKeyInJson;
    requestFile!.isTypeMethodPUT = isTypeMethodPUT??false;
  }

  //------------------------------------------------------------------------- any type

  Future<Response> _any(String url,
      NetworkType  type,
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

    _configureDefaultSetup();

    //choose type
    return await _chooseTypeNetworkThenStartService( onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress );
  }

  //-------------------------------------------------------------------- default values

  void _configureDefaultSetup()   {
    var configureHeaders = NetworkConfig.getConfigureHeader();
    headers.addAll( configureHeaders );
  }


  void _setupNetworkTypeDefault() async {
    //set method type "POST" when have body
    if (type == null && this.body.length > 0) {
      this.type = NetworkType.post;

      //case no body here is Get
    } else if (type == null) {
      this.type = NetworkType.get;
    }

    //log now
    //Log.k(tag, "start() url: " + url);
    //Log.k( tag, "start() body: " + this.body.toString()  );
    // Log.k( tag, "start() method.type: " + type.toString()  );
    // Log.k( tag, "start() header: " + this.headers.toString()  );
  }


  Future<Response> _chooseTypeNetworkThenStartService( {ProgressCallbackFastor? onSendProgress, ProgressCallbackFastor? onReceiveProgress}) async {
    if (type == NetworkType.file ||
        requestFile != null ) {
      if( requestFile!.filePath != null ) {
        return  file_dio();
      }  else if ( requestFile!.xFile != null ) {
        return  fileTypeXFile_dio(  onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
      }  else if ( requestFile!.formData != null ) {
        return  fileTypeFormData(  onSendProgress: onSendProgress, onReceiveProgress: onReceiveProgress);
      } else {
        if(callback_dio != null )callback_dio!(false, "filePath not found or XFile not found", Map());
        return  getFailedResponse();
      }
    } else if (type == NetworkType.post) {
      return await  post_dio();
    } else if (type == NetworkType.put) {
      return await  put_dio();
    } else if (type == NetworkType.patch) {
      return await  patch_dio();
    } else if (type == NetworkType.delete) {
      return await  delete_dio();
    } else {
      return await  get_dio();
    }
  }



}

