import 'dart:ui';

import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
// import 'package:fastor_app_ui_widget/core/log/Log.dart';
// import 'package:fastor_app_ui_widget/core/utils/theme/ColorProject.dart';
// import 'package:fastor_app_ui_widget/core/utils/theme/app_dimension.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/dropdown_floating_label_picker/logic/DropdownShapeDialogController.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/listener/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';


import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';

class DropdownFloatingLabelWithEntityAllPicker extends StatelessWidget {


  double width;
  String title;
  String hint;

  bool? showProgress;
  List<DataPickerEntity?>? dataEntities;
  ListViewDialogPickerGenericListener onSelectEntity;
  VoidCallback onSelectAll;

  /// data
  DataPickerEntity entityAll;

  //error
  Map<String, dynamic>? errorsMessageArray;
  String? errorKeySearchingInErrorMessageArray;
  String? messageError;

  /// previous selected
  DataPickerEntity? dataSelectedPrevious;
  String? previousSelectedId;

  Color colorBackgroundInputField;

  DropdownFloatingLabelWithEntityAllPicker({
    required this. width,
    required this.title,
    required this.hint,
    required this.dataEntities,
    required this.onSelectEntity,
    required this.onSelectAll,
    required this.colorBackgroundInputField,
    required this.entityAll,

    this.showProgress,
    this.previousSelectedId,
    this.messageError,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,
  }) {
    if(dataEntities != null ) dataEntities!.insert(0, entityAll);

    showProgress ??= false;
    setMessageErrorFromErrorsArray();
    searchForPreviousSelectedValue();
    // Log.i("DropdownFloatingLabelWithEntityAllPicker - title: $title /previousSelectedValue: ${previousSelectedId}" );
    // Log.i("DropdownFloatingLabelWithEntityAllPicker - title: $title /messageError: ${messageError}" );
  }


  setMessageErrorFromErrorsArray(){
    if( messageError != null ) return;
    if( errorKeySearchingInErrorMessageArray == null ) return;
    if( errorsMessageArray == null ) return;
    messageError =  errorsMessageArray!.keys.contains( errorKeySearchingInErrorMessageArray) ? errorsMessageArray![errorKeySearchingInErrorMessageArray][0] : null;
  }



  void searchForPreviousSelectedValue() {
    if(  previousSelectedId == null ) return;
    if(  dataEntities == null ) return;
    for( DataPickerEntity? entity in  dataEntities! ){
      if( entity?.title ==  previousSelectedId  ||
          entity?.id  ==  previousSelectedId
      ){
        dataSelectedPrevious = entity;
        Log.i("DropdownFloatingLabelPicker - searchForPreviousSelectedValue - found entity: ${entity}" );
        break;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // Log.i("DropdownTypeDialogState - messageError: ${widget.messageError} /title: ${widget.title}");
    return GestureDetector(
      child: dropdownUIShape(context),
      onTap: (){
        validaBeforeOpenDialogPicker(context);
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
          if( isNotSelectedYetAndThereIsMessageError() ) _errorMessage(),
        ],
      ),
    );
  }

  bool isNotSelectedYetAndThereIsMessageError() {
    return  dataSelectedPrevious == null &&   messageError != null;
  }

  Widget _titleFloating(){
    return Transform.translate(
      offset:   Offset(0, -12.sp /2  ), // x = 0, y = -12 (move UP by 12 px)
      child:  Container(
        margin: EdgeInsets.symmetric( horizontal: 16.5.w ),
        color:  colorBackgroundInputField ,
        padding: EdgeInsets.symmetric( horizontal: 4.w  ),
        child: TextApp(  title ,
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
        decoration: BoarderHelper.cardView(
            colorBackground:  colorBackgroundInputField,
            colorLine: AppColors.textFieldBoarder,
            radiusSize: AppDimension.textFieldRadiusBoarder
        ),
        padding: AppDimension.textFieldPadding,
        child:   showProgress! ? progressCenter(context) : _dropdownShapeContentUI(context)
    );
  }


  Widget progressCenter(BuildContext context ) {
    return Container(
      width: DeviceTools.getWidth(context),
      height: AppDimension.textFieldHeight,
      alignment: Alignment.center,
      child: ProgressCircleApp(   size: 25.sp  ),
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
    return Image.asset( "assets/icons/dropdown_trangle.png",
      width: 12.w,
      height: 6.h ,
      color: AppColors.textFieldText,
    );
    // return Icon( Icons.arrow_drop_down_sharp , size: Figma.w(24), color: Colors.black,);
  }


  Widget hintOrSelectedTextWidget(){
    //Log.i("hintOrSelectedTextWidget() - dataSelected: $dataSelected");
    if( dataSelectedPrevious != null ) {
      return _selectedNameWidget();
    } else {
      return _hintWidget();
    }
  }


  Widget _selectedNameWidget(){
    return TextApp( dataSelectedPrevious?.title??"",
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


  Widget _errorMessage(){
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: TextApp(   messageError??"",
        color: AppColors.textFieldError,
        fontSize: Figma.w(12),
      ),
    );
  }

}