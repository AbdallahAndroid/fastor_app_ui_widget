import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/theme/app_text_styles.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/decoration/AppDecoration.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


class TimeHintBoxTab extends StatelessWidget {

  String hint;
  String? previousSelected;
  VoidCallback onTap;
  double width;

  TimeHintBoxTab(
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
        width: width,
          height: 55.hr,
          padding: EdgeInsets.symmetric(horizontal: 18.wr),
          decoration: AppDecoration.dialogWhite()  ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// choose between : hint /or/ selected
              if( previousSelected == null ) TextApp(
                hint,
                color: ColorResource.grey ,
                fontSize: 16.hr,
              ),
              if( previousSelected != null ) TextApp(
                previousSelected??"",
                textStyle: AppTextStyles.fontGrey,
              ),

              ///  icon
              Icon( Icons.alarm, size: 24.hr , color: ColorResource.grey,)
              // SvgPicture.asset(AppIcons.clock,
              //     width: 24.hr,
              //     height: 24.hr,
              //     color: ColorResource.grey)

            ],
          )),
    );
  }


}