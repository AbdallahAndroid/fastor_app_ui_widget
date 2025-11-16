import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/network/ValidateResponse.dart';
import 'package:fastor_app_ui_widget/core/network/cache_json/cacher_json.dart';
import 'package:fastor_app_ui_widget/core/network/config/network_config.dart';
import 'package:fastor_app_ui_widget/core/network/error_failure/failure_exceptions.dart';
import 'package:fastor_app_ui_widget/core/network/internet/InternetTools.dart';
import 'package:fastor_app_ui_widget/core/network/network_file_type.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
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
  //---------------------------------------------- init

  static resetConfig() async {
    await _init(_baseUrl);
    await CacherJson.clearCache();
  }


  static _init(String baseUrl) async {
    ///set timeout
    _dioWithPretty.options.connectTimeout = Duration(seconds: 20);
    _dioWithPretty.options.receiveTimeout = Duration(seconds: 20);
    _dioWithPretty.options.sendTimeout = Duration(seconds: 20);
    _dioNoPrettyDioLogger.options.connectTimeout = Duration(seconds: 20);
    _dioNoPrettyDioLogger.options.receiveTimeout = Duration(seconds: 20);
    _dioNoPrettyDioLogger.options.sendTimeout = Duration(seconds: 20);

    /// add base
    _dioWithPretty.options.baseUrl = baseUrl;
    _dioNoPrettyDioLogger.options.baseUrl = baseUrl;

    /// add headers
    _dioWithPretty.options.headers =
    await NetworkConfig.getHeaders();
    _dioNoPrettyDioLogger.options.headers =
    await NetworkConfig.getHeaders();


    /// add pretty
    _dioWithPretty.interceptors.add(PrettyDioLogger(
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
  }

  ///------------------------------------------------------------- stream cache and remote

  static Stream<Response<dynamic>> getCacheAndRemoteStream(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? extraHeader,
        Map<String, dynamic>? parameters,
        bool? isEnableLogDioPretty,
      }) async* {
    try {
      /// 1️⃣ Try to load from cache first
      const String cacheMethod = "GET";
      final payload = body ?? parameters ?? {};
      final Map<String, dynamic> json = await CacherJson.getJson(
        methodType: cacheMethod,
        endpoint: endpoint,
        bodyOrParameter: payload,
      );
      if (isEnableLogDioPretty ?? false) Log.logBidData(json);
      final Response<dynamic> responseCache = mapJsonCacheToResponseDio(json);

      // 1st emission (cache)
      if (responseCache.statusCode == 200) {
        Log.i("getCacheStream() - found cache - $cacheMethod / $endpoint");
        yield responseCache;
      }

      // 🔄 Fetch remote in background
      final Response<dynamic> responseDio = await get(
        endpoint,
        extraHeader: extraHeader,
        body: body,
        parameters: parameters,
        isEnableLogDioPretty: false,
      );
      Log.i(
          "getCacheStream() - remote update - status: ${responseDio.statusCode}");

      if (ValidateResponse.isStatusFrom200To210Code(responseDio.statusCode)) {
        await CacherJson.setJson(
          methodType: cacheMethod,
          endpoint: endpoint,
          bodyOrParameter: payload,
          jsonData: responseDio.data,
        );
      }
      // 2nd emission (remote)
      yield responseDio;

      /// close stream
      return ;
    } catch (e) {
      Log.e("getCacheStream() - error: $e");
      // optional: yield an error response instead of throwing
      yield getFailedResponse(e);
      /// close stream
      return ;
    }
  }

  /***
   * -------------------- how to use
   *
   *:::::::::::::  1- datasource
      static  Stream<Either<Failure, ResponseCategories>>  getAll(   ) async* {
      var methodStreamNetwork = ApiUtil.postCacheAndRemoteStream(EndPoint.categoryGetAll,
      isEnableLogDioPretty: false   );

      await for (var responseDio in methodStreamNetwork) {
      Log.i("CategoryDataSource - getAll() - methodStreamNetwork statusCode: ${responseDio.statusCode}  ");
      if (ValidateResponse.isStatusFrom200To210Code(responseDio.statusCode)) {
      yield  right(await ResponseCategories().fromJson(responseDio.data));
      } else {
      yield  left(ThrowerTypeFailure.choose(responseDio));
      }
      }
      }


      ::::::::::::: 2- cubit
      emit(CategoryListLoadingState());
      var methodStreamEither = CategoryDataSource.getAll(  );
      await for (var either in methodStreamEither ) {
      Log.i("category - downloadAllCategory() - either $either  ");
      either.fold((l) {
      Log.i("category - downloadAllCategory() - failed $l  ");
      return emit( CategoryListFailedState(  HandleErrorMessageHelper.getMessage(l), null   ) ) ;
      }, (r) async {
      allDataCategory =  r.data;
      Log.i("category - downloadAllCategory() - allDataCategory len: ${allDataCategory.length} ");
      return emit( CategoryListSuccessState(  ) );
      });
      }
   */
  static Stream<Response<dynamic>> postCacheAndRemoteStream(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? extraHeader,
        Map<String, dynamic>? parameters,
        bool? isEnableLogDioPretty,
      }) async* {
    try {
      /// 1️⃣ Try to load from cache first
      const String cacheMethod = "POST";
      final payload = body ?? parameters ?? {};
      final Map<String, dynamic> json = await CacherJson.getJson(
        methodType: cacheMethod,
        endpoint: endpoint,
        bodyOrParameter: payload,
      );
      if (isEnableLogDioPretty ?? false) Log.logBidData(json);
      final Response<dynamic> responseCache = mapJsonCacheToResponseDio(json);

      // 1st emission (cache)
      if (responseCache.statusCode == 200) {
        Log.i("postCacheStream() - found cache - $cacheMethod / $endpoint");
        yield responseCache;
      }

      // 🔄 Fetch remote in background
      final Response<dynamic> responseDio = await post(
        endpoint,
        extraHeader: extraHeader,
        body: body,
        parameters: parameters,
        isEnableLogDioPretty: false,
      );
      Log.i(
          "postCacheStream() - remote update - status: ${responseDio.statusCode}");

      if (ValidateResponse.isStatusFrom200To210Code(responseDio.statusCode)) {
        await CacherJson.setJson(
          methodType: cacheMethod,
          endpoint: endpoint,
          bodyOrParameter: payload,
          jsonData: responseDio.data,
        );
      }
      // 2nd emission (remote)
      yield responseDio;

      /// close stream
      return ;
    } catch (e) {
      Log.e("postCacheStream() - error: $e");
      // optional: yield an error response instead of throwing
      yield getFailedResponse(e);
      /// close stream
      return ;
    }
  }


  //------------------------------------------------------------- cache or remote

  static Future<Response<dynamic>> getCacheOrRemote(String endpoint,{
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeader,
    Map<String, dynamic>? parameters,
    bool? isEnableLogDioPretty,
  }) async {

    /// get from cache
    String cacheMethod = "GET";
    var payload = body??parameters??Map();
    Map<String, dynamic> json = await CacherJson.getJson(methodType: cacheMethod, endpoint: endpoint, bodyOrParameter: payload );
    if(isEnableLogDioPretty??false ) Log.logBidData(json );
    Response<dynamic> responseCache = mapJsonCacheToResponseDio( json );

    ///case: success found data at cache >>
    ///   >> redownload from remote then update at cache
    ///   >> return result speedly from cache without waiting from remote
    if( responseCache.statusCode == 200 ) {
      Log.i("getCache() - found cache - method: $cacheMethod /endpoint: $endpoint");
      get(endpoint,
          extraHeader: extraHeader,
          body: body,
          parameters: parameters,
          isEnableLogDioPretty: false
      ).then( (Response<dynamic>  responseDio )async {
        Log.i("getCache() - redownload and update from remote - remote status: ${responseDio.statusCode}");
        if(ValidateResponse.isStatusFrom200To210Code(responseDio.statusCode) ) {
          await CacherJson.setJson(methodType: cacheMethod, endpoint: endpoint, bodyOrParameter: payload, jsonData: responseDio.data );
        }
      });
      return responseCache ;
    }

    /// case : download data from remote first time
    ///       >> set to cache first time
    var responseDioFirstTime =  await  get(endpoint,
        extraHeader: extraHeader,
        body: body,
        parameters: parameters,
        isEnableLogDioPretty: isEnableLogDioPretty
    ) ;
    Log.i("getCache() - not found data at cache so must download first time from remote - status: ${responseDioFirstTime.statusCode}");
    if(ValidateResponse.isStatusFrom200To210Code(responseDioFirstTime.statusCode) ) {
      await CacherJson.setJson(methodType: cacheMethod, endpoint: endpoint, bodyOrParameter: payload,
          jsonData: responseDioFirstTime.data );
    }
    return  responseDioFirstTime;
  }


  static Future<Response<dynamic>> postCacheOrRemote(String endpoint,{
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeader,
    Map<String, dynamic>? parameters,
    bool? isEnableLogDioPretty,
  }) async {
    Log.i("postCache() - start endpoint: $endpoint");

    /// get from cache
    String cacheMethod = "POST";
    var payload = body??parameters??Map();
    Map<String, dynamic> json = await CacherJson.getJson(methodType: cacheMethod, endpoint: endpoint, bodyOrParameter: payload );
    // Log.i("postCache() - json cache: $json");
    if(isEnableLogDioPretty??false ) Log.logBidData(json );
    Response<dynamic> responseCache = mapJsonCacheToResponseDio( json );

    ///case: success data in cache >>
    ///   >> redownload nad update from remote
    ///   >> return result speedly from cache
    if( responseCache.statusCode == 200 ) {
      Log.i("postCache() - found cache success");
      post(endpoint,
          extraHeader: extraHeader,
          body: body,
          parameters: parameters,
          isEnableLogDioPretty: false
      ).then( (Response<dynamic>  responseDio )async {
        Log.i("postCache() - redownload and update from remote - remote status: ${responseDio.statusCode}");
        if(ValidateResponse.isStatusFrom200To210Code(responseDio.statusCode) ) {
          await CacherJson.setJson(methodType: cacheMethod, endpoint: endpoint, bodyOrParameter: payload, jsonData: responseDio.data );
        }
      });
      return responseCache;
    }


    /// case : download data from remote first time
    ///       >> set to cache first time

    var responseDioFirstTime =  await  post(endpoint,
        extraHeader: extraHeader,
        body: body,
        parameters: parameters,
        isEnableLogDioPretty: isEnableLogDioPretty
    ) ;
    Log.i("postCache() - not found data at cache so must download first time from remote - status: ${responseDioFirstTime.statusCode}");
    if(ValidateResponse.isStatusFrom200To210Code(responseDioFirstTime.statusCode) ) {
      await CacherJson.setJson(methodType: cacheMethod, endpoint: endpoint, bodyOrParameter: payload,
          jsonData: responseDioFirstTime.data );
    }
    return  responseDioFirstTime;
  }

  ///------------------------------------------------------------- normal  types

  static Future<Response<dynamic>> get(String endpoint,{
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeader,
    Map<String, dynamic>? parameters,
    bool? isEnableLogDioPretty,
  }) async {
    // if (await InternetTools.isNotConnected()) {
    //   throw ServerNoInternetConnectionException();
    // }

    try {

      var dio = getDioType(
        isEnableLogDioPretty: isEnableLogDioPretty ?? false,
      );
      dio.options.headers.addAll(extraHeader ?? Map());

      var response = await dio.get(
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

  static Future<Response<dynamic>> post(
      String endpoint, {
        dynamic body,
        Map<String, dynamic>? parameters,
        bool? isEnableLogDioPretty,
        Map<String, dynamic>? extraHeader}) async {

    // if (await InternetTools.isNotConnected()) {
    //   throw ServerNoInternetConnectionException();
    // }
    try {
      var dio = getDioType(
        isEnableLogDioPretty: isEnableLogDioPretty ?? false,
      );
      dio.options.headers.addAll(extraHeader ?? Map());
      return await dio.post(endpoint,
          data: body, queryParameters: parameters);
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(e);
    }
  }

  static Future<Response<dynamic>> put(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? extraHeader,
        bool? isEnableLogDioPretty,
        Map<String, dynamic>? parameters}) async {
    // if (await InternetTools.isNotConnected()) {
    //   throw ServerNoInternetConnectionException();
    // }

    try {
      var dio = getDioType(
        isEnableLogDioPretty: isEnableLogDioPretty ?? false,
      );
      dio.options.headers.addAll(extraHeader ?? Map());
      return await dio.put(endpoint,
          data: body, queryParameters: parameters);
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(e);
    }
  }

  static Future<Response<dynamic>> delete(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? extraHeader,
        bool? isEnableLogDioPretty,
        Map<String, dynamic>? parameters}) async {
    // if (await InternetTools.isNotConnected()) {
    //   throw ServerNoInternetConnectionException();
    // }

    try {
      var dio = getDioType(
        isEnableLogDioPretty: isEnableLogDioPretty ?? false,
      );
      dio.options.headers.addAll(extraHeader ?? Map());
      return await dio.delete(endpoint,
          data: body, queryParameters: parameters);
    } on DioException catch (dioError) {
      return getFailedResponseDioError(dioError: dioError);
    } catch (e) {
      return getFailedResponse(e);
    }
  }

  ///--------------------------------------------------------------- file

  static  Future<Response> uploadXFile(
      String endpoint, {
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
        _dioWithPretty.options.connectTimeout = Duration(seconds: timeOutSecond!);
        _dioWithPretty.options.receiveTimeout = Duration(seconds: timeOutSecond!);
      }

      switch (networkFileType) {
        case NetworkFileType.post:
          {
            return await _dioWithPretty.post(endpoint,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        case NetworkFileType.put:
          {
            return await _dioWithPretty.put(endpoint,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        case NetworkFileType.patch:
          {
            return await _dioWithPretty.patch(endpoint,
                data: formData,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress);
          }

        default:
          {
            return await _dioWithPretty.post(endpoint,
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

  ///---------------------------------------------------------   helper methods

  static Dio getDioType({
    bool isEnableLogDioPretty = false,
  }) {
    if (isEnableLogDioPretty) return _dioWithPretty;
    return _dioNoPrettyDioLogger;
  }

  static  Response getFailedResponseDioError({required DioException dioError}) {

    if (dioError.type == DioExceptionType.connectionTimeout ||
        dioError.type == DioExceptionType.sendTimeout ||
        dioError.type == DioExceptionType.receiveTimeout) {
      return getFailedResponse( "time out");
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

  static  Response getFailedResponse(e) {
    String msg = e.toString();
    return Response(
        requestOptions:
        new RequestOptions(path: msg != null ? msg : "failed request"));
  }


  static  Response mapJsonCacheToResponseDio(Map<String, dynamic> json ) {
    if( json.isEmpty ) {
      return Response(
          statusCode: 400,
          data: json ,
          requestOptions:
          new RequestOptions(path:  "failed", data: json ));
    } {
      return Response(
          statusCode: 200,
          data: json ,
          requestOptions:
          new RequestOptions(path:  "success", data: json ));
    }

  }

}