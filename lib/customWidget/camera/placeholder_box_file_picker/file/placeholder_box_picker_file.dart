
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/picker/AttachTools.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/placeholder_box_file_picker/file/widget/placeholder_attache_widget.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/placeholder_box_file_picker/file/widget/preview_selected_attachment_simple.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/placeholder_box_file_picker/file/widget/preview_selected_attachment_with_thump.dart';
import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef PlaceholderFilePickerOnChange = Function(XFile xFile);

class PlaceholderBoxPickerFile extends StatelessWidget {

  double radiusCard = AppDimension.placeholderFileRadiusCard;

  String title;
  double width;
  double height;
  String?  previousPhoto;
  bool  showProgress;
  bool? isShowButtonEditPhoto;

  PlaceholderFilePickerOnChange fileCallback;


  PlaceholderBoxPickerFile({
    required this.width,
    required this.height,
    required this.title,
    required this.showProgress,
    required  this.previousPhoto,
    required this.fileCallback,
  }) ;


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        /// card
        if( previousPhoto == null )  shapeChooseAttachmentCard(context),
        if( previousPhoto != null )  previewSelectedAttachmentCard(context),
      ],
    ) ;
  }

  ///-------------------------------------------------------------------- choose shape

  shapeChooseAttachmentCard(BuildContext context) {
    return PlaceholderAttacheWidget(
      width: width,
      height: height,
      showProgress: showProgress,
      previousPhoto: previousPhoto,
      onChangeCallback: (   ) async {
        await onClickPicker(context);
      },
    );
  }


  Widget previewSelectedAttachmentCard(BuildContext context){
    return PreviewSelectedAttachmentWithThump(
      title: title,
      width: width,
      previousPhoto: previousPhoto!,
      onChangeCallback: (   ) async {
        await onClickPicker(context);
      },
    );
  }

  ///---------------------------------------------------------- logic picker


  onClickPicker(BuildContext context ) async {

    if(showProgress ) {
      Log.i("onClickPicker - showProgress stop ");
      return;
    }
    await pickerFile(context);
  }

  pickerFile(BuildContext context ) async {
    var assetPlaceholder = AssetImage( "/assets/image/placeholderTransparentLogoBlack.png");

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
          fileCallback(xFile);
        });

  }




}

