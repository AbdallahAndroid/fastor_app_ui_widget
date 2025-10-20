import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
// import 'package:fastor_app_ui_widget/core/utils/theme/ColorProject.dart';
// import 'package:fastor_app_ui_widget/core/utils/theme/FontProject.dart';
// import 'package:fastor_app_ui_widget/core/utils/theme/app_decoration.dart';
// import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/gallery_and_camera_dialog/GalleryOrCameraPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:fastor_app_ui_widget/customWidget/image/image_file_app.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_io/io.dart';



typedef PhotoPickerShapeNameCallback = Function(XFile xFile );


/// example
///        /// photo
//         PhotoPickerShapeNameWidget(
//           width: 124.wr ,
//           placeholderAssetName: "assets/logo/placeholder_logo_white.png",
//           username: UserHelper.getUserName(),
//           xFilePreviousSelected: xFileSelected,
//           imageUrlPreviousSelected: UserHelper.getImageUrl(),
//           photoCallback: ( xFile ){
//             xFileSelected = xFile;
//             cubit.initState();
//           },
//         ),
class PhotoPickerShapeNameWidget extends StatelessWidget {

  String? errorText;
  double width;
  PhotoPickerShapeNameCallback photoCallback;
  String username;
  XFile? xFilePreviousSelected;
  String? imageUrlPreviousSelected;
  String placeholderAssetName;
  bool? showProgress;

  /// then equal "true" hide button picker file
  bool? isModePreviousOnly;

  double? widthBoarderLine;
  double? fontSizeShapeFirstCharacter;

  PhotoPickerShapeNameWidget( {
    required this.width,
    required this.username,
    required this.placeholderAssetName,
    required this.photoCallback,
    this.widthBoarderLine,
    this.fontSizeShapeFirstCharacter,
    this.showProgress = false ,
    this.isModePreviousOnly = false ,
    this.xFilePreviousSelected,
    this.imageUrlPreviousSelected,
    this.errorText
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isModePreviousOnly! ? null :  (){

        if( isModePreviousOnly! ) return;
        if( showProgress! ) return;

        // if( UserHelper.isGuest() ) {
        //   RouterPage.loginNeededDialog(context);
        //   return;
        // }

        GalleryOrCameraPickerDialog.show(
            context: context,
            callbackCamera:( xFile ) => photoCallback(xFile),
            callbackGallery: ( xFile ) => photoCallback(xFile),
            assetNamePlaceholder:  "assets/logo/logo.png"
        );
      },
      child: contentUi(context),
    );
  }

  Widget contentUi(BuildContext context) {
    return Container(
      width: width ,
      height: width ,

      child: Stack(
        children: [
          SizedBox(
            width: width ,
            height: width ,
          ),


          /// photo
          ClipRRect(
            borderRadius: BorderRadiusTools.get( radius_all: getRadius() ),
            child: Container(
              width: width ,
              height: width ,
              // decoration: AppDecoration.photoCircle( getRadius()  ),
              child: chooseShapeImage(context),
            ),
          ),

          /// button picker 
          if(showProgress == false && isModePreviousOnly! == false  )PositionedApp.langApp(
              bottom: 0,
              right: 15.w,
              child: Container(
                child: Image.asset( "assets/icons/add_photo.png",
                  width: 32.w ,
                  height: 32.w ,
                ),
              )
          ),

          /// progress
          if(showProgress!   ) PositionedApp.langApp(
            bottom: 0,
            right: 15.w,
            child: Container(
              decoration: AppDecoration.photoAddButtonCircle( 32.w /2  ),
              child: ProgressCircleApp( size: 15.w ,),
              width: 32.w ,
              height: 32.w ,
            ),
          )


        ],
      ),
    );
  }


  Widget chooseShapeImage(BuildContext context) {
    // Log.i("chooseShapeImage() - start");

    /// case found xFile
    if( xFilePreviousSelected != null ){
      Log.i("chooseShapeImage() - xFilePreviousSelected");
      return Container(
        decoration: getDecoration(),
        margin: EdgeInsets.all( widthBoarderLine??7.w ), ///boarder width
        child: ClipRRect(
          borderRadius: BorderRadiusTools.get( radius_all: getRadius() ),
          child: ImageFileApp(
            width: width,
            height: width,
            xFile: xFilePreviousSelected,
          ),
        ),
      );
    }

    /// case found imageUrl
    if( ToolsValidation.isValid( imageUrlPreviousSelected) ) {
      Log.i("chooseShapeImage() - imageUrlPreviousSelected");
      return Container(
        decoration: getDecoration(),
        margin: EdgeInsets.all( widthBoarderLine??7.w  ), ///boarder width
        child: ClipRRect(
          borderRadius: BorderRadiusTools.get( radius_all: getRadius() ),
          child: ImageApp(
            context: context,
            width: width,
            height: width,
            radius: getRadius(),
            assetAspectRatio: AssetImage( placeholderAssetName),
            colorBackground: AppColor.bluePlaceholderImage,
            urlBackground: imageUrlPreviousSelected,
          ),
        ),
      );
    }

    /// case found username
    if( ToolsValidation.isName( username )) {
      Log.i("chooseShapeImage() - username");
      return imageWithFirstCharacterAtUserName();
    }

    /// default placeholder
    Log.i("chooseShapeImage() - default placeholder");
    return Container(
      decoration: getDecoration(),
      child: ImageApp(
        context: context,
        // padding: EdgeInsets.all( width / 5 ) ,
        assetAspectRatio: AssetImage( placeholderAssetName),
        width: width * 0.7 ,
        height: width * 0.7 ,
        radius: getRadius(),
      ),
    );
  }


  Widget imageWithFirstCharacterAtUserName() {
    String first = username[0];
    return Container(
      decoration: getDecoration(),
      width: width,
      height: width,
      alignment: Alignment.center,
      child: TextApp( first ,
        fontFamily: FontProject.w600,
        color: AppColor.white,
        fontSize: fontSizeShapeFirstCharacter??65.sp ,
      ),
    );
  }

  double getRadius() {
    return width / 2.0;
  }

  getDecoration() {
    return AppDecoration.photoCircle( radius:  getRadius(), widthLine: widthBoarderLine??7.w  );
  }


}