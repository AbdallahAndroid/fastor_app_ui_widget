import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

/// example to use :
///
///          if(  cubit!.state is CityErrorState ) MessageCardCenterScreen(
//               msg:  "Failed Download Cities".tra(),
//             onPressedOk: () => cubit!.downloadAllCitiesAndSettingMapValidateNotDownloadedYet()
//         ),
///
class MessageCardCenterScreen extends StatelessWidget {

  String msg;
  String? titleOk;
  String? titleCancel;
  VoidCallback? onPressedOk;
  VoidCallback? onPressedCancel;

  MessageCardCenterScreen( {
    required this.msg,
    required this.onPressedOk,
    this.onPressedCancel,
    this.titleOk,
    this.titleCancel
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceTools.getWidth(context),
      height: DeviceTools.getHeight(context),
      color: AppColors.backgroundDialogDismissCaseHaveMessageTypeEffectGlass , //Color(0x99000000), ///background all screen like dialog
      alignment: Alignment.center,
      child: cardMessage(context),
    );
  }

  cardMessage(BuildContext context ) {
    return Container(
      decoration: BoarderHelper.cardView(
        colorBackground: AppColors.backgroundDialog,
        radiusSize: AppDimension.radiusDialog(),
        colorLine: AppColors.dialogDismisableBackground
      ),
      width: AppDimension.dialogWidth(),
      // margin:  EdgeInsets.all( 15.w ),
      padding: EdgeInsets.all( 24.h ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox( height: 8.h,),

          TextApp( msg, fontSize: 18.sp, fontFamily: FontProject.w700, ),
          SizedBox( height: 32.h ,),

          /// shape buttons
          if(onPressedCancel != null ) shapeTwoButtonOkAndCancel(context),
          if(onPressedCancel == null ) shapeButtonOk (context),

        ],
      ),
    );
  }

  shapeTwoButtonOkAndCancel(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        /// ok
        ButtonApp( titleOk??"OK".tr(),   (){

          if(onPressedOk != null ) onPressedOk!();
          if(onPressedOk == null ) Navigator.pop(context);
        } ,
          width: 100.w ,
          height: 52.hr,
        ),

        // cancel
        if(onPressedCancel != null || titleCancel != null )ButtonApp( titleCancel??"Cancel".tr(),   (){

          if(onPressedCancel != null ) onPressedCancel!();
        } ,
          width: 100.w ,
          height: 52.hr ,
          background: AppColors.greyLight,
        ),

      ],
    );
  }


  shapeButtonOk(BuildContext context ){
    return ButtonApp( titleOk??"OK".tr(),   (){

      if(onPressedOk != null ) onPressedOk!();
      if(onPressedOk == null ) Navigator.pop(context);
      } ,

        width: AppDimension.dialogWidth() ,
        height: 52.hr,
      );
  }



}