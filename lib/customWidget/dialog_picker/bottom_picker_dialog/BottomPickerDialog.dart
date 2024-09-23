import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonFullTransparent.dart';
import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonPrimary.dart';
import 'package:fastor_app_ui_widget/customWidget/button/button_cutom/ButtonSemiTransparent.dart';
import 'package:fastor_app_ui_widget/customWidget/column/ColumnApp.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/bottom_picker_dialog/logic/BottomPickerController.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/bottom_picker_dialog/widget/ItemSelectedOrUnSelectedShape.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/widget/ListItemPicker.dart';

import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';



class BottomPickerDialog extends StatefulWidget {

  double? heightListviewFixed ; //

  String titleDialog;
  List<DataPickerEntity> dataEntities;
  ListViewDialogPickerGenericListener listener;

  BottomPickerDialog({
    required this.titleDialog,
    required this.dataEntities,
    required this.listener,
  }){

    setDefaultHeightFixedIfNeeded();
  }

  setDefaultHeightFixedIfNeeded(){
    if( dataEntities.length > 6) {
      heightListviewFixed  = Figma.h( 275 );
    }
  }

  @override
  BottomPickerDialogState createState()  => BottomPickerDialogState();
}

class BottomPickerDialogState extends State<BottomPickerDialog> {

  //---------------------------------------------------------------- variable


  int indexListview = 0;
  DataPickerEntity? selectedEntity;



  //---------------------------------------------------------------- ui

  @override
  Widget build(BuildContext context) {
     return Container(
       width:  DeviceTools.getWidth(context), //MediaQuery.of(context).size.width,
       // height: 300,
       decoration: cardViewTopRadiusOnly(),
       child: contentUICard(),
     );
  }

  //---------------------------------------------------------------- card ui

  BoxDecoration cardViewTopRadiusOnly(   ) {
    //set default
    var radiusSize = 15.0;
    var colorBackground  = Colors.white ;
    var colorLine = Colors.grey.withOpacity(0.3)  ;

    // radius
    var radiusBorder = BorderRadius.only(
      topLeft: Radius.circular(radiusSize ),
      topRight: Radius.circular(radiusSize ),
    );

    return BoxDecoration(
        border: Border.all(color: colorLine , width:  1) ,
        borderRadius: radiusBorder ,
        color: colorBackground                                                          //background color
    );
  }


  Widget contentUICard(){
    return ColumnApp(
      children: [
        titleDialog(),
        listViewItems(),
        buttonChoose(),
        SizedBox(height: Figma.h(10),),
        buttonCancel(),
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
            color: Colors.black,
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
      Navigator.pop(context);
      widget.listener( selectedEntity! );
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