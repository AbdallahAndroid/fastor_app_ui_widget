
import 'package:fastor_app_ui_widget/customWidget/chart/core/ChartDataEntity.dart';

class ChartDataModel extends ChartDataEntity {

  ChartDataModel(super.pointX, super.pointY);

  @override
  String toString() {
    return 'ChartDataModel{pointX: $pointX, pointY: $pointY}';
  }



}