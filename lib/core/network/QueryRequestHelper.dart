
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';

class QueryRequestHelper {


  static String mapToQueryFilterNullValue(String endpoint, Map<String, dynamic> map) {

    String resultQuery = "";

    List<String?> listQuery=  map.entries.map((entry) {
      final key = Uri.encodeComponent(entry.key);
      final value = Uri.encodeComponent(entry.value.toString());
      if(ToolsValidation.isEmpty( value )) return null ;
      return '$key=$value';
    }).toList();


    int validCounter = 0;
    listQuery.forEach(( singleQuery ) {

      if(singleQuery != null ) {
        bool firstVailedQuery  = validCounter == 0;
        if(firstVailedQuery ) {
          resultQuery += "$singleQuery";
        } else {
          resultQuery += "&$singleQuery";
        }
        validCounter++;
      }

    });

    String fullUrlWithParameter =  endpoint + "?" + resultQuery;
    Log.i("QueryRequestHelper - fullUrlWithParameter: $fullUrlWithParameter");
    return fullUrlWithParameter;
  }

}