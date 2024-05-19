import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/network/dio/NetworkManagerDio.dart';


extension DioParameter on NetworkManagerDio {


  Map<String, String> setDefaultHeader(Map<String, String>? custome) {

    custome ??= Map();

    /**
     * check already write another "Content-Type"
     */
    if (custome != null) {
      bool containAlready = custome.containsKey("Content-Type");
      if (containAlready) return custome;
    }

    /** - in web platform print error:
        Error: DioError [DioErrorType.response]: XMLHttpRequest error.
     */
    if( handleErrorXMLHttpRequest! ) {
      if(!custome.containsKey( "Access-Control-Allow-Origin")) {
        custome["Access-Control-Allow-Origin"]  = "*";
      }
      if(!custome.containsKey( "Content-Type")) {
        custome["Content-Type"]  = "application/json";
      }
      if(!custome.containsKey( "Accept")) {
        custome["Accept"]  = "*/*";
      }
      return custome!;
    }

    //default
    /**
     * the "POSTMAN" already found content-type hidden header already send by default
     * so we need here to pass this "Content-Type"
     */
    custome["Content-Type"] = "application/json";
    return custome!;
  }


   Response  getFailedResponse( {String? msg }) {
     return Response(requestOptions:  new RequestOptions(path:  msg != null ? msg : "failed request"));
   }

}