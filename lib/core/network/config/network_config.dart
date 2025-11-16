

import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';

class NetworkConfig{

  static   Map<String,String>  getHeaders()     {
    Map<String, String>? _headers       = Map();
    if( UserHelper.isGuest()  ) {
      _headers =  guestType(      );
    } else {
      _headers =  loginType( UserHelper.getToken()  );
    }
    _headers!["Accept"] = "application/json";
    return _headers!;
  }


  static Map<String, String > guestType(  ) {
    Map<String, String > header = Map();
    header[ "lang"] =  LangApp.isArabic ? "ar" : "en";
    header!["Accept"] = "application/json";
    return header;
  }


  static Map<String, String > loginType(String token ) {
    Map<String, String > header = Map();
    header[ "lang"] =  LangApp.isArabic ? "ar" : "en";
    if(ToolsValidation.isValid(token)) {
      header[ "Authorization"] =  "Bearer " + token;
    }
    header!["Accept"] = "application/json";
    return header;
  }

}