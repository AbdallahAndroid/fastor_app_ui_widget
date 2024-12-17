
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/picker/CaptureTools.dart';

import 'package:fastor_app_ui_widget/customWidget/picker/gallery_and_camera_dialog/GalleryOrCameraPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


extension ChatImageInputController on GalleryOrCameraPickerDialog {


  //------------------------------------------------------------------- camera

  Future cameraClick() async {
    //step : picker
    await CaptureTools.typeCaptureOnly( AssetImage( "/assets/image/placeholderTransparentLogoBlack.png"),
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