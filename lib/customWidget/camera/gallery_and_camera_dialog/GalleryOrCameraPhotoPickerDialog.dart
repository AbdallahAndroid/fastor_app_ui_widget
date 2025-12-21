// import 'package:fastor_app_ui_widget/core/utils/theme/ColorProject.dart';
// import 'package:fastor_app_ui_widget/core/utils/theme/FontProject.dart';
// import 'package:fastor_app_ui_widget/core/utils/theme/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/gallery_and_camera_dialog/logic/GalleryController.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef PickerResultCameraCallback = Function(XFile xFile);
typedef PickerResultGalleryCallback = Function(XFile xFile);

class GalleryOrCameraPhotoPickerDialog {




  static show ({
    required BuildContext context,
    required PickerResultCameraCallback callbackCamera,
    required PickerResultGalleryCallback callbackGallery,
    required String assetNamePlaceholder,
  }){

    AwesomeDialog(
      context: context,
      dialogBackgroundColor: AppColors.backgroundDialog,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      width: AppDimension.dialogWidth(),

      /// title
      title: "Picker Image".tra(),
      titleTextStyle:   TextStyle(
          color: AppColors.textColor,
          fontFamily: FontProject.w700,
          fontSize: 24.sp
      ),


      /// camera
      btnOk:    ButtonApp(
        "Camera".tra(), () async {
        Navigator.pop( context);
        await GalleryController.cameraClick(
          context: context,
          btnCamera: callbackCamera,
          btnGallery: callbackGallery,
          assetNamePlaceholder: assetNamePlaceholder
        );
      },
        width: 120.wr,
      ),
      btnOkOnPress: () async {
        Navigator.pop( context);
        await GalleryController.cameraClick(
            context: context,
            btnCamera: callbackCamera,
            btnGallery: callbackGallery,
            assetNamePlaceholder: assetNamePlaceholder
        );
      },


      /// gallery
      btnCancel:    ButtonApp(
        "Gallery".tra(), () async {
        Navigator.pop( context);

        await GalleryController.attachClick(
            context: context,
            btnCamera: callbackCamera,
            btnGallery: callbackGallery,
            assetNamePlaceholder: assetNamePlaceholder
        );
      },
        width: 120.wr,
      ),
      btnCancelOnPress: () async {
        Navigator.pop( context);
        await GalleryController.attachClick(
            context: context,
            btnCamera: callbackCamera,
            btnGallery: callbackGallery,
            assetNamePlaceholder: assetNamePlaceholder
        );
      },

    ).show();
  }

}