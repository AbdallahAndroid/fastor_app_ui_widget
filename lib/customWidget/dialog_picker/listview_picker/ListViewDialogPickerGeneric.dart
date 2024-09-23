import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/widget/ListItemPicker.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/typedef_dialog_picker.dart';


class ListViewDialogPickerGeneric extends StatelessWidget {

  List<DataPickerEntity> dataEntities;
  double? heightFrame;
  bool isHideImage;
  ListViewDialogPickerGenericListener listener;

  ListViewDialogPickerGeneric({
    required this.dataEntities,
    required this.isHideImage,
    this.heightFrame,
    required this.listener,

});


  @override
  Widget build(BuildContext context) {
     var listview = ListView.builder(
          primary: true,
         shrinkWrap: true,
         itemCount: dataEntities.length,
         itemBuilder: (ctx, index )   {
            var entity = dataEntities[index];
            return ListItemPicker(
              entity: entity,
              isFirstIndex: index == 0,
              isHideImage: isHideImage,
              listener: listener,
            );
     });
     return SizedBox(
       height: heightFrame,
       child: listview,
     );
  }


}