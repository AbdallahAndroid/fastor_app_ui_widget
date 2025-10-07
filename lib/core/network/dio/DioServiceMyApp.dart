import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/network/dio/NetworkManagerDio.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import 'DioParameter.dart';


import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import 'DioParameter.dart';

extension DioServiceFastor on NetworkManagerDio {


  //--------------------------------------------------------------------------- get

  Future<Response> get_dio() async {
    Response? response;
    var _dio = Dio();

    //show request and response in beatful log
    if (isEnableLogDioPretty!) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: isEnableLogDioPretty!,
        requestBody: isEnableLogDioPretty!,
        responseBody: isEnableLogDioPretty!,
      ));
    }

    //time out have issue between version "4 and 5"
    /**
        if(timeOutSecond != null ) {
        _dio.options.connectTimeout = Duration( seconds: timeOutSecond! )  ;
        _dio.options.receiveTimeout =  Duration( seconds: timeOutSecond! );
        }
     */
    _dio.options.headers = headers;

    try {
      response = await _dio.get(url,);
      // Log.k( tag, "_get_dio() - success: "  + response.toString()  );

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);
      //return
      return response;
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(msg: e.toString());
    }
  }

  //--------------------------------------------------------------------------- post

  Future<Response>  post_dio() async {
    Response? response;

    try {
      // FormData form = FormData.fromMap(body);

      Dio _dio = Dio();

      //show request and response in beatful log
      if (isEnableLogDioPretty!) {
        _dio.interceptors.add(PrettyDioLogger(
          requestHeader: isEnableLogDioPretty!,
          requestBody: isEnableLogDioPretty!,
          responseBody: isEnableLogDioPretty!,
        ));
      }

      //time out have issue between version "4 and 5"
      /**
          if(timeOutSecond != null ) {
          _dio.options.connectTimeout = Duration( seconds: timeOutSecond! )  ;
          _dio.options.receiveTimeout =  Duration( seconds: timeOutSecond! );
          }
       */

      _dio.options.headers = headers;

      response = await _dio.post(url, data: body);
      //Log.k(tag, "_post_dio() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(msg: e.toString());
    }
  }

  //--------------------------------------------------------------------------- put

  Future<Response>  put_dio() async {
    Response? response;
    try {
      // FormData form = FormData.fromMap(body);

      Dio _dio = Dio();

      //show request and response in beatful log
      if (isEnableLogDioPretty!) {
        _dio.interceptors.add(PrettyDioLogger(
          requestHeader: isEnableLogDioPretty!,
          requestBody: isEnableLogDioPretty!,
          responseBody: isEnableLogDioPretty!,
        ));
      }

      //time out have issue between version "4 and 5"
      /**
          if(timeOutSecond != null ) {
          _dio.options.connectTimeout = Duration( seconds: timeOutSecond! )  ;
          _dio.options.receiveTimeout =  Duration( seconds: timeOutSecond! );
          }
       */

      _dio.options.headers = headers;

      response = await _dio.put(url, data: body);
      // Log.k(tag, "_put() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(msg: e.toString());
    }
  }

  //--------------------------------------------------------------------------- patch

  Future<Response>  patch_dio() async {
    Response? response;
    try {
      // FormData form = FormData.fromMap(body);

      Dio _dio = Dio();

      //show request and response in beatful log
      if (isEnableLogDioPretty!) {
        _dio.interceptors.add(PrettyDioLogger(
          requestHeader: isEnableLogDioPretty!,
          requestBody: isEnableLogDioPretty!,
          responseBody: isEnableLogDioPretty!,
        ));
      }

      //time out have issue between version "4 and 5"
      /**
          if(timeOutSecond != null ) {
          _dio.options.connectTimeout = Duration( seconds: timeOutSecond! )  ;
          _dio.options.receiveTimeout =  Duration( seconds: timeOutSecond! );
          }
       */
      _dio.options.headers = headers;

      response = await _dio.patch(url, data: body);
      // Log.k(tag, "_put() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(msg: e.toString());
    }
  }

  //--------------------------------------------------------------------------- delete

  Future<Response>  delete_dio() async {
    Response? response;
    try {
      // FormData form = FormData.fromMap(body);

      Dio _dio = Dio();

      //show request and response in beatful log
      if (isEnableLogDioPretty!) {
        _dio.interceptors.add(PrettyDioLogger(
          requestHeader: isEnableLogDioPretty!,
          requestBody: isEnableLogDioPretty!,
          responseBody: isEnableLogDioPretty!,
        ));
      }

      //time out have issue between version "4 and 5"
      /**
          if(timeOutSecond != null ) {
          _dio.options.connectTimeout = Duration( seconds: timeOutSecond! )  ;
          _dio.options.receiveTimeout =  Duration( seconds: timeOutSecond! );
          }
       */
      _dio.options.headers = headers;

      response = await _dio.delete(url, data: body);
      // Log.k(tag, "_put() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(msg: e.toString());
    }
  }


}
