
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/dashed_boarder/container_boarder_dashed.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImagePlaceHolder.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class PlaceholderAttacheWidget extends StatelessWidget {

  double radiusCard = AppDimension.placeholderFileRadiusCard;
  final VoidCallback onChangeCallback; // tap on chip
  double width;
  double height;
  bool showProgress;
  String? previousPhoto;


  PlaceholderAttacheWidget({
    required this.width,
    required this.height,
    required this.showProgress,
    required this.previousPhoto,
    required this.onChangeCallback,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ContainerBoarderDashed(
        width: width,
        height: height,
        colorBackgroundCard: AppColors.placeholderImagePickerBoxCardBackground ,
        colorDashedBoarderLine: AppColors.blueBoarderLine,
        radius: radiusCard ,
        child:  contentUI(context),
        // child: Text("test"),
      ),
    );
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
        onChangeCallback();
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

          Image.asset( "assets/icons/attach_file.png" , width: 24.w , height: 24.w ,),
          SizedBox( width: 8.w  ,),
          TextApp( "Select attachment".tr(),
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


}