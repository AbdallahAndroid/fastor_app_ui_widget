import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/bottom_picker_dialog/BottomPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/listener/typedef_dialog_picker.dart';
import 'package:flutter/material.dart';

class RouterPage{


  ///----------------------------------------------------------------- picker dialog

  static void dialogBottomSheepPickerGeneric({
    required BuildContext context,
    required String titleDialog,
    required List<DataPickerEntity> dataEntities,
    required ListViewDialogPickerGenericListener listener,
    String? previousSelectedId
  }) {
    var dialog = BottomPickerDialog(
      titleDialog: titleDialog,
      dataEntities: dataEntities,
      previousSelectedId: previousSelectedId,
      listener: listener,
    );

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColor.dialogDismisableBackground,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context), // forces inheritance
          child: dialog,
        );
      },
    );
  }


}