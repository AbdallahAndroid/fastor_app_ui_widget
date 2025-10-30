import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/card/glass/effect_glass_background_card.dart';
import 'package:fastor_app_ui_widget/customWidget/scaffold/ScaffoldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextUnderlineButton.dart';
import 'package:flutter/material.dart';

/// example to use :
///
///          if(  cubit!.state is CityErrorState ) MessageCardCenterScreen(
//               msg:  "Failed Download Cities".tra(),
//             onPressedOk: () => cubit!.downloadAllCitiesAndSettingMapValidateNotDownloadedYet()
//         ),
///
class MessageEffectGlassCenterScreen extends StatelessWidget {

  String title;
  String? description;
  String? titleOk;
  String? titleCancel;
  VoidCallback? onPressedOk;
  VoidCallback? onPressedCancel;
  double height;

  MessageEffectGlassCenterScreen( {
    required this.title,
    required this.onPressedOk,
    required this.height,
    this.onPressedCancel,
    this.description,
    this.titleOk,
    this.titleCancel
  });


  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      shapeTransparent: true ,
      shapeTransparentColor: Colors.transparent,
      body: Container(
        width: DeviceTools.getWidth(context),
        height: DeviceTools.getHeight(context),
        color: AppColors.backgroundDialogDismissCaseHaveMessageTypeEffectGlass , //Color(0x99000000), ///background all screen like dialog
        alignment: Alignment.center,
        child: cardMessage(context),
      ),
    );
  }


  cardMessage(BuildContext context ) {
    return EffectGlassBackgroundCard(
      radiusBorder: BorderRadiusTools.get( radius_all: 40.r ),
      width: AppDimension.dialogWidth(),
      height: height,
      child: Container(
        padding: EdgeInsets.all( 24.h ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox( height: 8.h,),

            TextApp( title,
              textAlign: TextAlign.center,
              fontSize: 18.sp,
              fontFamily: FontProject.w700,
            ),

            /// description
            if(description != null ) SizedBox( height: 20.h,),
            if(description != null ) TextApp( description!,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              fontFamily: FontProject.w500,
            ),

            /// shape buttons
            SizedBox( height: 32.h ,),
            if(onPressedCancel != null ) shapeTwoButtonOkAndCancel(context),
            if(onPressedCancel == null ) shapeButtonOk (context),

          ],
        ),
      ),
    );
  }


  shapeTwoButtonOkAndCancel(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        /// ok
        ButtonApp( titleOk??"OK".tr(),   (){

          if(onPressedOk != null ) onPressedOk!();
          if(onPressedOk == null ) Navigator.pop(context);
        } ,
          width: AppDimension.dialogWidth(),
        ),

        // cancel
        if(onPressedCancel != null || titleCancel != null ) SizedBox( height: 20.h ,),
          if(onPressedCancel != null || titleCancel != null ) buttonCancelUI(context),

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

  buttonCancelUI(BuildContext context ) {
    return TextUnderlineButton( titleCancel??"Cancel".tr(),
          onTap: (  ){
            Navigator.pop(context);
      if(onPressedCancel != null ) onPressedCancel!();
    } ,
      widthUnderLine: LangApp.isArabic ? 45 : 70,
    );
  }



}