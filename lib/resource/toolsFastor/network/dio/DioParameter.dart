import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';

extension DioParameter on NetworkManagerDio {


  //------------------------------------------------------------------------- header

   Map<String, String> setDefaultHeader(Map<String, String>? custome) {
    /**
     * check already write another "Content-Type"
     */
    if (custome != null) {
      bool containAlready = custome.containsKey("Content-Type");
      if (containAlready) return custome;
    }

    //default
    /**
     * the "POSTMAN" already found content-type hidden header already send by default
     * so we need here to pass this "Content-Type"
     */
    custome ??= Map();
    custome["Content-Type"] = "application/json";
    return custome;
  }


  Response _getFailedResponse() {
    return Response(requestOptions:  new RequestOptions(path:  "not-found"));
  }

}