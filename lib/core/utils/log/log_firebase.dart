import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class LogFirebase {
  static String keyLogInfo = "debug_log";

  static Future i(String key, String value) async {
    Log.i("LogFirebase - key: $key ");
    //get user
    String userId = UserHelper.getUserId();
    if (ToolsValidation.isEmpty(userId)) {
      userId = "guest";
    }

    String issueId = _getCurrentTimestamp().toString();
    String date = _getDateUnderscore();
    String pathRef = keyLogInfo +
        "/userId_" +
        userId +
        "/date_" +
        date +
        "/issueId_" +
        issueId;
    DatabaseReference ref = FirebaseDatabase.instance.ref(pathRef);

    Map<String, dynamic> body = {
      "key": key,
      "issueId": issueId,
      "time": _getTimeNormalRead(),
      "value": value,
    };
    Log.i("FirebaseErrorLogHelper - ref: $ref ");
    Log.i("FirebaseErrorLogHelper - body: $body ");

    await ref.set(body);
  }

  //----------------------------------------------------------------- get current time

  /**
   * https://stackoverflow.com/a/62233947/7186671
   * 1654721784
   *
   * return micro
   * 1654732024000
   */
  static int _getCurrentTimestamp() {
    // int numberWith1000 =  new DateTime.now().millisecondsSinceEpoch;
    var dateUtc = DateTime.now().toUtc();
    int numberWith1000 = dateUtc.millisecondsSinceEpoch;
    String num_str = numberWith1000.toString();
    int len = num_str.length;
    String cut1000 = num_str.substring(0, len - 3);
    return int.parse(cut1000);
  }

  static String _getTimeNormalRead() {
    var now = DateTime.now();
    var afterFormat = DateFormat('yyyy/MM/dd hh:mm').format(now);
    return afterFormat.toString();
  }

  static String _getDateUnderscore() {
    var now = DateTime.now();
    var afterFormat = DateFormat('yyyy_MM_dd').format(now);
    return afterFormat.toString();
  }
}
