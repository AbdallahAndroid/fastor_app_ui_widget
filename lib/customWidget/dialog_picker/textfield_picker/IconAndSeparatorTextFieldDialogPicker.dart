

import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listener/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/textfield_picker/logic/DropdownShapeDialogController.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/text_custom/TextCustomRegular.dart';
import 'package:flutter/material.dart';

class IconAndSeparatorTextFieldDialogPicker extends StatefulWidget {


  String? hint;

  bool? showProgress;
  List<DataPickerEntity >  dataEntities;
  ListViewDialogPickerGenericListener listener;

  //error
  Map<String, dynamic>? errorsMessageArray;
  String? errorKeySearchingInErrorMessageArray;
  String? messageError;

  Color? colorLineBoarder;

  Widget icon;

  Decoration? decoration;
  double? height;
  double? width;

  IconAndSeparatorTextFieldDialogPicker({
    this.hint,
    this.colorLineBoarder,
    //   colorLineBoarder: AppColor.textFieldLightBoarderLine,
    required this.icon,
    required this.dataEntities,
    required this.listener,
    this.showProgress,
    this.messageError,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray,

    this.decoration,
    this.height,
    this.width,

  }) {

    showProgress ??= false;
    setMessageErrorFromErrorsArray();
  }


  setMessageErrorFromErrorsArray(){
    if( messageError != null ) return;
    if( errorKeySearchingInErrorMessageArray == null ) return;
    if( errorsMessageArray == null ) return;
    messageError =  errorsMessageArray!.keys.contains( errorKeySearchingInErrorMessageArray) ? errorsMessageArray![errorKeySearchingInErrorMessageArray][0] : null;
  }


  @override
  IconAndSeparatorTextFieldDialogState createState()  => IconAndSeparatorTextFieldDialogState( );

}

class IconAndSeparatorTextFieldDialogState extends State<IconAndSeparatorTextFieldDialogPicker> {

  DataPickerEntity? dataSelected;

  
  @override
  Widget build(BuildContext context) {
    // Log.i("DropdownTypeDialogPicker - errorsMessageArray: ${widget.errorsMessageArray} /errorKeySearchingInErrorMessageArray: ${widget.errorKeySearchingInErrorMessageArray} /messageError: ${widget.messageError}");
   return GestureDetector(
     child: contentUI(),
     onTap: (){
       validaBeforeOpenDialogPicker();
     },
   );
  }


  Widget contentUI(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          iconAndTextField(),
        if( isNotSelectedYetAndThereIsMessageError() ) _errorMessage(),
    ],
    );
  }


  Widget divider(){
    return Container(
      width: 2,
      height: 25,
      color: AppColor.textFieldHint,
    ) ;
  }


  bool isNotSelectedYetAndThereIsMessageError() {
    return  dataSelected == null &&  widget.messageError != null;
  }

  Widget iconAndTextField(){
    return Container(
      width: widget.width ,
      height: widget.height??DimensionResource.textFieldHeight,
      alignment: LangApp.getAlignmentGeometryStartCenter(),//Alignment.centerLeft,
      decoration: widget.decoration ?? BoarderHelper.cardView(
          colorLine: Colors.grey.withOpacity( 0.5),
          radiusSize: 15,
          colorBackground: Colors.white
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox( width: 10 ,),
          widget.icon,
          SizedBox( width: 10 ,),
          divider(),
          SizedBox( width: 10 ,),
          chooseProgressOrTextfield() ,
        ],
      ),
    );
  }


  Widget chooseProgressOrTextfield(){
    return widget.showProgress! ? progressCenter() : hintOrSelectedTextWidget();
  }

  Widget progressCenter() {
    return Container(
      width: DeviceTools.getWidth(context),
      height: Figma.h(43),
      alignment: Alignment.center,
      child: ProgressCircleApp(
          color: AppColor.progress,
          size: 40 ),
    );
}


 
  Widget hintOrSelectedTextWidget(){
    //Log.i("hintOrSelectedTextWidget() - dataSelected: $dataSelected");
    if( dataSelected != null ) {
      return _selectedNameWidget();
    } else {
      return _hintWidget();
    }
  }


  Widget _selectedNameWidget(){
    return TextCustomRegular( dataSelected?.title??"",
      color: AppColor.textFieldText,
      fontSize: Figma.h(16),
    );
  }


  Widget _hintWidget(){
    return TextCustomRegular(  widget.hint??"select",
      color: AppColor.textFieldHint,
      fontSize: Figma.h(16),
    );
  }


  Widget _errorMessage(){
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: TextCustomRegular(  widget.messageError??"",
        color: Colors.red,
        fontSize: Figma.w(12),
      ),
    );
  }


}