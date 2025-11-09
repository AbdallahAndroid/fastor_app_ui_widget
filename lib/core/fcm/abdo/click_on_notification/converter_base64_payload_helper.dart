import 'dart:convert';

import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

class ConverterBase64PayloadHelper {



  static String encodeJsonToBase64(Map<String, dynamic> jsonMap) {
    try {
      final jsonString = jsonEncode(jsonMap);
      final base64String = base64Url.encode(utf8.encode(jsonString));
      // Log.i("encodeJsonToBase64() - base64String: " +base64String );
      return base64String;
    } catch (e) {
      Log.i("encodeJsonToBase64() - error: " + e.toString() );
      return "";
    }
  }

  static Map<String, dynamic>? parseBase64ToJson(String base64String) {
    try {
      final jsonString = utf8.decode(base64Url.decode(base64String));
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      // Log.i("encodeJsonToBase64() - jsonMap: $jsonMap"  );
      return jsonMap;
    } catch (e) {
      Log.i("parseBase64ToJson() - error: " + e.toString() );
      return null;
    }
  }


}