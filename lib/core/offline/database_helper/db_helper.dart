import 'dart:async';


import 'package:fastor_app_ui_widget/core/constant/env.dart';
import 'package:fastor_app_ui_widget/core/network/parse/ApiParserApp.dart';
import 'package:fastor_app_ui_widget/core/offline/database_helper/table_name.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:sqflite/sqflite.dart';


Database? db ;
class DbHelper {


  Future<Database> getDatabaseInstance() async {
    if( db != null ) return db!;
    db = await DbHelper.initDb();
    return db!;
  }

  ///---------------------------------------------------------------------- on create

  static Future<Database> initDb() async {
    String dbName = 'maqsafy_offline_online.db';
    var version = databaseOfflineVersion;
    if (isTestEnvironment) {
      dbName = 'maqsafy_offline_test_v${databaseOfflineVersion}.db';
      version = databaseOfflineVersion + 100;
    }
    db =  await openDatabase(
      dbName,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) {},
      version: version,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
    return db!;
  }

  static Future<void> _onCreate(Database database, int version) async {
    final db = database;
    // CartOfflineDataSourceImpl.createTableCategory(db);
  }

  /// when user switch account user-panel remove data ?
  /// clear all data in offline database
  static Future clearAllDataOffline() async {
    // CartOfflineDataSourceImpl.clearAllCategory();
  }

  static Future<List<Map<String, dynamic>>> getAll(TableName tableName) async {

    final List<Map<String, dynamic>> maps = await db!.query(tableName.name);
    return maps;
  }

  ///---------------------------------------------------------------------- setter

