

import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';

class NetworkConfig{

  static Map<String, String>? _headers ;


  /**
   * when to init() , after update profile or update login or logout
   */
  static void initConfigure(){
    _headers = null;
  }

  static   Map<String,String>  getConfigureHeaderFromCache()     {

    /// fix perfomance
    if( _headers!= null ) {
      return _headers!;
    }

    if( _headers == null  ) {
      _headers = Map();
    }
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