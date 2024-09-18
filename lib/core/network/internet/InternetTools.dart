import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../device/DeviceTools.dart';

class InternetTools {

  static Future<bool> isConnected() async {
    //check if web
    if( DeviceTools.isPlatformWeb() ) {
     // Log.i("isConnected() - is web - stop");
      return true;
    }

    //check in mobile
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }


  static Future<bool> isNotConnected() async {
    return ! await isConnected();
  }


}