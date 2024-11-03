
import 'dart:math';


class UniqueIdTools{

  static int _counter = 0;

  static double getNumberOnly(){
    //values
    int timeStamp = _getCurrentTimestamp();
    _counter = _counter + 1 ; //increment
    int random = new Random().nextInt(10);
    String result_str =  timeStamp.toString() + _counter .toString() + random.toString();
    return double.parse( result_str);
  }



  /**
   * https://stackoverflow.com/a/62233947/7186671
   * pages:
   * 1591457696860000
   */
  static int _getCurrentTimestamp() {
    return new DateTime.now().microsecondsSinceEpoch;
  }

  /**
   * return format: hh:mm:ss:iii
   * pages:  03:09:06:009
   */
  static String getCurrent__hhmmssiii() {
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