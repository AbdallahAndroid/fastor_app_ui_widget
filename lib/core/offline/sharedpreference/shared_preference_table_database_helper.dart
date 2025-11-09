

import 'package:fastor_app_ui_widget/core/cache/SaveApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

class SharedPreferenceTableDatabaseHelper {

  static String tag = "SharedPreferenceTableDatabaseHelper";

  ///---------------------------------------------------------------------- setter

  /// Set (insert or update) a row in a specific table.
  Future<void> addNewRow(String tableName, Map<String, dynamic> json) async {
    int idPrimary = await _getNextPrimaryId(tableName);
    String key = _generateKeyRow(tableName, idPrimary );
    await SaveApp.setMap(key, json);
    Log.k( tag, "addNewRow() - tableName: $tableName /id: $idPrimary /json: $json ");
  }


  Future<void> updateRow(String tableName, int idPrimary, Map<String, dynamic> json) async {
    String key = _generateKeyRow(tableName, idPrimary );
    await SaveApp.setMap(key, json);
    Log.k( tag, "updateRow() - tableName: $tableName /id: $idPrimary /json: $json ");
  }


  Future<void> clearRow(String tableName, int idPrimary ) async {
    String key = _generateKeyRow(tableName, idPrimary );
    await SaveApp.setMap(key,    Map() );
    Log.k( tag, "clearRow() - tableName: $tableName /id: $idPrimary");
  }

  ///---------------------------------------------------------------------- getter

  /// Get a row by its primary ID from a specific table.
  Future<Map<String, dynamic>?> getRowById(String tableName, int idPrimary) async {
    String key = _generateKeyRow(tableName, idPrimary );
    var json  = await SaveApp.getMap( key );
    Log.k( tag, "getRowById() - tableName: $tableName /id: $idPrimary /result: $json ");
    if( json.length == 0 ) return null;
    return json ;
  }

  Future< List<Map<String, dynamic>> > getAllRows(String tableName ) async {
    List<Map<String, dynamic>> list = [];
    int count = await getCount(tableName);
    for( int i = 1 ; i <= count ; i++ ) {
      int idPrimary = i;
      var json = await getRowById(tableName, idPrimary );
      if( json != null ) list.add( json );
    }
    Log.k( tag, "getAllRows() - tableName: $tableName /count: $count /result.length: ${list.length} ");
    return list ;
  }


  Future<int> getCount(String tableName) async {
    String key = _generateKeyTablePrimary(tableName);
    int valueLastId = await SaveApp.getInt( key ) ;
    return valueLastId;
  }

  ///-------------------------------------------------------------------- helper

  /// Get the next available primary ID for a table (starts from 1).
  Future<int> _getNextPrimaryId(String tableName) async {
   String key = _generateKeyTablePrimary(tableName);
   int valueLastId = await SaveApp.getInt( key );
   int next = valueLastId + 1;
   return next;
  }


  String _generateKeyRow(String tableName, int idPrimary ) {
    return "shared_sql-table:" + tableName + "-id:" + idPrimary.toString();
  }

  String _generateKeyTablePrimary(String tableName  ) {
    return "shared_sql-counter_primary-table:" + tableName ;
  }



}