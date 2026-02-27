import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FloatingAdminAddButton extends FloatingActionButton {


  FloatingAdminAddButton({required super.onPressed });


    @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimension.paginateHeightFrame  + 16.h, right: AppDimension.marginAllScreen ),
      child: FloatingActionButton.small(
        onPressed: onPressed,
        backgroundColor: AppColors.white,
        // shape:
        child: Icon( Icons.add , size: 24.h , color: AppColors.primary,),
      ),
    );
  }

}