import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonFullTransparent.dart';
import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonPrimary.dart';
import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonSemiTransparent.dart';
import 'package:fastor_app_ui_widget/customWidget/column/ColumnApp.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/bottom_picker_dialog/logic/BottomPickerController.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/bottom_picker_dialog/widget/ItemSelectedOrUnSelectedShape.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listener/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/widget/ListItemPicker.dart';

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';



enum BottomPickerShapeEnum {  confirmBottom, oneClick}

class BottomPickerDialog extends StatefulWidget {

  double? heightListviewFixed ; //

  BottomPickerShapeEnum? bottomPickerShape;

  String? previousSelectedId;
  DataPickerEntity? previousSelectedEntity;
  String titleDialog;
  List<DataPickerEntity> dataEntities;
  ListViewDialogPickerGenericListener listener;


  BottomPickerDialog({
    required this.titleDialog,
    required this.dataEntities,
    required this.listener,
    this.bottomPickerShape
  }){
    bottomPickerShape ??= BottomPickerShapeEnum.confirmBottom;
    setDefaultHeightFixedIfNeeded();
    setPreviousSelectedIfFound();
  }

  setDefaultHeightFixedIfNeeded(){
    if( dataEntities.length > 6) {
      heightListviewFixed  = Figma.h( 275 );
    }
  }


  void setPreviousSelectedIfFound() {
    if(  previousSelectedId == null ) return;
    for( var entity in  dataEntities ) {
      if (entity.id ==  previousSelectedId) {
        previousSelectedEntity = entity;
        break;
      }
    }
  }


  @override
  BottomPickerDialogState createState()  => BottomPickerDialogState( previousSelectedEntity);
}

class BottomPickerDialogState extends State<BottomPickerDialog> {

  //---------------------------------------------------------------- variable


  int indexListview = 0;
  DataPickerEntity? selectedEntity;

  BottomPickerDialogState(DataPickerEntity? previousSelectedEntity){
    selectedEntity =  previousSelectedEntity;
  }


  //---------------------------------------------------------------- ui

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  DeviceTools.getWidth(context), //MediaQuery.of(context).size.width,
      decoration: cardViewTopRadiusOnly(),
      child: contentUICard(),
    );
  }

  //---------------------------------------------------------------- card ui

  BoxDecoration cardViewTopRadiusOnly(   ) {
    //set default
    var radiusSize = 15.0;

    // radius
    var radiusBorder = BorderRadius.only(
      topLeft: Radius.circular(radiusSize ),
      topRight: Radius.circular(radiusSize ),
    );

    return BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3) , width:  1) ,
        borderRadius: radiusBorder ,
        color:  AppColor.textFieldBackground//Colors.white                                                          //background color
    );
  }


  Widget contentUICard(){
    return ColumnApp(
      children: [
        titleDialog(),
        listViewItems(),
        if( widget.bottomPickerShape! == BottomPickerShapeEnum.confirmBottom ) buttonChoose(),
        if( widget.bottomPickerShape! == BottomPickerShapeEnum.confirmBottom ) SizedBox(height: Figma.h(10),),
        if( widget.bottomPickerShape! == BottomPickerShapeEnum.confirmBottom ) buttonCancel(),
        SizedBox(height: Figma.h(10),),
      ],
    );
  }


  Widget titleDialog(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      alignment: LangApp.isArabic? Alignment.topRight : Alignment.topLeft, // LangApp.getAlignmentGeometryStart(),
      child:  Text( widget.titleDialog,
        style: TextStyle(
            color: AppColor.textPrimary,
            // fontFamily: FontResources.mediumPoppins,
            fontSize: Figma.h(16)
        ),
      ),
    );
  }

  //--------------------------------------------------------------- list view

  Widget listViewItems( ) {
    indexListview = 0;
    var listView =  ListView.builder(
        primary: true,
        shrinkWrap: true,
        itemCount: widget.dataEntities.length,
        itemBuilder: (ctx, index )   {
          var entity = widget.dataEntities[index];
          updateValueOfEntityWhileLoadingBuilder(entity);
          return itemPicker( entity);
        });
    return SizedBox(
      height: widget.heightListviewFixed,
      child: listView  ,
    );
  }

  Widget itemPicker(DataPickerEntity entity) {
    return     ItemSelectedOrUnSelectedShape(
      entity: entity,
      isHideImage: true ,
      listener: (DataPickerEntity entity ){
        //print("BottomPickerDialog - click - entity: $entity");
        setState(() {
          selectedEntity = entity;
          inCaseShapeOneSingleClickAutoDismissDialog();
        });
      },
    );
  }

  Widget buttonChoose(){
    return ButtonPrimary( "Choose".tra(), () {
      if(selectedEntity == null ) {
        ToolsToast.bottom(context,  "choose one item".tra() );
        return;
      }
      successSelectAndDismissDialog();
    },
      radius: 0,
      height: Figma.h(43),
      fontSize: Figma.h(16),
    );
  }


  Widget buttonCancel(){
    return ButtonFullTransparent(
      "Cancel".tra(),
          (){
        Navigator.pop(context);
      },
      width: MediaQuery.of(context).size.width,
      radius: 0,
      height: Figma.h(43),
      fontSize: Figma.h(16),
    ) ;
  }


}