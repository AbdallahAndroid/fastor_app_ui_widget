import 'package:fastor_app_ui_widget/core/navigate/RouterPage.dart';

import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerMapper.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/dropdown_floating_label_picker/DropdownFloatingLabelWithEntityAllPicker.dart';

import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';


import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:flutter/material.dart';

extension DropdownShapeDialogController on DropdownFloatingLabelWithEntityAllPicker {

  void validaBeforeOpenDialogPicker(BuildContext context ) {

    /// case no items
    if(  dataEntities == null ||  dataEntities!.isEmpty ) {
      ToolsToast.bottom(context,  "No Items Found".tra() );
      return;
    }

    /// case only one item ( entityAll )
    if(  dataEntities!.length  == 1 ) {
      ToolsToast.bottom(context,  "No Items Found".tra() );
      return;
    }

    RouterPage.dialogBottomSheepPickerGeneric(
        context: context,
        titleDialog:  title,
        dataEntities:  dataEntities as List<DataPickerEntity>,
        previousSelectedId: dataSelectedPrevious?.id??DataPickerMapper.getEntityAll().id,
        listener: ( DataPickerEntity selected ) {

          /// update by type "entity all" or any other entity
          if( DataPickerMapper.isEntityAll(selected) ) {
            this.dataSelectedPrevious = null ;
             onSelectAll( );
          }  else {
            this.dataSelectedPrevious = selected;
             onSelectEntity(selected);
          }
        }
    );


  }


}