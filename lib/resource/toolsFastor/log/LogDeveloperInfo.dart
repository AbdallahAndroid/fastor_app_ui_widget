import 'package:log_debug/src/Log.dart';
import 'package:log_debug/log_debug.dart';

class LogDeveloperInfo {


  static var appId = "abdo";

  //------------------------------------------------------------------- types

  static void setName(String name ) {
    LogDeveloperInfo.appId = name;
  }


}