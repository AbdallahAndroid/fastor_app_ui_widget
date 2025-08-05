import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/network/config/network_config.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failure_exceptions.dart';
import 'package:fastor_app_ui_widget/core/network/internet/InternetTools.dart';
import 'package:fastor_app_ui_widget/core/network/network_file_type.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:image_picker/image_picker.dart' as picker;

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

typedef ProgressCallbackApp = void Function(int count, int total);

/// how to use with "di"
/**
    /// network
    ApiUtil api = await ApiUtil.instance();
    sl.registerLazySingleton<ApiUtil>(() => api);

 */
class ApiUtil {
  static Dio _dioWithPretty = Dio();
  static Dio _dioNoPrettyDioLogger = Dio();
  static Dio _dioFile = Dio();
  static String _baseUrl = "";

  /// when make it "true" casuing foreverr show
  static bool isForceEnableLogsPrettyDio = false;

  String tag = "ApiUtil";

  ///----------------------------------------------------- singletone

  ApiUtil._();

  static Future<ApiUtil> instance(String baseUrl) async {
    ApiUtil._baseUrl = baseUrl;
    await _init(baseUrl);
    return ApiUtil._();
  }

  static _init(String baseUrl) async {
    ///set timeout
    _dioWithPretty.options.connectTimeout = Duration(seconds: 20);
    _dioWithPretty.options.receiveTimeout = Duration(seconds: 20);
    _dioWithPretty.options.sendTimeout = Duration(seconds: 20);
    _dioNoPrettyDioLogger.options.connectTimeout = Duration(seconds: 20);
    _dioNoPrettyDioLogger.options.receiveTimeout = Duration(seconds: 20);
    _dioNoPrettyDioLogger.options.sendTimeout = Duration(seconds: 20);
    _dioFile.options.connectTimeout = Duration(seconds: 60);
    _dioFile.options.receiveTimeout = Duration(seconds: 60);
    _dioFile.options.sendTimeout = Duration(seconds: 60);

    /// add base
    _dioWithPretty.options.baseUrl = baseUrl;
    _dioNoPrettyDioLogger.options.baseUrl = baseUrl;
    _dioFile.options.baseUrl = baseUrl;

    /// add headers
    _dioWithPretty.options.headers =
        await NetworkConfig.getConfigureHeaderFromCache();
    _dioNoPrettyDioLogger.options.headers =
        await NetworkConfig.getConfigureHeaderFromCache();
    _dioFile.options.headers =
        await NetworkConfig.getConfigureHeaderFromCache();

    /// add pretty
    _dioWithPretty.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
    _dioFile.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));

    /// valid
    _dioWithPretty.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 500;
    };
    _dioNoPrettyDioLogger.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 500;
    };
    _dioFile.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 500;
    };
  }

  //---------------------------------------------- init

  static setLogout() async {
    await _init(ApiUtil._baseUrl);
  }

  static setLogin(String token, String? userPanel) async {
    await _init(ApiUtil._baseUrl);
  }

  //------------------------------------------------------------- types

  Future<Response<dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeader,
    Map<String, dynamic>? parameters,
    bool? isEnableLogDioPretty,
  }) async {
    if (await InternetTools.isNotConnected()) {
      throw ServerNoInternetConnectionException();
    }

    try {
      if (isEnableLogDioPretty != null) {
        if (isEnableLogDioPretty) {
          return await _dioWithPretty.get(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else if( isForceEnableLogsPrettyDio) {
          return await _dioWithPretty.get(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else {
          return await _dioNoPrettyDioLogger.get(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        }
      }
      var response = await _dioNoPrettyDioLogger.get(
        endpoint,
        data: body,
        queryParameters: parameters,
      );
      return response;
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(e);
    }
  }

  Future<Response<dynamic>> post(
      {required String endpoint,
      dynamic body,
      Map<String, dynamic>? parameters,
      bool? isEnableLogDioPretty,
      Map<String, dynamic>? extraHeader}) async {

    if (await InternetTools.isNotConnected()) {
      throw ServerNoInternetConnectionException();
    }
    try {
      if (isEnableLogDioPretty != null) {
        if (isEnableLogDioPretty) {
          return await _dioWithPretty.post(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else if( isForceEnableLogsPrettyDio) {
          return await _dioWithPretty.post(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else {
          return await _dioNoPrettyDioLogger.post(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        }
      }

      return await _dioWithPretty.post(endpoint,
          data: body, queryParameters: parameters);
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(e);
    }
  }

  Future<Response<dynamic>> put(
      {required String endpoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? extraHeader,
      bool? isEnableLogDioPretty,
      Map<String, dynamic>? parameters}) async {
    if (await InternetTools.isNotConnected()) {
      throw ServerNoInternetConnectionException();
    }

    try {
      if (isEnableLogDioPretty != null) {
        if (isEnableLogDioPretty) {
          return await _dioWithPretty.put(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else if( isForceEnableLogsPrettyDio) {
          return await _dioWithPretty.put(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else {
          return await _dioNoPrettyDioLogger.put(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        }
      }

      return await _dioNoPrettyDioLogger.put(endpoint,
          data: body, queryParameters: parameters);
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(e);
    }
  }

  Future<Response<dynamic>> delete(
      {required String endpoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? extraHeader,
      bool? isEnableLogDioPretty,
      Map<String, dynamic>? parameters}) async {
    if (await InternetTools.isNotConnected()) {
      throw ServerNoInternetConnectionException();
    }

    try {
      if (isEnableLogDioPretty != null) {
        if (isEnableLogDioPretty) {
          return await _dioWithPretty.delete(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else if( isForceEnableLogsPrettyDio) {
          return await _dioWithPretty.delete(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        } else {
          return await _dioNoPrettyDioLogger.delete(
            endpoint,
            data: body,
            queryParameters: parameters,
          );
        }
      }

      return await _dioNoPrettyDioLogger.delete(endpoint,
          data: body, queryParameters: parameters);
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(e);
    }
  }

  ///--------------------------------------------------------------- file

  Future<Response> uploadXFile(
      {required String url,
      required String fileRequestKeyInJson,
      required NetworkFileType networkFileType,
      required picker.XFile xFile,
      Map<String, dynamic>? body,
      Map<String, String>? headers,
      int? timeOutSecond,
      ProgressCallbackApp? onSendProgress,
      ProgressCallbackApp? onReceiveProgress}) async {
    try {

      //check not file
      if (ToolsValidation.isEmpty(xFile.path)) {
        return getFailedResponse("xFile.path not found");
      }

      //byte
      List<int> byte = await xFile.readAsBytes().then((value) {
        return value.cast();
      });

      //generate cloud path
      var mp = await MultipartFile.fromBytes(byte,
          filename: xFile.path.toString() + xFile.name);

      //data
      var formData = FormData.fromMap({
        fileRequestKeyInJson: mp,
      });
      if (body != null) {
        body.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      ///time out
      if (timeOutSecond != null) {
        _dioFile.options.connectTimeout = Duration(seconds: timeOutSecond!);
        _dioFile.options.receiveTimeout = Duration(seconds: timeOutSecond!);
      }

      switch (networkFileType) {
        case NetworkFileType.post:
          {
            return await _dioFile.post(url,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        case NetworkFileType.put:
          {
            return await _dioFile.put(url,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        case NetworkFileType.patch:
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
      return getFailedResponse(e);
    }
  }

  ///--------------------------------------------------------- failure helper methods

  Response getFailedResponseDioError({required DioException dioError}) {
    if (dioError.type == DioExceptionType.connectionTimeout ||
        dioError.type == DioExceptionType.sendTimeout ||
        dioError.type == DioExceptionType.receiveTimeout) {
      throw ServerTimeoutException();
    }
    if (dioError.response != null && dioError!.response!.data != null) {
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
      return getFailedResponse(dioError);
    }
  }

  Response getFailedResponse(e) {
    String msg = e.toString();
    return Response(
        requestOptions:
            new RequestOptions(path: msg != null ? msg : "failed request"));
  }
}