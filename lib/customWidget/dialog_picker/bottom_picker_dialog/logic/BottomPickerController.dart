import 'package:fastor_app_ui_widget/customWidget/dialog_picker/bottom_picker_dialog/BottomPickerDialog.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';

extension BottomPickerController on BottomPickerDialogState {

  updateValueOfEntityWhileLoadingBuilder(DataPickerEntity entity){
    entity.isSelected = entity.id == selectedEntity?.id;
    entity.index = indexListview;
    indexListview += 1;
  }


}