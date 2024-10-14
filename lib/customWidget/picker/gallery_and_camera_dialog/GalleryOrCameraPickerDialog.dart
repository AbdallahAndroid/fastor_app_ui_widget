import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';

import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonPrimary.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/gallery_and_camera_dialog/logic/ChatFileInputController.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/gallery_and_camera_dialog/logic/ChatImageInputController.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef BtnCameraPressed = Function(XFile xFile);
typedef BtnGalleryPressed = Function(XFile xFile);

class GalleryOrCameraPickerDialog {

  BuildContext context;
  BtnCameraPressed btnCamera;
  BtnGalleryPressed btnGallery;

  GalleryOrCameraPickerDialog( {
    required this.context,
    required this.btnCamera,
    required this.btnGallery,
});

  show (){

    AwesomeDialog(
      context: context,
      dialogBackgroundColor: Colors.white,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      width: Figma.w(350),

      /// title
      title: "Picker Image".tra(),
      titleTextStyle:   TextStyle(
          // fontFamily: FontResource.semibold,
          color: Colors.black,
          fontSize: 20
      ),

      /// description message
      // desc:  "".tra(),
      // descTextStyle:   TextStyle(
      //     fontFamily: FontResource.regular,
      //     color: ColorResource.textPrimary,
      //     fontSize: 14
      // ),

      /// camera
      btnOk:    ButtonPrimary(
        "Camera".tra(), () async {
        Navigator.pop( context);
        await cameraClick();
      },
        // width: Figma.w(figmaSize),
        radius: 15,
      ),
      btnOkOnPress: () async {
        Navigator.pop( context);
        await cameraClick();
      },


      /// gallery
      btnCancel:    ButtonPrimary(
        "Gallery".tra(), () async {
        Navigator.pop( context);

        await attachClick();
      },
        // width: Figma.w(figmaSize),
        radius: 15,
      ),
      btnCancelOnPress: () async {
        Navigator.pop( context);
        await attachClick();
      },

    ).show();
  }

}