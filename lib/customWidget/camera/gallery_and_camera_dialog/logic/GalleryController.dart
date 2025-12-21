
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/picker/AttachTools.dart';
import 'package:fastor_app_ui_widget/core/picker/CaptureTools.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

import 'package:fastor_app_ui_widget/customWidget/camera/gallery_and_camera_dialog/GalleryOrCameraPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


extension GalleryController on GalleryOrCameraPickerDialog {


  static Future attachClick({
    required BuildContext context,
    required PickerResultCameraCallback btnCamera,
    required PickerResultGalleryCallback btnGallery,
    required String assetNamePlaceholder,
  } ) async {
    Log.i("attachClick()");

    //step : camera
    await AttachTools.typePickerImage(  AssetImage( assetNamePlaceholder),
            (bool status, String msg, String filePath, Image? image, XFile? xFile) async {

          //check failed picked
          if( status == false ) {
            //return failed
            ToolsToast.top(context, msg);
            return;
          }
          if( xFile ==  null ) {
            ToolsToast.top(context, "Failed in camera file".tra() );
            return;
          }


          btnGallery(xFile);
        });

  }

  //------------------------------------------------------------------- camera

  static Future cameraClick({
    required BuildContext context,
    required PickerResultCameraCallback btnCamera,
    required PickerResultGalleryCallback btnGallery,
    required String assetNamePlaceholder,
  }) async {
    //step : camera
    await CaptureTools.captureImageByCamera( AssetImage( "/assets/image/placeholderTransparentLogoBlack.png"),
            (bool status, String msg, String filePath, Image? image, XFile? xFile) async {

          //check failed picked
          if( status == false ) {
            //return failed
            ToolsToast.top(context, msg);
            return;
          }
          //check failed picked
          if( xFile == null ) {
            //return failed
            ToolsToast.top(context, "Failed To Upload Image Captured".tra()  );
            return;
          }

          /**
           * success
           */
          btnCamera(xFile);

            });

  }

}