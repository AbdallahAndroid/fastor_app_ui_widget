import 'dart:io';


import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/picker/ToolsFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';

import 'package:permission_handler/permission_handler.dart';

class ToolsFile {


  //-------------------------------------------------------------------------- permission

  static Future<bool> requestPermissionGalleryAndCamera() async {

    try{
      if( await Permission.camera.isGranted == false ) {
        await Permission.camera.request();
      }
    } catch(e) {
      Log.i( "isPermissionGalleryAndCameraAllowed() - permission - e: " + e.toString() );
    }
    try{
      if( await Permission.photos.isGranted == false ) {
        await Permission.photos.request();
      }
    } catch(e) {
      Log.i( "isPermissionGalleryAndCameraAllowed() - permission - e: " + e.toString() );
    }
    try{
      if( await Permission.storage.isGranted == false ) {
        await Permission.storage.request();
      }
    } catch(e) {
      Log.i( "isPermissionGalleryAndCameraAllowed() - permission - e: " + e.toString() );
    }


    return true;
  }
  //------------------------------------------------------------------------- read

  static Future<String> readFile(String pathFileWithFilename ) async {
    Log.i( "saveFile() - readFile: " + pathFileWithFilename );
    File file = File(pathFileWithFilename); // 1
    String fileContent = await file.readAsString(); // 2
    Log.i( "saveFile() - fileContent: " + fileContent );
    return fileContent;
  }
  //------------------------------------------------------------------------------ write

  /**
   * @pathFileWithFilename : "/data/user/0/com.abdallahmahmoud.actors_profile/app_flutter/image_1659634795.png"
      @data : "This is my demo text that will be saved to : demoTextFile.txt"); // 2
   */
  static Future saveFile(String pathFileWithFilename, String data ) async {
    Log.i( "saveFile() - pathFileWithFilename: " + pathFileWithFilename );

    //check permission - storage
    // bool isDeniedStorage = await Permission.storage.isDenied;
    try{
      await Permission.photos.request();
      await Permission.storage.request();
    } catch(e) {
      Log.i( "saveFile() - permission - e: " + e.toString() );
    }

    Log.i( "saveFile() - writeAsString - before" );
    //save
    File file = File( pathFileWithFilename); // 1
    await file.writeAsString(data);
    Log.i( "saveFile() - writeAsString - done" );
  }

  //-------------------------------------------------------------------- get directory

  static Future<String> getPathDirectory(  ) async {

    //default
    var directory = await getApplicationDocumentsDirectory();
    var directoryPath = directory.path;

    if( DeviceTools.isIOS()  ) {
      /**
       1- must prefix the directoryDefault with keyword "/private"

       2- replace "/Documents/" with "/tmp/"
       */

      var replaceKeywordDocuments = directoryPath.replaceFirst( RegExp(r"Documents")  , "tmp" );
      return  "/private" + replaceKeywordDocuments;
    }

    return directoryPath;
  }

  //--------------------------------------------------------------------- parse

  static String getFileNameWithoutExtenstion(String pathFull ) {
    Log.i( "ToolsFile - getFileNameWithoutExtenstion() - pathFull: " + pathFull);
    try {
      String fileName = pathFull.split('/').last;
      return fileName;
    } on Exception catch(e) {
      Log.i( "ToolsFile - getFileName() - e: " + e.toString() + " /pathFull: " + pathFull);
      return "";
    }
  }


}