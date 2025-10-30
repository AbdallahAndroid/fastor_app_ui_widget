
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:flutter/material.dart';

class BodyScaffoldCornerTopBottomDifferentColor extends StatelessWidget {

  Widget body;

  BodyScaffoldCornerTopBottomDifferentColor( { required this.body });


  @override
  Widget build(BuildContext context) {
      return Container(
        width: DeviceTools.getWidth(context),
        color: AppColors.primary,
        child: ClipRRect(
            borderRadius: BorderRadiusTools.top( radius: AppDimension.radiusAllScreen ),
            child: Container(
              color: AppColors.colorBackgroundNavigation,
              child: ClipRRect(
                borderRadius: BorderRadiusTools.bottom( radius: AppDimension.radiusAllScreen ),
                child: body ,
              ),
            )
        ),
      );
  }
}