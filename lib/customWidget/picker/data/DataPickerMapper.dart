import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/picker/data/DataPickerEntity.dart';

class DataPickerMapper {


  static DataPickerEntity getEntityAll() {
    return DataPickerEntity(
      index: 0,
      id: "all",
      title: "All".tr(),
    );
  }

  static bool isEntityAll(DataPickerEntity selected) {
    return selected.id == getEntityAll().id;
  }

}