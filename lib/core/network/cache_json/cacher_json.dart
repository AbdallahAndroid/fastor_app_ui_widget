
import 'package:fastor_app_ui_widget/core/cache/SaveApp.dart';
import 'package:fastor_app_ui_widget/core/network/QueryRequestHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacherJson {
  static const String _cacheKey = 'cached_json_data';

  /// Save JSON data (Map or List) to cache
  static Future<void> setJson({
    required String endpoint,
    String? methodType = "GET",
    required Map<String,dynamic> bodyOrParameter,
    required Map<String, dynamic> jsonData}) async {
    String key = _generateKey(methodType: methodType, endpoint: endpoint, bodyOrParameter: bodyOrParameter);
    await SaveApp.setMap(key,  jsonData );
  }

  /// Get JSON data from cache
  static Future<dynamic> getJson({
    String? methodType = "GET",
    required String endpoint,
    required Map<String,dynamic> bodyOrParameter}) async {
    String key = _generateKey(methodType: methodType, endpoint: endpoint, bodyOrParameter: bodyOrParameter);
    return SaveApp.getMap(key);
  }

  /// Clear cached JSON
  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cacheKey);
  }

  static String _generateKey({
    String? methodType = "GET",
    required String endpoint,
    required Map<String,dynamic> bodyOrParameter, }){
    String pathAfterDomain = _getPathUrlAfterDomain(endpoint) ;
    String fullWithParameter = QueryRequestHelper.mapToQueryFilterNullValue( pathAfterDomain , bodyOrParameter);
    return "#" + methodType! + "#" + fullWithParameter;
  }

  /// Returns the URL part after the domain, e.g.
  /// "http://192.168.8.120/abdallah/public/api/v2/server/status/now"
  /// → "abdallah/public/api/v2/server/status/now"
  static String _getPathUrlAfterDomain(String url) {
    try {
      Uri uri = Uri.parse(url);
      // Remove leading slash if exists
      return uri.path.replaceFirst(RegExp(r'^/'), '');
    } catch (e) {
      // Return empty string or handle invalid URL
      return '';
    }
  }


}
