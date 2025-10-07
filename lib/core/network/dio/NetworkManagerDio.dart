

import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/config/network_config.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failure_exceptions.dart';
import 'package:fastor_app_ui_widget/core/network/internet/InternetTools.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
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
typedef ProgressCallbackApp = void Function(int count, int total);

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


  ///----------------------------------------------------------------------- file

  Future<Response> uploadXFile(
      {required String url,
        required String fileRequestKeyInJson,
        required NetworkType networkFileType,
        required  XFile xFile,
        Map<String, dynamic>? body,
        Map<String, String>? headers,
        int? timeOutSecond,
        ProgressCallbackApp? onSendProgress,
        ProgressCallbackApp? onReceiveProgress}) async {
    try {
      Log.k(tag, "uploadXFile() - xFile: ${xFile}");

      //check not file
      if (ToolsValidation.isEmpty(xFile.path)) {
        return getFailedResponse(msg: "xFile.path not found");
      }

      //byte
      List<int> byte = await xFile.readAsBytes().then((value) {
        return value.cast();
      });
      Log.k(tag, 'uploadXFile() - byte ' + byte.length.toString());

      //generate cloud path
      var mp = await MultipartFile.fromBytes(byte,
          filename: xFile.path.toString() + xFile.name);
      Log.k(tag, "uploadXFile() - mp: " + mp.toString());

      //data
      var formData = FormData.fromMap({
        fileRequestKeyInJson: mp,
      });
      if (body != null) {
        body.forEach((key, value) {
          Log.k(tag,
              "uploadXFile() - body loop key: $key /value: $value");
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }
      Log.k(tag, "uploadXFile() - formData: " + formData.toString());

      /// dio
      Dio _dioFile = Dio();
      _dioFile.interceptors.add(PrettyDioLogger(
        requestHeader: isEnableLogDioPretty!,
        requestBody: isEnableLogDioPretty!,
        responseBody: isEnableLogDioPretty!,
      ));
      _dioFile.options.headers = headers;


      ///time out
      if (timeOutSecond != null) {
        _dioFile.options.connectTimeout = Duration(seconds: timeOutSecond!);
        _dioFile.options.receiveTimeout = Duration(seconds: timeOutSecond!);
      }

      switch (networkFileType) {
        case NetworkType.post:
          {
            return await _dioFile.post(url,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        case NetworkType.put:
          {
            return await _dioFile.put(url,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        case NetworkType.patch:
          {
            return await _dioFile.patch(url,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        default:
          {
            return await _dioFile.post(url,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }
      }
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(msg: e.toString() );
    }
  }


  //------------------------------------------------------------------------- any type

  Future<Response> _any(String url,
      NetworkType  type,
      {Map<String, dynamic>? body,
        Map<String, String>? headers,

        /// file
        NetworkRequestFile? requestFile,
        ProgressCallbackApp? onSendProgress,
        ProgressCallbackApp? onReceiveProgress,

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
    var configureHeaders = NetworkConfig.getConfigureHeaderFromCache();
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


  Future<Response> _chooseTypeNetworkThenStartService( {ProgressCallbackApp? onSendProgress, ProgressCallbackApp? onReceiveProgress}) async {

    // if (await InternetTools.isNotConnected()) {
    //   // return Left(ServerNoInternetConnectionFailure(  ));
    //   throw ServerNoInternetConnectionException(  );
    // }



      /// types: put,get,post,patch,delete
  if (type == NetworkType.post) {
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

///-------------------------------------------------------------------------- message



  Response getFailedResponseDioError({required DioException dioError}) {
    Log.k(
        tag, "getFailedResponseDioError() - dioError: " + dioError.toString());
    Log.k(
        tag,
        "getFailedResponseDioError() - dioError.type: " +
            dioError.type.toString());
    if (dioError.type == DioExceptionType.connectionTimeout ||
        dioError.type == DioExceptionType.sendTimeout ||
        dioError.type == DioExceptionType.receiveTimeout) {
      Log.k(tag, "getFailedResponseDioError() - type ( connectionTimeout) ");
      //return getFailedResponse(dioError.type);
      throw ServerTimeoutException();
    }
    Log.k(tag, "DioError - e: " + dioError.toString());
    if (dioError.response != null && dioError!.response!.data != null) {
      Log.k(
          tag,
          "DioError - statusCode: " +
              dioError!.response!.statusCode.toString());
      Map<String, dynamic> data = Map();
      if (dioError!.response!.data != null) {
        if (dioError!.response!.data is Map) {
          data = dioError!.response!.data;
        } else {
          data["data"] = dioError!.response!.data.toString();
        }
      }
      return dioError!.response!;
    } else {
      return getFailedResponse(msg: dioError.message);
    }
  }


  Response  getFailedResponse( {String? msg }) {
    return Response(requestOptions:  new RequestOptions(path:  msg != null ? msg : "failed request"));
  }

}

