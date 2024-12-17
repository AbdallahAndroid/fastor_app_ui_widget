import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

import 'package:fastor_app_ui_widget/customWidget/chart/TransactionDoublePriceChart/TransactionDoublePriceChart.dart';
import 'package:fl_chart/fl_chart.dart';

extension ChartController on TransactionDoublePriceChartState {

  initValueRawBarGroupFromArrayData(){
    for( int i = 0; i < widget.valuesOne.length; i++ ) {
      // var xPoint = widget.titles[i];
      var yPointOne  = widget.valuesOne[i];
      var yPointTwo  = widget.valuesTwo[i];
      Log.i("initValueRawBarGroupFromArrayData() - "
          "yPointOne: $yPointOne /yPointTwo: $yPointTwo"   );
      final barGroup = mapGroupData( i , yPointOne, yPointTwo);
      rawBarGroups.add( barGroup);
    }
    showingBarGroups = rawBarGroups;
  }


  bool isThisValueFoundInAnyYPoint( double valueToSearch )  {
    for( int i = 0; i < widget.valuesOne.length; i++ ) {
      var yPointOne  = widget.valuesOne[i];
      var yPointTwo  = widget.valuesTwo[i];
      if( valueToSearch == yPointOne || valueToSearch == yPointTwo ) {
        return true;
      }
    }
    return false;
  }


  BarChartGroupData mapGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.colorLineOne,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.colorLineTwo,
          width: width,
        ),
      ],
    );
  }

}