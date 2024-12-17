

import 'package:fastor_app_ui_widget/customWidget/chart/core/ChartDataEntity.dart';

class ChatDataCalculator {


  static double getMinimumValuePointX(List<ChartDataEntity> array ) {
    if( array.isEmpty ) return 0;
    double min = array.first.pointX;
    array.forEach((element) {
      if( element.pointX < min ) {
        min = element.pointX;
      }
    });
    return min;
  }



  static double getMinimumValuePointY(List<ChartDataEntity> array ) {
    if( array.isEmpty ) return 0;
    double min = array.first.pointY;
    array.forEach((element) {
      if( element.pointY < min ) {
        min = element.pointY;
      }
    });
    return min;
  }



  static double getMaximumValuePointX(List<ChartDataEntity> array ) {
    if( array.isEmpty ) return 0;
    double max = array.first.pointX;
    array.forEach((element) {
      if( element.pointX > max ) {
        max = element.pointX;
      }
    });
    return max;
  }



  static double getMaximumValuePointY(List<ChartDataEntity> array ) {
    if( array.isEmpty ) return 0;
    double max = array.first.pointY;
    array.forEach((element) {
      if( element.pointY > max ) {
        max = element.pointY;
      }
    });
    return max;
  }


  static double getStepOfPointY(List<ChartDataEntity> array ) {
    if( array.isEmpty ) return 0;
    double minValue = ChatDataCalculator.getMinimumValuePointY(  array );
    double maxValue = ChatDataCalculator.getMaximumValuePointY(  array );
    double len = (array.length).toDouble();
    double valuesBetweenMinAnMax = maxValue - minValue;
    double stepUnit = valuesBetweenMinAnMax / len;
    //Log.i("getStepOfPointY() - minValue: $minValue /maxValue: $maxValue /len: $len /stepUnit: $stepUnit");
    return stepUnit * 0.5 ;
    // return 0.25;
  }



  static bool isVoteUp(List<ChartDataEntity> array ) {
    if( array.isEmpty ) return true ;
    double first = array.first.pointY;
    double last = array.last.pointY;
   // Log.i("isVoteUp() - first: $first");
   // Log.i("isVoteUp() - last: $last");
    return last >= first ;
  }

}