import 'package:fastor_app_ui_widget/customWidget/dialog_picker/bottom_picker_dialog/BottomPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/toast/ToolsToast.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/dropdown_open_picker/DropdownTypeDialogPicker.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';

extension DropdownShapeDialogController on DropdownTypeDialogState {

  void validaBeforeOpenDialogPicker() {

    if( widget.dataEntities == null || widget.dataEntities!.isEmpty ) {
      ToolsToast.bottom(context,  "No Items Found".tra() );
      return;
    }

     dialogBottomSheepPickerGeneric(
        context: context,
        titleDialog: widget.title,
        dataEntities: widget.dataEntities as List<DataPickerEntity>,
        listener: ( DataPickerEntity selected ) {
          setState(() {
            this.dataSelected = selected;
            widget.listener(selected);
          });

        }
    );
  }

  static void dialogBottomSheepPickerGeneric({
    required BuildContext context,
    required String titleDialog,
    required List<DataPickerEntity> dataEntities,
    required ListViewDialogPickerGenericListener listener,
  }) {
    var dialog = BottomPickerDialog(
      titleDialog: titleDialog,
      dataEntities: dataEntities,
      listener: listener,
    );

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.1),
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

}