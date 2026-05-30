import 'dart:typed_data';


import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/picker/CaptureTools.dart';
import 'package:fastor_app_ui_widget/core/picker/ToolsFile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:flutter/services.dart';




import 'dart:io' as io ;
import 'dart:io' if (dart.library.html)   'dart:html' as ioOrHtml;
typedef ProgressCallbackAttach = void Function(int count, int total);

class AttachTools {

  //-------------------------------------------------------------------- media

  static Future typePickerMultiMedia( {
    required PickerMultiMediaCallBack callBack}) async {
    Log.i("typePickerMultiMedia() - start ");

    /// permission
    await ToolsFile.requestPermissionGalleryAndCamera();

    try {
      List<XFile> xFiles = await ImagePicker().pickMultipleMedia( );

      //check mobile cancel camera image
      if (xFiles.isEmpty) {
        Log.i("typePickerMultiMedia() - xFiles empty - stop! ");
        callBack(false,    null);
        return;
      }
      Log.i("typePickerMultiMedia() - xFiles.len: " + xFiles.length.toString());

      //success
      callBack(true, xFiles);
    } on PlatformException catch (e) {
      Log.i("typePickerMultiMedia() - exc: " + e.toString());
      //return failed
      callBack(false,  null);
      return;
    }
  }


  static Future typePickerSingleMedia( {
    required AssetImage placeHolder,
    bool? isMultiFiles = false ,
    required PickerImageCallBack callBack}) async {
    Log.i("typePickerMedia() - start ");
    Image placeHolderImage = Image(image: placeHolder);

    /// permission
    await ToolsFile.requestPermissionGalleryAndCamera();

    try {
      XFile? xFile = await ImagePicker().pickMedia( );
      Log.i("typePickerMedia() - xFile " + xFile.toString());

      //check mobile cancel camera image
      if (xFile == null) {
        Log.i("typePickerMedia() - photo == null - stop! ");
        callBack(false, "Picker Image canceled", "", placeHolderImage, null);
        return;
      }
      io.File myFile = io.File(xFile.path);
      Log.i("typePickerMedia() - myFile: " + myFile.toString());
      Log.i("typePickerMedia() - path: " + xFile.path.toString());

      //success
      callBack(true, "success", xFile.path, null, xFile);
    } on PlatformException catch (e) {
      Log.i("typePickerMedia() - exc: " + e.toString());
      //return failed
      callBack(false, "Picker image failed, error: " + e.toString(), "",
          placeHolderImage, null);
      return;
    }
  }


  static Future typePickerMedia(
      AssetImage placeHolder, PickerImageCallBack callBack) async {
    Log.i("_pickerFile() - start ");
    Image placeHolderImage = Image(image: placeHolder);

    /// permission
    await ToolsFile.requestPermissionGalleryAndCamera();

    try {
      Uint8List? unitFile;
      Image myImage;
      XFile? xFile = await ImagePicker().pickMedia( );
      Log.i("_pickerFile() - xFile " + xFile.toString());

      //check mobile cancel camera image
      if (xFile == null) {
        Log.i("_pickerFile() - photo == null - stop! ");
        //return failed
        callBack(false, "Picker Image canceled", "", placeHolderImage, null);
        return;
      }
      io.File myFile = io.File(xFile.path);
      // myImage  =  Image.file( myFile) ;
      Log.i("_pickerFile() - myFile: " + myFile.toString());
      Log.i("_pickerFile() - path: " + xFile.path.toString());
      // unitFile = await xFile.readAsBytes();

      //log
      /**
          Log.i( "_pickerFile() - photoPickered: " + photoPickered.toString()  );
          Log.i( "_pickerFile() - photoPickered.path: " + photoPickered.path  );
          Log.i( "_pickerFile() - imagePickered: " + imagePickered.toString()  );
          Log.i( "_pickerFile() - myImage: " + myImage.toString()  );
       */

      //success
      callBack(true, "success", xFile.path, null, xFile);
    } on PlatformException catch (e) {
      Log.i("_pickerFile() - exc: " + e.toString());
      //return failed
      callBack(false, "Picker image failed, error: " + e.toString(), "",
          placeHolderImage, null);
      return;
    }
  }


  //-------------------------------------------------------------------- image

  static Future typePickerImageOnly(
      AssetImage placeHolder, PickerImageCallBack callBack) async {
    Log.i("typePickerImageOnly() - start ");
    Image placeHolderImage = Image(image: placeHolder);

    /// permission
    await ToolsFile.requestPermissionGalleryAndCamera();

    try {
      Uint8List? unitFile;
      Image myImage;
      XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      Log.i("_pickerFile() - xFile " + xFile.toString());

      //check mobile cancel camera image
      if (xFile == null) {
        Log.i("_pickerFile() - photo == null - stop! ");
        //return failed
        callBack(false, "Picker Image canceled", "", placeHolderImage, null);
        return;
      }
      io.File myFile = io.File(xFile.path);
      // myImage  =  Image.file( myFile) ;
      Log.i("_pickerFile() - myFile: " + myFile.toString());
      Log.i("_pickerFile() - path: " + xFile.path.toString());
      // unitFile = await xFile.readAsBytes();

      //log
      /**
          Log.i( "_pickerFile() - photoPickered: " + photoPickered.toString()  );
          Log.i( "_pickerFile() - photoPickered.path: " + photoPickered.path  );
          Log.i( "_pickerFile() - imagePickered: " + imagePickered.toString()  );
          Log.i( "_pickerFile() - myImage: " + myImage.toString()  );
       */

      //success
      callBack(true, "success", xFile.path, null, xFile);
    } on PlatformException catch (e) {
      Log.i("_pickerFile() - exc: " + e.toString());
      //return failed
      callBack(false, "Picker image failed, error: " + e.toString(), "",
          placeHolderImage, null);
      return;
    }
  }

}