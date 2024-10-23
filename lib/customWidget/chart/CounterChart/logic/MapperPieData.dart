
import 'package:fastor_app_ui_widget/core/values/ToolsNumber.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/CounterChart/CounterChart.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/CounterChart/logic/RequestMapperToPioChart.dart';
import 'package:fl_chart/fl_chart.dart';

extension MapperPieData on CounterChartState {



  /**
      PieChartSectionData(
      color: Colors.blue,
      value: 40,
      title: '40%',
      radius: 40,
      titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      )
   */

  PieChartSectionData mapMetaDataIntoObjectPieChartSectionData(RequestMapperToPioChart request) {
    return PieChartSectionData(
      color: request.color,
      value: request.value,
      title: chooseTitleInChartResponsive(request.title!, request.value!),
      titleStyle: widget.textStyle,
      radius: calculateRadiusResponsive(request.value!)
      // radius: 100
    );
  }


  double calculateRadiusResponsive( double requestValue ){
    if( requestValue < 30 ) {
      return 100 - requestValue;
    }
    if( requestValue > 80 ) {
      return requestValue - 30;
    }
    return 80;
  }


  String chooseTitleInChartResponsive(String requestTitle , double requestValue){
    String valueRound1 = ToolsNumber.roundToPlus1( requestValue).toString();
    if( requestValue < 30 ) {
      return  valueRound1;
    }

    return requestTitle + "\n" + valueRound1;
  }

}