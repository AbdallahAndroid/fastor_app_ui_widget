import 'dart:ui';

import 'package:fastor_app_ui_widget/core/navigate/NavigationTools.dart';
import 'package:fastor_app_ui_widget/core/navigate/RouterPage.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/customWidget/map/picker_location/picker_location_screen.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:fastor_app_ui_widget/customWidget/textfield/error_text/error_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';

class PickerLocationDropdown extends StatelessWidget {


  double width;

  String hint;
  String? dataSelectedPreviousLat, dataSelectedPreviousLng;

  //error
  Map<String, dynamic>? errorsMessageArray;
  String? errorKeySearchingInErrorMessageArray;
  String? messageError;

  final PickerLocationOnComplete onComplete;

  PickerLocationDropdown({
    required this. width,
    required this.hint,
    required this.onComplete,
    this.dataSelectedPreviousLat,
    this.dataSelectedPreviousLng,
    this.messageError,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
  }) {
    setMessageErrorFromErrorsArray();
  }


  setMessageErrorFromErrorsArray(){
    if( messageError != null ) return;
    if( errorKeySearchingInErrorMessageArray == null ) return;
    if( errorsMessageArray == null ) return;
    messageError =  errorsMessageArray!.keys.contains( errorKeySearchingInErrorMessageArray) ? errorsMessageArray![errorKeySearchingInErrorMessageArray][0] : null;
  }




  @override
  Widget build(BuildContext context) {
    // Log.i("DropdownTypeDialogState - messageError: ${widget.messageError} /title: ${widget.title}");
   return GestureDetector(
     child: dropdownUIShape(context),
     onTap: (){
       RouterPage.mapPickerScreen(
         context: context,
         lat: dataSelectedPreviousLat,
         lng: dataSelectedPreviousLng,
         onComplete: onComplete
       );
     },
   );
  }


  Widget dropdownUIShape(BuildContext context ){
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [

          /// floating label shape
          Stack(
            children: [
              boxDropdown(context ),
              _titleFloating(),
            ],
          ),

          /// error message
          if( isNotSelectedYetAndThereIsMessageError() ) ErrorTextfield( messageError??""),
        ],
      ),
    );
  }

  bool isNotSelectedYetAndThereIsMessageError() {
    return  dataSelectedPreviousLat == null &&   messageError != null;
  }

  Widget _titleFloating(){
    return Transform.translate(
      offset:   Offset(0, -12.sp /2  ), // x = 0, y = -12 (move UP by 12 px)
      child:  Container(
        margin: EdgeInsets.symmetric( horizontal: 16.5.w ),
        color: AppColors.textFieldLabelBackground, // AppColor.textFieldBackground ,
        padding: EdgeInsets.symmetric( horizontal: 4.w  ),
        child: TextApp(  hint  ,
          color:  AppColors.textFieldLabel,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp ,
        ),
      ),
    );
  }


  Widget boxDropdown(BuildContext context ){
    return Container(
        width: DeviceTools.getWidth(context),
        height: AppDimension.textFieldHeight,
        decoration: AppDecoration.dropdownShapeTextField(),
      padding: AppDimension.textFieldPadding,
      child:    _dropdownShapeContentUI(context)
    );
  }


  Widget _dropdownShapeContentUI(BuildContext context ){
    return  Stack(
      children: [
        SizedBox( width: DeviceTools.getWidth(context) , height: AppDimension.textFieldHeight ,),

        /// hint or selected text
        PositionedApp.langApp(
            left: 0,
            top: 0,
            bottom: 0,

            /// fixing the issue of center alignment for title
            child: Container(
              alignment: LangApp.getAlignmentGeometryStartCenter(),
              constraints: BoxConstraints( minHeight: 23.h ),
              // color: Colors.green,
              child: hintOrSelectedTextWidget(),
            )
        ),

        /// triangle icon
        PositionedApp.langApp(child: triangleIcon(), right: 0, top: 0, bottom: 0 ),
      ],);
  }


  Widget triangleIcon(){
    return Image.asset( "assets/icons/picker_location_dropdown.png",
      width: 24.h,
      height: 24.h ,
      color: AppColors.textFieldText,
    );
    // return Icon( Icons.arrow_drop_down_sharp , size: Figma.w(24), color: Colors.black,);
  }

 
  Widget hintOrSelectedTextWidget(){
    //Log.i("hintOrSelectedTextWidget() - dataSelected: $dataSelected");
    if( dataSelectedPreviousLat != null ) {
      return _selectedNameWidget();
    } else {
      return _hintWidget();
    }
  }


  Widget _selectedNameWidget(){
    return TextApp(  "location have been selected".tr(),
      color: AppColors.textFieldText,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp ,
    );
  }


  Widget _hintWidget(){
    return TextApp(   hint ,
      color: AppColors.textFieldText,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp ,
    );
  }




}