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



  static DataPickerEntity getEntityDefault({ String? image}) {
    return DataPickerEntity(
      index: 0,
      id: "default",
      title: "Default".tr(),
      image: image,
    );
  }


  static bool isEntityAll(DataPickerEntity selected) {
    return selected.id == getEntityAll().id;
  }

}