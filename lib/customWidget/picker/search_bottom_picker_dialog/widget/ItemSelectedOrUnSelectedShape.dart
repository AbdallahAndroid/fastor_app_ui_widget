
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/listener/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/row/RowScrollApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class ItemSelectedOrUnSelectedShape extends StatelessWidget {


  BuildContext? context;
  DataPickerEntity entity;
  ListViewDialogPickerGenericListener listener;
  bool  isHideImage;

  static double height = 44.h;

  ItemSelectedOrUnSelectedShape({
    required this.entity,
    required this.listener,
    required this.isHideImage
});


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GestureDetector(
      child: itemContent(),
      onTap: (){
        listener( entity);
      },
    );
  }


  Widget itemContent() {
    return Container(
      width: DeviceTools.getWidth(context!),
      constraints: BoxConstraints( minHeight:  height ),
      alignment:  Alignment.center  ,
      // color: Colors.green,
      child: SizedBox(
        width: AppDimension.dialogPickerWidthInputField(context!),
        child:  Container(
          width: DeviceTools.getWidth(context!),
          decoration: AppDecoration.selectedOrUnSelectedShape( entity.isSelected! ),
          padding: EdgeInsets.symmetric(horizontal: 15.4.w ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: DeviceTools.isLandscapeOrSemiBox(context!) ? MainAxisAlignment.center :MainAxisAlignment.start,
            children: [

              /// icon
              if(isVisibleImage() ) SizedBox( width: 11.4.w ,),
              if(isVisibleImage() ) icon(),
              /// title
              SizedBox( width: 11.4.w ,),
              title(),
            ],
          ),
        ),
      ),

    );
  }

  /**
   *    child: RowScrollApp( children: [
      if(isVisibleImage() ) icon(),
      if(isVisibleImage() ) SizedBox( width: 11.4.w ,),
      title(),
      ],)
   */


  icon(){
    // Log.i("icon() - entity.imageUrl: ${entity.imageUrl}");
    return Image.asset(
         entity.image??"",
        width: 12.25.w ,
        height: 20.h,
        color:  entity.isSelected!? AppColors.primary : AppColors.black,
    );
  }


  title(){
    // Log.i("title() - entity.title: ${entity.title}");
    return Container(
      width: AppDimension.dialogPickerWidthInputField(context!)  * 0.70  ,
      // color: Colors.yellow,
      constraints: BoxConstraints(minHeight:  height,),
      alignment: LangApp.getAlignmentGeometryStartCenter(),
      child: TextApp( entity.title??"",
        textAlign: DeviceTools.isLandscapeOrSemiBox(context!)  ?TextAlign.center : TextAlign.start,
        fontSize:  16.sp,
        color:  AppColors.black  ,
        maxLines: 2,
        // height: 18.h ,
        // backgroundColor: Colors.blue,
        fontFamily: entity.isSelected!? FontProject.w900 : FontProject.w700,
      ),
    );
  }


  bool isVisibleImage(){
    // Log.i("isFoundImageData() - entity.imageUrl: ${entity.imageUrl}");
    if( isHideImage  ) {
      return false;
    }
    return ToolsValidation.isValid( entity.image );
  }


}