  static Future<int> insertData(
      TableName tableName, Map<String, dynamic> data) async {
    try {
      // log('Inserting data into $table: $data');
      int insertedId = await db!.insert(
        tableName.name,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return insertedId;
    } catch (e) {
      Log.i(
          'DbHelper - insertData() - Error inserting data: $e /tableName: $tableName');
      return -1;
    }
  }

  /// why use this method?
  /// more performance than use method "insertData" in large data
  static Future<List<int>> insertBatch(
    TableName tableName,
    List<Map<String, dynamic>> dataList,
  ) async {
    try {
      // log('Inserting batch data into $table: ${dataList.length} records');

      final Batch batch = db!.batch();

      for (Map<String, dynamic> data in dataList) {
        batch.insert(
          tableName.name,
          data,
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }

      final List<Object?> results = await batch.commit();
      return results.cast<int>();
    } catch (e) {
      Log.i(
          'DbHelper - insertBatch() - Error inserting batch data: $e /tableName: $tableName');
      return [];
    }
  }

  static Future<bool> deleteData(
    TableName tableName, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    try {
      // log('DbHelper: deleteData: table = $table, where = $where, whereArgs = $whereArgs');
      await db!.delete(
        tableName.name,
        where: where != null ? '$where = ?' : null,
        whereArgs: whereArgs,
      );
      return true;
    } catch (e) {
      Log.i(
          'DbHelper - deleteData() - Error deleting data: $e /tableName: $tableName');
      return false;
    }
  }

  /// instead of use old way example :
  ///     await DbHelper.updateData(
  //       TableName.order,
  //       {'is_sync': 1},
  //       'id = ?',
  //       [orderId],
  //     );
  static Future<bool> updateSingleColumn({
    required TableName tableName,
    required primaryId,
    required String columnName,
    required dynamic valueUpdated,
  }) async {
    return await DbHelper.updateData(
      tableName,
      {columnName: valueUpdated},
      'id = ?',
      [primaryId],
    );
  }

  static Future<bool> updateData(
    TableName tableName,
    Map<String, dynamic> data,
    String where,
    List<dynamic> whereArgs,
  ) async {
    try {
      final updateResult = await db!.update(
        tableName.name,
        data,
        where: where,
        whereArgs: whereArgs,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      //log('DbHelper: updateData: updateResult = $updateResult');
      return true;
    } catch (e) {
      Log.i(
          'DbHelper - updateData() - Error updating data: $e /tableName: $tableName');
      return false;
    }
  }

  static Future updateRawData(
    TableName tableName,
    List<String> values,
    List<dynamic> parameters,
  ) async {
    db!.execute(
      'update ${tableName.name} set $values where id = ?${parameters.last}',
      parameters,
    );
  }

  ///---------------------------------------------------------------------- getter array

  ///       final maps = await DbHelper.getDataWhere(
  //         TableName.buyers,
  //         where: 'LOWER(name) LIKE ? OR LOWER(english_name) LIKE ? OR LOWER(arabic_name) LIKE ?',
  //         whereArgs: ['%$searchName%', '%$searchName%', '%$searchName%'],
  //       );
  static Future<List<Map<String, dynamic>>> getDataWhere(
    TableName tableName, {
    String? where,
    bool orderByIdDesc = false,
    List<dynamic>? whereArgs,
    int? paginatePerPage = 15,
    int? paginatePage,

    /// when have value "paginatePage" means need pagination query
  }) async {
    try {
      final List<Map<String, dynamic>> maps = await db!.query(
        tableName.name,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderByIdDesc ? 'id DESC' : null,
        limit: paginatePage != null ? paginatePerPage : null,
        offset: (paginatePage != null)
            ? (paginatePerPage! * (paginatePage - 1))
            : null,
      );
      return maps;
    } catch (e) {
      Log.i('DbHelper - getDataWhere() - Error retrieving data: $e');
      return [];
    }
  }

  ///---------------------------------------------------------------------- getter single value

  static Future<Map<String, dynamic>?> getRecordById(
    int id, {
    required TableName tableName,
  }) async {

    final List<Map<String, dynamic>> maps = await db!.query(
      tableName.name,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getSingleRecordByColumn({
    required TableName tableName,
    required String column,
    required dynamic argValue,
  }) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      tableName.name,
      where: '$column = ?',
      whereArgs: [argValue],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  ///---------------------------------------------------------------------- action by list column

  static Future<List<dynamic>> getListColumn(
    TableName tableName, {
    required String column,
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    try {
      final List<Map<String, dynamic>> maps = await db!.query(
        tableName.name,
        columns: [column],
        where: where,
        whereArgs: whereArgs,
      );
      List<dynamic> columns = maps.map((row) => row[column]).toList();

      return columns;
    } catch (e) {
      Log.i('DbHelper - getSingleColumnValues() - Error retrieving data: $e');
      return [];
    }
  }

  /// example
  ///     double sumTotalProduct = await DbHelper.getSumSingleColumnValues(
  //       column: "total_products",
  //       TableName.order,
  //       where: where,
  //       whereArgs: args.isNotEmpty ? args : null,
  //     );
  static Future<double> getSumSingleColumnValues(
    TableName tableName, {
    required String column,
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    try {
      final List<Map<String, dynamic>> maps = await db!.query(
        tableName.name,
        columns: [column],
        where: where,
        whereArgs: whereArgs,
      );
      List<dynamic> columns = maps.map((row) => row[column]).toList();

      double result = 0;
      columns.forEach((column) {
        result += makeDouble(column);
      });
      return result;
    } catch (e) {
      Log.i('DbHelper - getSingleColumnValues() - Error retrieving data: $e');
      return 0;
    }
  }

  static Future<int> getCountDataWhere(
    TableName tableName, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    try {
      final List<Map<String, dynamic>> maps = await db!.query(
        tableName.name,
        columns: ['COUNT(*) as count'],
        where: where,
        whereArgs: whereArgs,
      );
      return Sqflite.firstIntValue(maps) ?? 0;
    } catch (e) {
      Log.i('DbHelper - getCountDataWhere() - Error retrieving count: $e');
      return 0;
    }
  }

  static Future<void> closeDb(Database db) async {
    await db.close();
  }


}
