import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/AppDecoration.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


class DateHintBoxTab extends StatelessWidget {

  String hint;
  String? previousSelected;
  VoidCallback onTap;
  double width;

  DateHintBoxTab(
  {
    required this.hint,
    required this.previousSelected,
    required this.width,
    required this.onTap,

  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 55.hr,
          padding: EdgeInsets.symmetric(horizontal: 18.wr),
          decoration: AppDecoration.dialogWhite()  ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// choose between : hint /or/ selected
              if( previousSelected == null ) TextApp(
                hint,
                // textStyle: AppTextStyles.font16Grey500,
              ),
              if( previousSelected != null ) TextApp(
                previousSelected??"",
                // textStyle: AppTextStyles.font16blackMedium,
              ),

              ///  icon
              Icon(Icons.calendar_month,
                  size: 24.hr,
                  color: AppColor. grey
              )

            ],
          )),
    );
  }


}