

import 'LogDeveloperInfo.dart';

class Log {


  /**
   * print key and message
   */
  /// print key and message
  static k ( String tag,  String msg ) {
    i(    tag + " : " + msg  );
  }

  /// print message
  static i ( String msg ) {
    String msgFinal =  LogDeveloperInfo.appId + " : " +  _getTimeOfLog() + " : " + msg;
    _printSpecial(msgFinal);
  }

  /// print object
  static object ( Object object ) {
    String msg = LogDeveloperInfo.appId + " : " + _getTimeOfLog() + " : " + object.toString();
    // var logger = Logger();
    // logger.i(  LogDeveloperInfo.appId + " : " +  _getTimeOfLog() + " object: "  );
    // logger.i(object );
    _printSpecial(  msg  );
  }

  /**
   * workign for error
   * example inside "try/catch" error
   */
  /// print error
  static void e(String msg) {
    String msgFinal = LogDeveloperInfo.appId + ": error : " +  _getTimeOfLog() + " : " + msg;
    _printSpecial(msgFinal);
  }


  static void logBidData(dynamic dataBig) {
    String data  = "$dataBig";
    const int chunkSize = 800; // Adjust based on your console limits
    for (int i = 0; i < data.length; i += chunkSize) {
      final chunk = data.substring(i, i + chunkSize > data.length ? data.length : i + chunkSize);

      if( i == 0 )print( LogDeveloperInfo.appId + " : " +  _getTimeOfLog() + " : BIG DATA:");
      print('$chunk');
    }
  }
  
  //------------------------------------------------------------------- tools

  static _printSpecial(String msg) {
    // var logger = Logger();
    // logger.i( msgFinal );
    // log( msg );
    print( msg );
  }

  /**
   * return format: hh:mm:ss:iii
   * example:  03:09:06:009
   */
  static String _getTimeOfLog() {
    DateTime now = DateTime.now();

    //h
    String h = now.hour.toString();
    if(  now.hour < 10 ) {
      h = "0" + now.hour.toString();
    }

    //m
    String m = now.minute.toString();
    if(  now.minute < 10 ) {
      m = "0" + now.minute.toString();
    }

    //s
    String s = now.second.toString();
    if(  now.second < 10 ) {
      s = "0" + now.second.toString();
    }

    //i
    String i = now.millisecond.toString();
    if(  now.millisecond < 10 ) {
      i = "00" + now.millisecond.toString();
    } else if(  now.millisecond < 100 ) {
      i = "0" + now.millisecond.toString();
    }

    String timeStr = h + ":" + m + ":" + s + ":" + i ;
    return timeStr;
  }



}