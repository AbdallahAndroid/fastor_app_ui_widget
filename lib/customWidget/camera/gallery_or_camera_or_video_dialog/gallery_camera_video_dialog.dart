
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/picker/AttachTools.dart';
import 'package:fastor_app_ui_widget/core/picker/CaptureTools.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/gallery_and_camera_dialog/GalleryOrCameraPhotoPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/card/glass/effect_glass_background_card.dart';
import 'package:fastor_app_ui_widget/customWidget/scaffold/ScaffoldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class GalleryCameraVideoDialog  {

  static void show ( {
    required BuildContext context,
    required PickerResultCameraCallback callback ,
  } ) {

    showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialogFixingPreviousScreenInCaseWhite,
      barrierDismissible:  false,
      builder: (BuildContext context) {
        return _GalleryCameraVideoDialog(
          callback: callback,
        );

      },
    );
  }
}

class _GalleryCameraVideoDialog extends StatelessWidget {

  PickerResultCameraCallback callback ;

  var assetPlaceholder = AssetImage( "/assets/image/placeholderTransparentLogoBlack.png");

  _GalleryCameraVideoDialog( { required this.callback });


  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      shapeTransparent: true ,
      shapeTransparentColor: Colors.transparent,
      body: Container(
        width: DeviceTools.getWidth(context),
        height: DeviceTools.getHeight(context),
        color: AppColors.backgroundDialogDismissAreaTypeEffectGlassPortrait , //Color(0x99000000), ///background all screen like dialog
        alignment: Alignment.center,
        child: cardMessage(context),
      ),
    );
  }


  cardMessage(BuildContext context ) {
    return EffectGlassBackgroundCard(
      radiusBorder: BorderRadiusTools.get( radius_all: 40.r ),
      width: AppDimension.dialogWidth(),
      height: 300.h ,
      child: Container(
        padding: EdgeInsets.all( 24.h ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox( height: 8.h,),

            /// title
            TextApp( "Picker Image or Video".tr() ,//  "Picker Media".tr(),
              textAlign: TextAlign.center,
              fontSize: 18.spt,
              fontFamily: FontProject.w700,
            ),
            SizedBox( height: 32.h ,),

            ///  buttons
            buttonCamera (context),
            SizedBox( height: 8.h ,),
            buttonVideo(context),
            SizedBox( height: 8.h ,),
            buttonGallery(context),
          ],
        ),
      ),
    );
  }

  buttonCamera(BuildContext context ){
    return _ButtonGallery(
      title: 'Camera'.tr(),
      onPressed: () async {
        await CaptureTools.captureImageByCamera( assetPlaceholder,
                (bool status, String msg, String filePath, Image? image, XFile? xFile) async {

              //check failed picked
              if( status == false ) {
                ToolsToast.top(context, msg);
                return;
              }

              //check failed picked
              if( xFile == null ) {
                ToolsToast.top(context, "Failed To Upload Image Captured".tra()  );
                return;
              }

              // success
              callback(xFile);

            });
      },
    );
  }

  buttonVideo(BuildContext context ){
    return _ButtonGallery(
      title: 'Video'.tr(),
      onPressed: () async {
        await CaptureTools.captureVideo( assetPlaceholder,
                (bool status, String msg, String filePath, Image? image, XFile? xFile) async {

              //check failed picked
              if( status == false ) {
                ToolsToast.top(context, msg);
                return;
              }
              //check failed picked
              if( xFile == null ) {
                ToolsToast.top(context, "Failed To Upload Image Captured".tra()  );
                return;
              }

              // success
              callback(xFile);

            });
      },
    );
  }


  buttonGallery(BuildContext context ){
    return _ButtonGallery(
      title: 'Gallery'.tr(),
      onPressed: () async {

        //step : camera
        await AttachTools.typePickerMedia(  assetPlaceholder,
                (bool status, String msg, String filePath, Image? image, XFile? xFile) async {

              //check failed picked
              if( status == false ) {
                ToolsToast.top(context, msg);
                return;
              }
              if( xFile ==  null ) {
                ToolsToast.top(context, "Failed in camera file".tra() );
                return;
              }

              // success
              callback(xFile);
            });

      },
    );
  }

}

///--------------------------------------------------------------------------- button

class _ButtonGallery  extends StatelessWidget {

  String title;
  VoidCallback onPressed;

  _ButtonGallery({
    required this.title,
    required this.onPressed
});

  @override
  Widget build(BuildContext context) {
      return ButtonApp(   title,  onPressed,
        width: AppDimension.dialogWidth() ,
        height: 52.hr,
      );
    }

}