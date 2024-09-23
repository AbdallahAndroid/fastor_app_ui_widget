import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/dropdown_open_picker/logic/DropdownShapeDialogController.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/dropdown_small_open_picker/logic/DropdownSmallShapeDialogController.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/select/DropdownApp.dart';
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart'; 

class DropdownSmallTypeDialogPicker extends StatefulWidget {


  double width;
  String hint;
  String? messageError;
  bool? showProgress;
  List<DataPickerEntity?>? dataEntities;
  ListViewDialogPickerGenericListener listener;

  DropdownSmallTypeDialogPicker({
    required this.width,
    required this.hint,
    required this.dataEntities,
    required this.listener,
    this.showProgress,
    this.messageError,
  }) {

    showProgress ??= false;
  }

  @override
  DropdownSmallTypeDialogState createState()  => DropdownSmallTypeDialogState( );

}

class DropdownSmallTypeDialogState extends State<DropdownSmallTypeDialogPicker> {

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
        boxDropdown(),
        if( isNotSelectedYetAndThereIsMessageError() ) _errorMessage(),
      ],
    );
  }

  bool isNotSelectedYetAndThereIsMessageError() {
    return  dataSelected == null &&  widget.messageError != null;
  }


  Widget boxDropdown(){
    return Container(
        width: widget.width ,
        height: Figma.h(43),
        decoration: BoarderHelper.cardView(
          colorBackground: Colors.black,
          colorLine: Colors.black,
          radiusSize: Figma.h(4 )
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Figma.w(12),
      ),
      child:  widget.showProgress! ? progressCenter() : _dropdownShapeContentUI()
    );
  }

  Widget progressCenter() {
    return Container(
      width: widget.width,
      height: Figma.h(43),
      alignment: Alignment.center,
      child: ProgressCircleApp( color: Colors.white, size: 40 ,),
    );
}

  Widget _dropdownShapeContentUI(){
    return  Stack( children: [
    SizedBox( width: widget.width , height: Figma.h(43) ,),
    PositionedApp.langApp(child: hintOrSelectedTextWidget(), right: 0, top: dataSelected != null ? Figma.h(12) : Figma.h(10) ,),
    PositionedApp.langApp(child: triangleIcon(), left: 0, top: Figma.h( 10 ) ),

    ],);
  }

  Widget triangleIcon(){
    return Icon( Icons.arrow_drop_down_sharp , size: Figma.w(18), color: Colors.white,);
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
      color: Colors.white,
      fontSize: Figma.h(14),
    );
  }


  Widget _hintWidget(){
    return TextApp(  widget.hint,
      color: Colors.grey,
      fontSize: Figma.h(14),
    );
  }


  Widget _errorMessage(){
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: TextApp(  widget.messageError??"",
        color: Colors.red,
        fontSize: 12,
      ),
    );
  }


}