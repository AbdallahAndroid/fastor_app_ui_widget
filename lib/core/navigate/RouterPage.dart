import 'package:fastor_app_ui_widget/core/navigate/NavigationTools.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/bottom_picker_dialog/BottomPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/listener/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/search_bottom_picker_dialog/SearchBottomPickerDialog.dart';
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
      barrierColor: AppColors.dialogDismisableBackground,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context), // forces inheritance
          child: dialog,
        );
      },
    );
  }


  static void dialogPickerGenericTypeSearchBottomSheet({
    required BuildContext context,
    required String titleDialog,
    required List<DataPickerEntity> dataEntities,
    required ListViewDialogPickerGenericListener listener,
    String? previousSelectedId
  }) {
    var dialog = SearchBottomPickerDialog(
      titleDialog: titleDialog,
      dataEntities: dataEntities,
      previousSelectedId: previousSelectedId,
      listener: listener,
    );
    NavigationTools.pushTransparentAnimateFade(context, dialog);
  }

  static mapPickerScreen( {
    required BuildContext context,
    required String? lat,
    required String? lng,
    required PickerLocationOnComplete onComplete
  } ) {
    var page = PickerLocationScreen(
        dataSelectedPreviousLat: lat,
        dataSelectedPreviousLng: lng ,
        onComplete: onComplete );
    NavigationTools.pushAnimateFade(context, page);
  }


}