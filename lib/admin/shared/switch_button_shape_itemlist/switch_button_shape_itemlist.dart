import 'package:fastor_app_ui_widget/core/network/parse/ApiParserApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/switch/SwitchApp.dart';
import 'package:flutter/material.dart';

typedef SwitchButtonShapeItemListOnTap = void Function( bool newValue );

class SwitchButtonShapeItemList  extends StatelessWidget{

  String title;
  bool currentStatus;
  SwitchButtonShapeItemListOnTap  onTap;

  SwitchButtonShapeItemList({
    required this.title,
    required this.currentStatus,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var newValueVerseCurrentStatus = !makeBoolean(  currentStatus );
        onTap(  newValueVerseCurrentStatus );
      },
      child: Container(
        width: DeviceTools.getWidth(context),
        padding: EdgeInsets.all( AppDimension.radiusCard ),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: AppDecoration.selectedOrUnSelectedCardAdminPanel(   currentStatus, radius: AppDimension.radiusCard),
        child: SwitchApp(
            text:  title  ,
            color_switch_active: AppColors.red,
            size_scale: 0.7 ,
            defaultValue:  makeBoolean( currentStatus ),
            onChange: ( newValue){
              onTap(  newValue );
            }
        ),
      ),
    );
  }

}