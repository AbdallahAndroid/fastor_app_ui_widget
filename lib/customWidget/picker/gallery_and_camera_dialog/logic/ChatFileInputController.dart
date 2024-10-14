

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/picker/AttachTools.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/gallery_and_camera_dialog/GalleryOrCameraPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

extension ChatFileInputController on GalleryOrCameraPickerDialog {

    Future attachClick() async {
    Log.i("attachClick()");

    //step : picker
    await AttachTools.typePickerImage(  AssetImage( "/assets/image/placeholderTransparentLogoBlack.png"),
            (bool status, String msg, String filePath, Image? image, XFile? xFile) async {

          //check failed picked
          if( status == false ) {
            //return failed
            ToolsToast.top(context, msg);
            return;
          }
          if( xFile ==  null ) {
            ToolsToast.top(context, "Failed in picker file".tra() );
            return;
          }


          btnGallery(xFile);
        });

  }


}
