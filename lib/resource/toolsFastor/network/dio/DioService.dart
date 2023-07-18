import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import 'DioParameter.dart';

extension DioService on NetworkManagerDio {


  //--------------------------------------------------------------------------- get

  Future<Response> get_dio() async {
    Response? response;
    var _dio = Dio();

    //show request and response in beatful log
    if( isEnableLogDioPretty! ) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: isEnableLogDioPretty!,
        requestBody: isEnableLogDioPretty!,
        responseBody: isEnableLogDioPretty!,
      ));
    }

    try {

      response = await _dio.get(url, options: Options(headers: headers));
      // Log.k( tag, "_get_dio() - success: "  + response.toString()  );

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);
      //return
      return response;
    } on DioError catch (dioError) {
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
        if (callback_dio != null) callback_dio!(false, "failed", data);
        return dioError!.response!;
      } else {
        if (callback_dio != null) callback_dio!(false, "failed",  Map() );
        return getFailedResponse(msg: dioError.toString() );
      }

    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_get_dio() - e: " + msg);
      if (callback_dio != null) callback_dio!(false, msg, Map());
      return getFailedResponse(msg: e.toString() );
    }

  }

  //--------------------------------------------------------------------------- post

  Future<Response>  post_dio() async {
    Response? response ;

    try {
      // FormData form = FormData.fromMap(body);

      Dio _dio = Dio();

      //show request and response in beatful log
      if( isEnableLogDioPretty! ) {
        _dio.interceptors.add(PrettyDioLogger(
          requestHeader: isEnableLogDioPretty!,
          requestBody: isEnableLogDioPretty!,
          responseBody: isEnableLogDioPretty!,
        ));
      }


      response = await _dio.post(url, options: Options(headers: headers), data: body);
      //Log.k(tag, "_post_dio() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioError catch (dioError) {
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
        if (callback_dio != null) callback_dio!(false, "failed", data);
        return dioError!.response!;
      } else {
        if (callback_dio != null) callback_dio!(false, "failed",  Map() );
        return getFailedResponse(msg: dioError.toString() );
      }

    } catch (e,s) {
      String msg = e.toString();
      if( isEnableLogDioPretty! ) {
        Log.k(tag, "_post_dio() - e: " + msg);
      }
      Log.k(tag, "_post_dio() - response: " + response.toString() );
      Log.k(tag, "_post_dio() - s: " + s.toString() );
      if (callback_dio != null) callback_dio!(false, msg, Map());
      if( response != null ) {
        return response;
      }
      return getFailedResponse(msg: e.toString() );
    }
  }

  //--------------------------------------------------------------------------- put

  Future<Response>  put_dio() async {
    Response? response ;
    try {
      // FormData form = FormData.fromMap(body);

      Dio _dio = Dio();

      //show request and response in beatful log
      if( isEnableLogDioPretty! ) {
        _dio.interceptors.add(PrettyDioLogger(
          requestHeader: isEnableLogDioPretty!,
          requestBody: isEnableLogDioPretty!,
          responseBody: isEnableLogDioPretty!,
        ));
      }


      response =   await _dio.put(url, options: Options(headers: headers), data: body);
      // Log.k(tag, "_put() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioError catch (dioError) {
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
        if (callback_dio != null) callback_dio!(false, "failed", data);
        return dioError!.response!;
      } else {
        if (callback_dio != null) callback_dio!(false, "failed",  Map() );
        return getFailedResponse(msg: dioError.toString() );
      }

    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_put() - e: " + msg);
      if (callback_dio != null) callback_dio!(false, msg, Map());
      return getFailedResponse(msg: e.toString() );
    }

  }

  //---------------------------------------------------------------------------- file

  Future<Response>  file_dio() async {
    Response? response ;
    try {
      Log.k(tag, "_file() - requestFile: " + requestFile.toString() );
      // Log.k(tag, "_file() - body: " + body.toString());

      //check not file
      if (ToolsValidation.isEmpty(requestFile!.filePath)) {
        if (callback_dio != null)
          callback_dio!(false, "filePath not found", Map());
        return getFailedResponse();
      }



      //data
      var formData = FormData.fromMap({
        requestFile!.parameterFile : await MultipartFile.fromFile( requestFile!.filePath!), //'file'
        "${requestFile!.body_key1}": "${requestFile!.body_value1}",
        "${requestFile!.body_key2}": "${requestFile!.body_value2}",
        "${requestFile!.body_key3}": "${requestFile!.body_value3}",
        "${requestFile!.body_key4}": "${requestFile!.body_value4}",
        "${requestFile!.body_key5}": "${requestFile!.body_value5}",
        "${requestFile!.body_key6}": "${requestFile!.body_value6}",
        "${requestFile!.body_key7}": "${requestFile!.body_value7}",
        "${requestFile!.body_keyMoreThan7}": requestFile!.body_valueMoreThan7,
      });

      Log.k(tag, "_file() - formData: " + formData.toString());

      Dio _dio = Dio();
      //show request and response in beatful log
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: isEnableLogDioPretty!,
        requestBody: isEnableLogDioPretty!,
        responseBody: isEnableLogDioPretty!,
      ));

      response = await _dio.post(url,
          options: Options(headers: headers), data: formData);
      Log.k(tag, "_file() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioError catch (dioError) {
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
        if (callback_dio != null) callback_dio!(false, "failed", data);
        return dioError!.response!;
      } else {
        if (callback_dio != null) callback_dio!(false, "failed",  Map() );
        return getFailedResponse(msg: dioError.toString() );
      }

    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_file() - e: " + msg);
      if (callback_dio != null) callback_dio!(false, msg, Map());
      return getFailedResponse(msg: e.toString() );
    }

  }


  Future<Response >  fileTypeXFile_dio() async {
    Response? response ;
    try {
      Log.k(tag, "_fileTypeXFile() - xFile: " + requestFile!.xFile!.path.toString() );


      //check not file
      if (ToolsValidation.isEmpty(requestFile!.xFile!.path)) {
        if (callback_dio != null)
          callback_dio!(false, "filePath not found", Map());
        return getFailedResponse();
      }

      //byte
      List<int> byte = await requestFile!.xFile!.readAsBytes().then((value) {
        return value.cast();
      });
      Log.k(tag, '_fileTypeXFile() - byte ' + byte.length.toString() );

      //generate cloud path
      //  String fileName = ToolsFile.getFileNameWithoutExtenstion( filePath );
      var mp = await MultipartFile.fromBytes( byte,
          filename: requestFile!.xFile!.path.toString() + requestFile!.xFile!.name
      );
      Log.k(tag, "_fileTypeXFile() - mp: " + mp.toString() );

      //data
      var formData = FormData.fromMap({
        'file': mp,
      });
      Log.k(tag, "_fileTypeXFile() - formData: " + formData.toString());

      Dio _dio = Dio();

      //show request and response in beatful log
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: isEnableLogDioPretty!,
        requestBody: isEnableLogDioPretty!,
        responseBody: isEnableLogDioPretty!,
      ));

      response = await _dio.post(url,
          options: Options(headers: headers), data: formData);
      // Log.k(tag, "_fileTypeXFile() - success: " + response.toString());

      //call back
      if (callback_dio != null) callback_dio!(true, "success", response.data);

      //return
      return response;
    } on DioError catch (dioError) {
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
        if (callback_dio != null) callback_dio!(false, "failed", data);
        return dioError!.response!;
      } else {
        if (callback_dio != null) callback_dio!(false, "failed",  Map() );
        return getFailedResponse(msg: dioError.toString() );
      }

    } catch (e) {
      String msg = e.toString();
      Log.k(tag, "_fileTypeXFile() - e: " + msg);
      if (callback_dio != null) callback_dio!(false, "Falied to Upload File", Map());

      return getFailedResponse(msg: e.toString() );
    }
  }


}