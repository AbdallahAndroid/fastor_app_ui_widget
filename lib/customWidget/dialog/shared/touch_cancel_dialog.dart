import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';

class TouchCancelDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 36.w,
        height: 5.h ,
        margin: EdgeInsets.only(top: 6.h , bottom: 6.h ),
        decoration: BoarderHelper.cardView(
            colorBackground: AppColors.tabGrey,
            radiusSize: 2.5.r
        ),
      ),
      onTap: (){
        Navigator.of(context).pop();
      },
    );
  }
}