import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/row/RowScrollApp.dart';

import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';

class ItemSelectedOrUnSelectedShape extends StatelessWidget {


  BuildContext? context;
  DataPickerEntity entity;
  ListViewDialogPickerGenericListener listener;
  bool  isHideImage;

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
      height: 40,
      alignment: Alignment.center,
      color: entity.isSelected!? Colors.black.withOpacity(0.5): Colors.transparent ,
      child: RowScrollApp( children: [
        if(isVisibleImage() ) icon(),
        if(isVisibleImage() ) const SizedBox( width: 8,),
        title()
      ],),
    );
  }


  icon(){
    // Log.i("icon() - entity.imageUrl: ${entity.imageUrl}");
    return ImageApp(
        context: context!,
        width: 33,
        height: 21,
        colorBackground: Colors.grey.withOpacity( 0.5 ),
        urlBackground: entity.image,
    );
  }

  title(){
    // Log.i("title() - entity.title: ${entity.title}");
    return Container(
      width: DeviceTools.getWidth(context!),
      padding: EdgeInsets.symmetric(horizontal: 10 ),
      alignment: Alignment.center,
      child: TextApp( entity.title??"",
        textAlign: TextAlign.center,
        fontSize: entity.isSelected! ? Figma.h(16) : Figma.h(14) ,
        color: entity.isSelected! ? Colors.black : Colors.grey,
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