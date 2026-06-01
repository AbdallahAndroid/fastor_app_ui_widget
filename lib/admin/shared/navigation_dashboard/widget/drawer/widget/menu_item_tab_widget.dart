import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItemTabWidget extends StatelessWidget {

  String title;
  IconData iconLeft;

  ///right shapes
  String? assetNameRight;
  String? textRight;

  bool? isHideDecoration;
  GestureTapCallback  onTap;

  bool isSelected;


  MenuItemTabWidget({
    required this.title,
    required this.iconLeft,
    required this.onTap,
    required this.isSelected,

    /// shape right
    this.textRight,
    this.assetNameRight,

    this.isHideDecoration = false ,
});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Directionality(
        textDirection: LangApp.getTextDirection(),
        child:  Container(
          margin: EdgeInsets.only(
              top:  6.h,
              left:  6.h,
              right: 6.h
          ),
          decoration: isHideDecoration! ? null : AppDecoration.tapMenuWithIcon( isSelected: isSelected),
          color: isHideDecoration! ? Colors.transparent : null ,
          width: DeviceTools.getWidth(context),
          height: 64.h, // 64.h ,
          padding: EdgeInsets.symmetric(horizontal: 20.h ),
          alignment: LangApp.getAlignmentGeometryStartCenter(),
          child:  Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Icon( iconLeft,
                size: 24.h,
                // size: isSelected ? 30.h : 24.h,
                color: AppColors.primaryDark,
              ),
              SizedBox( width: 16.h ,),

              /// title with max height
              Container(
                constraints: BoxConstraints(
                    maxWidth: 180.h
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextApp( title,
                    fontSize: 16.h ,
                    fontFamily: isSelected ? FontProject.w700 : FontProject.w500,
                  ),
                ),
              ),

              /// right
              Spacer(),
              chooseShapeRightWidget()


            ],
          ),
        ),
      ),
    );
  }


  Widget chooseShapeRightWidget() {
    if( assetNameRight != null ) {
      return Image.asset( assetNameRight??"",
        width: 18.h,
        height: 18.h ,
      );
    }

    /// case found text like "english"
    if( ToolsValidation.isValid( textRight ) ) {
      return  TextApp( textRight??"",
        fontSize: 14.h ,
        fontFamily: FontProject.w600,
      );
    }


    /// default  "assets/icons/back_icon_profile.png"
    return Image.asset( "assets/icons/back_icon_profile.png",
      width: 18.h,
      height: 18.h ,
      color: isSelected ? AppColors.black : null ,
    );
  }


}