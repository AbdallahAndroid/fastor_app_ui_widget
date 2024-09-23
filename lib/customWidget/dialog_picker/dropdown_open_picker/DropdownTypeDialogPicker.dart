import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/dropdown_open_picker/logic/DropdownShapeDialogController.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';

class DropdownTypeDialogPicker extends StatefulWidget {

  String title;

  bool? showProgress;
  List<DataPickerEntity?>? dataEntities;
  ListViewDialogPickerGenericListener listener;

  //error
  Map<String, dynamic>? errorsMessageArray;
  String? errorKeySearchingInErrorMessageArray;
  String? messageError;

  DropdownTypeDialogPicker({
    required this.title,
    required this.dataEntities,
    required this.listener,
    this.showProgress,
    this.messageError,
    this.errorsMessageArray,
    this.errorKeySearchingInErrorMessageArray
  }) {

    showProgress ??= false;
  }

  @override
  DropdownTypeDialogState createState()  => DropdownTypeDialogState( );

}

class DropdownTypeDialogState extends State<DropdownTypeDialogPicker> {

  DataPickerEntity? dataSelected;

  
  @override
  Widget build(BuildContext context) {
    // Log.i("DropdownTypeDialogState - messageError: ${widget.messageError} /title: ${widget.title}");
   return GestureDetector(
     child: dropdownUIShape(),
     onTap: (){
       validaBeforeOpenDialogPicker();
     },
   );
  }


  Widget dropdownUIShape(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _titleCropping(),
         SizedBox( height: Figma.h(14),),
        boxDropdown(),
        if( isNotSelectedYetAndThereIsMessageError() ) _errorMessage(),
      ],
    );
  }

  bool isNotSelectedYetAndThereIsMessageError() {
    return  dataSelected == null &&  widget.messageError != null;
  }

  Widget _titleCropping(){
    return TextApp( widget.title ,
      color: Colors.black,
      fontSize: Figma.h(14),
    );
  }


  Widget boxDropdown(){
    return Container(
        width: DeviceTools.getWidth(context),
        height: Figma.h(43),
        decoration: BoarderHelper.cardView(
          colorBackground: Colors.grey.withOpacity(0.5),
          colorLine: Colors.black,
          radiusSize: Figma.h(4 )
      ),
      padding: LangApp.onlyEdgeInsets(
          left:  Figma.w(24),
          right: Figma.w( LangApp.isArabic ? 20 : 24 ),
          top: Figma.h(5),
          bottom: Figma.h(5)
      ),
      child:  widget.showProgress! ? progressCenter() : _dropdownShapeContentUI()
    );
  }

  Widget progressCenter() {
    return Container(
      width: DeviceTools.getWidth(context),
      height: Figma.h(43),
      alignment: Alignment.center,
      child: ProgressCircleApp(color: Colors.orange, size: 40 ),
    );
}

  Widget _dropdownShapeContentUI(){
    return  Stack( children: [
    SizedBox( width: DeviceTools.getWidth(context) , height: Figma.h(43) ,),
    PositionedApp.langApp(child: hintOrSelectedTextWidget(), left: 0, top: Figma.h(8)),
    PositionedApp.langApp(child: triangleIcon(), right: 0, top: Figma.h( 4 ) ),

    ],);
  }

  Widget triangleIcon(){
    return Icon( Icons.arrow_drop_down_sharp , size: Figma.w(24), color: Colors.black,);
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
    return TextApp( dataSelected?.title??"",
      color: Colors.black,
      fontSize: Figma.h(14),
    );
  }


  Widget _hintWidget(){
    return TextApp(  widget.title,
      color: Colors.grey,
      fontSize: Figma.h(14),
    );
  }


  Widget _errorMessage(){
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: TextApp(  widget.messageError??"",
        color: Colors.red,
        fontSize: Figma.w(12),
      ),
    );
  }


}