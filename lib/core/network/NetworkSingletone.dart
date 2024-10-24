
import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/NetworkRequestFile.dart';
import 'package:fastor_app_ui_widget/core/network/config/network_config.dart';
import 'package:fastor_app_ui_widget/core/network/dio/NetworkManagerDio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:universal_io/io.dart';


class NetworkHelperSingleTone {

  ///--------------------------------------------------------------- variable

  static final tag = "NetworkHelperSingleTone";

  static bool _isSync = false;
  static Dio _dio = Dio();
  static int _timeOutSecond =  10;

  ///--------------------------------------------------------------- singletone

  NetworkHelperSingleTone._();

  static NetworkHelperSingleTone instance(){
    if( ! _isSync ) {
      _isSync = true;
      _setupDio();
    }
    return NetworkHelperSingleTone._();
  }


  static void _setupDio() {
    _dio.options.headers = NetworkConfig.getConfigureHeaderFromCache();
    _dio.options.connectTimeout = Duration( seconds: _timeOutSecond  )  ;
    _dio.options.receiveTimeout =  Duration( seconds: _timeOutSecond! );
  }


  static setLogout(){
    _dio = Dio();
    _dio.options.headers =   NetworkConfig.guestType();
    Log.k(tag,"setLogout() - _dio.options.headers: ${_dio.options.headers}");
  }


  static setLogin(String token ){
    _dio = Dio();
    _dio.options.headers =   NetworkConfig.loginType(token);
    Log.k(tag,"setLogin() - _dio.options.headers: ${_dio.options.headers}");
  }

  ///--------------------------------------------------------------- methods network

  Future<Response> get(String url,
      {Map<String, dynamic>? body,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest }) async {
    setTypePretty(isEnableLogDioPretty);
    try {
      return   await _dio.get(url, );
    } on DioException catch (dioError) {
      return getFailedResponseDioError( dioError: dioError );
    } catch (e) {
      return getFailedResponse(  e  );
    }
  }


  Future<Response> post(String url,
      {Map<String, dynamic>? body,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest }) async {
    setTypePretty(isEnableLogDioPretty);
    try {
      return   await _dio.post(url, data: body );
    } on DioException catch (dioError) {
      return getFailedResponseDioError( dioError: dioError );
    } catch (e) {
      return getFailedResponse(  e  );
    }
  }


  Future<Response> put(String url,
      {Map<String, dynamic>? body,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest }) async {
    setTypePretty(isEnableLogDioPretty);
    try {
      return   await _dio.put(url, data: body );
    } on DioException catch (dioError) {
      return getFailedResponseDioError( dioError: dioError );
    } catch (e) {
      return getFailedResponse(  e  );
    }
  }



  Future<Response> delete(String url,
      {Map<String, dynamic>? body,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest }) async {
    setTypePretty(isEnableLogDioPretty);
    try {
      return   await _dio.delete(url, data: body );
    } on DioException catch (dioError) {
      return getFailedResponseDioError( dioError: dioError );
    } catch (e) {
      return getFailedResponse(  e  );
    }
  }


  Future<Response> patch(String url,
      {Map<String, dynamic>? body,
        int?  timeOutSecond,
        bool? isEnableLogDioPretty ,
        bool?  handleErrorXMLHttpRequest }) async {
    setTypePretty(isEnableLogDioPretty);
    try {
      return   await _dio.patch(url, data: body );
    } on DioException catch (dioError) {
      return getFailedResponseDioError( dioError: dioError );
    } catch (e) {
      return getFailedResponse(  e  );
    }
  }

  ///--------------------------------------------------------------- file


  Future<Response> file(String url, {
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
        ProgressCallbackApp? onSendProgress,
        ProgressCallbackApp? onReceiveProgress,
        bool?  handleErrorXMLHttpRequest } ) async {

    return NetworkManagerDio().file(url,
        fileRequestKeyInJson: fileRequestKeyInJson,
        body: body,
        headers: headers,
        xFileToUpload: xFileToUpload,
        fileToUpload: fileToUpload,
      formData: formData,
      requestFile: requestFile,
      isTypeMethodPUT: isTypeMethodPUT,
      isEnableLogDioPretty: isEnableLogDioPretty,
      timeOutSecond: timeOutSecond,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      handleErrorXMLHttpRequest: handleErrorXMLHttpRequest
    );
  }
    ///--------------------------------------------------------- failure helper methods

  Response  getFailedResponseDioError( {required DioException  dioError   }) {

    if( dioError.type == DioExceptionType.connectionTimeout ) {
      return getFailedResponse( dioError.type);
    }
    Log.k(tag, "DioError - e: " + dioError.toString());
    if( dioError.response != null && dioError!.response!.data != null ) {
      Log.k(tag, "DioError - statusCode: " + dioError!.response!.statusCode.toString());
      Map<String,dynamic> data = Map();
      if( dioError!.response!.data != null ) {
        if( dioError!.response!.data is Map ) {
          data = dioError!.response!.data;
        } else {
          data["data"] = dioError!.response!.data.toString();
        }
      }
      return dioError!.response!;
    } else {
      return getFailedResponse( dioError  );
    }
  }


  Response  getFailedResponse(   e   ) {
    String msg = e.toString();
    Log.k(tag, "getFailedResponse() - e: " + msg);
    return Response(requestOptions:  new RequestOptions(path:  msg != null ? msg : "failed request"));
  }


  void setTypePretty(bool? isEnableLogDioPretty) {
    isEnableLogDioPretty ??= true;
    //show request and response in beatful log
    if( isEnableLogDioPretty! ) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true, //isEnableLogDioPretty!,
        responseBody: true,
      ));
    } else {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: false ,
      ));
    }
  }



}