
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {

  String title;
  String? counter;

  TitleAppBar( {
    required this.title,
    this.counter
  }) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        /// title
        TextApp( title,
          fontSize: DeviceTools.isLandscape(context) ? 15.5.wt :  15.5.sp,
          color: AppColor.white,
        ),

        /// counter
        if(counter != null)   TextApp( " " +  counter.toString(),
          fontSize: DeviceTools.isLandscape(context) ? 15.5.wt : 15.5.sp,
          color: AppColor.white,
        ),
      ],
    );
  }
}