
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/picker/ToolsFile.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/placeholder_box_file_picker/file/widget/preview_selected_attachment_simple.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImagePlaceHolder.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/error_text/error_textfield.dart';
import 'package:flutter/material.dart';


class PreviewSelectedAttachmentWithThump extends StatelessWidget {
  final String title; // center title (english text; direction handled by LangApp)
  final VoidCallback onChangeCallback; // tap on chip
  final String? errorMessage; // optional error shown below

  double radiusCard = AppDimension.placeholderFileRadiusCard;
  double width;

  String previousPhoto;

  final heightThump = 186.h;


  PreviewSelectedAttachmentWithThump({
    Key? key,
    required this.title,
    required this.width,
    required this.onChangeCallback,
    required this.previousPhoto,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(  ToolsFile.isExtensionTypeImage( previousPhoto )  ) {
      return shapeFileImage(context);

      /// case: file like pdf or doc
    } else {
      return PreviewSelectedAttachmentSimple(
          title: title,
          width: width,
          height: AppDimension.placeholderFileHeight ,
          onChangeCallback: onChangeCallback);
    }
  }


  shapeFileImage(BuildContext context) {
    return Directionality(
      textDirection: LangApp.getTextDirection(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          cardContentUI(context),

          if ((errorMessage ?? '').isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: ErrorTextfield(errorMessage!),
            ),
        ],
      ),
    );
  }


  Widget cardContentUI(BuildContext context ) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child:  Stack(
        children: [

          /// size
          SizedBox(
            width: width,
            height: heightThump,
          ),

          /// photo
          ImagePlaceHolder(
              width: width,
              height:heightThump,
              urlBackground: previousPhoto
          ),

          /// trash
          PositionedDirectional(
              end: 0,
              top: 0,
              child: GestureDetector(
                onTap: onChangeCallback,
                child: Container(
                  margin: EdgeInsets.all(16.w  ),
                  width: 32.w,
                  height: 32.w ,
                  alignment: Alignment.center ,
                  decoration: AppDecoration.iconCircle(radius: 16.w , widthLine: 1 ),
                  child: Image.asset(
                    'assets/icons/file_trash.png',
                    width: 24.w,
                    height: 24.w,
                    color: AppColors.white,
                  ),
                ),
              )
          ),

        ],
      )
    );
  }
}
