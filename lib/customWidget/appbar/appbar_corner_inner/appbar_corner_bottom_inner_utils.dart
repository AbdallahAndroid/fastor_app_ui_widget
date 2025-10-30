import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/size/StatusBarSizeHelper.dart';
import 'package:flutter/material.dart';


class AppbarCornerBottomInnerUtils {


  static appBarPrimaryLinearGradientNoRadius() {
    return ShapeDecoration(
      gradient: LinearGradient(
        begin: Alignment(0.00, -1.00),
        end: Alignment(0, 1),
        // colors: [Color(0xFF245550), Color(0xFF13A69A)],
        colors: [
          Color(0xFF245550),
          Color(0xFF13A69A),
          Color(0xFF13A69A),
          Color(0xFF13A69A),
          Color(0xFF13A69A),
          // Color(0xFF13A69A),
          // Color(0xFF13A69A),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
    );
  }

  static Decoration childBodyDecoration(){
    return BoarderHelper.cardView(
      colorBackground: AppColors.backgroundAllScreens,
      colorLine: Colors.transparent,
      radiusBorder: BorderRadiusTools.top(radius:  20.h  )
    );
  }


  static double getAppBarHeight(BuildContext context ) {
    return  StatusBarSizeHelper.getHeight(context) + 150.hr  ;
  }

}