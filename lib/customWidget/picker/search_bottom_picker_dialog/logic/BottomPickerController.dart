

import 'package:fastor_app_ui_widget/core/utils/timer/ToolsWait.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/search_bottom_picker_dialog/SearchBottomPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';
import 'package:flutter/material.dart';

extension BottomPickerController on SearchBottomPickerDialogState {

  updateValueOfEntityWhileLoadingBuilder(DataPickerEntity entity){
    entity.isSelected = entity.id == selectedEntity?.id;
    entity.index = indexListview;
    indexListview += 1;
  }

  void inCaseShapeOneSingleClickAutoDismissDialog() {
    if( widget.bottomPickerShape == BottomPickerShapeEnum.oneClick ) {
      ToolsWait.waitToDo(300, (){
        successSelectAndDismissDialog();
      });
    }
  }

  successSelectAndDismissDialog(){
    Navigator.pop(context);
    widget.listener( selectedEntity! );
  }


}