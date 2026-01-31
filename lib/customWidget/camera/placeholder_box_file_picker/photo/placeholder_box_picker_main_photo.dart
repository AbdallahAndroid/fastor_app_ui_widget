
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/dashed_boarder/container_boarder_dashed.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/gallery_and_camera_dialog/GalleryOrCameraPhotoPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/gallery_or_camera_or_video_dialog/gallery_camera_video_dialog.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImagePlaceHolder.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef PlaceholderMainPhotoPickerOnChange = Function(XFile xFile);

class PlaceholderBoxPickerMainPhotoOrVideo extends StatelessWidget {

  double radiusCard = 16.r;

  double width;
  double height;
  String?  previousPhoto;
  bool  showProgress;
  bool? isShowButtonEditPhoto;
  bool  isPickerImageOrVideo;

  PlaceholderMainPhotoPickerOnChange photoCallback;


  PlaceholderBoxPickerMainPhotoOrVideo({
    required this.width,
    required this.height,
    required this.showProgress,
    required  this.previousPhoto,
    required this.photoCallback,
    this.isShowButtonEditPhoto = false ,
    required this.isPickerImageOrVideo  ,
  }) ;


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        /// card
        Container(
          child: ContainerBoarderDashed(
            width: width,
            height: height,
            colorBackgroundCard: AppColors.placeholderImagePickerBoxCardBackground ,
            colorDashedBoarderLine: AppColors.blueBoarderLine,
            radius: radiusCard ,
            child:  contentUI(context),
            // child: Text("test"),
          ),
        ),

        /// edit icon
        if( previousPhoto != null && isShowButtonEditPhoto! ) editWidget(context),

      ],
    ) ;
  }


  contentUI(BuildContext context) {
    return  GestureDetector(
      child:  Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              width: width,
              height: height,
            ),

            /// content place holder shape
            if(showProgress == false )placeHolderIconAndText(),


            /// image previous
            if( previousPhoto != null ) ImagePlaceHolder(
              width: width,
              height: height,
              urlBackground: previousPhoto,
              radius: radiusCard ,
            ),

            /// progress
            if( showProgress ) progressWidget()


          ],),
      ),
      onTap: (){
        onClickPicker(context);
      },
    );
  }


  placeHolderIconAndText() {
    return Container(
      width: width,
      height: height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Image.asset( "assets/icons/picker_icon.png" , width: 24.w , height: 24.w ,),
          SizedBox( width: 8.w  ,),
          TextApp( "choose photo".tr(),
            color: AppColors.blueTextPlaceholderImagePicker,
            fontSize: 14.sp , fontFamily: FontProject.w600 ,)

        ],
      ),
    );
  }


  progressWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: ProgressCircleApp(),
    );
  }


  editWidget(BuildContext context ) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 8.h ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            Image.asset( "assets/icons/edit_attach.png",
              width: 24.w ,
              height: 24.w,
            ),
            SizedBox( width: 8.w ,),
            TextApp( "Change Photo".tr(),
              fontFamily: FontProject.w600,
              fontSize: 14.sp ,
              color: AppColors.blueTextPlaceholderImagePicker,
            )


          ],
        ),
      ),
      onTap: (){
        onClickPicker(context );
      },
    );
  }

  ///---------------------------------------------------------- logic


  onClickPicker(BuildContext context ) {

    if(showProgress ) {
      Log.i("onClickPicker - showProgress stop ");
      return;
    }

    /// picker video or image
    if( isPickerImageOrVideo  ) {
      GalleryCameraVideoDialog.show(context: context, callback: (xFile ) => photoCallback(xFile) );
      return;
    }

  /// picker photo
    GalleryOrCameraPhotoPickerDialog.show(
        context: context,
        callbackCamera:( xFile ) => photoCallback(xFile),
        callbackGallery: ( xFile ) => photoCallback(xFile),
        assetNamePlaceholder:  "assets/logo/logo.png"
    );
  }


}

