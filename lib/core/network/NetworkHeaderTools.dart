import 'dart:convert';

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';



class NetworkHeaderTools {

  /**
   * How to use ?
      var basicAuth = NetworkHeaderTools.basicAuth_usernameAndPassword( PayPalConstant.clientId, PayPalConstant.secret);
      header["Authorization"] = basicAuth;
   */
  static String basicAuth_usernameAndPassword(String username, String password ) {
    if(ToolsValidation.isEmpty(username) ) return "";
    if(ToolsValidation.isEmpty(password) ) return "";
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    //Log.i( "basicAuth_usernameAndPassword() - basicAuth: " + basicAuth );

    return basicAuth;
  }


  static Map<String, String > bearerToken(String token ) {
    Map<String, String > header = Map();
    if(ToolsValidation.isEmpty(token) ) return header;
    header[ "Authorization"] =  "Bearer " + token;
    return header;
  }


  static Map<String, String > bearerTokenAndLang(String token ) {
    Map<String, String > header = Map();
    if(ToolsValidation.isEmpty(token) ) return header;
    header[ "Authorization"] =  "Bearer " + token;
    header[ "lang"] =  LangApp.isArabic ? "ar" : "en";
    return header;
  }


}