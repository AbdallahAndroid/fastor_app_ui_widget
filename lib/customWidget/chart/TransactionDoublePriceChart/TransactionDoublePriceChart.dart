import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsNumber.dart';

import 'package:fastor_app_ui_widget/customWidget/chart/TransactionDoublePriceChart/logic/ChartController.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/TransactionDoublePriceChart/widget/TouchChart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TransactionDoublePriceChart extends StatefulWidget {

  List<String> titles;
  List<double> valuesOne;
  List<double> valuesTwo;
  Color colorLineOne;
  Color colorLineTwo;
  Color colorAverage;
  TextStyle? textStyle;

  TransactionDoublePriceChart( {
    required this.titles,
    required this.valuesOne,
    required this.valuesTwo,
    required  this.colorLineOne,
    required  this.colorLineTwo,
    required this.colorAverage,
    this.textStyle,
  });

  @override
  TransactionDoublePriceChartState createState() => TransactionDoublePriceChartState();
}

class TransactionDoublePriceChartState extends State<TransactionDoublePriceChart> {

  final double width = 7;
  List<BarChartGroupData> rawBarGroups = [];
  List<BarChartGroupData> showingBarGroups = [];
  int touchedGroupIndex = -1;


  @override
  void initState() {
    super.initState();
    initValueRawBarGroupFromArrayData();
  }


  //----------------------------------------------------- view

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoarderHelper.cardView(
          colorBackground: AppColors.backgroundCardTransparent,
          radiusSize: 15
      ),
      //color: ,
      width: Figma.h(320),
      height: Figma.h(280 ),
      child:  contentGraph()
    );
  }

  Widget contentGraph(){
    return  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: BarChart(
                BarChartData(
                  // maxY: 20,
                  barTouchData:  getTouchBarData(),
                  titlesData: FlTitlesData(
                    show: true,

                    /// hide right and top titles
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),

                    /// show bottom titles
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),

                    /// show left titles
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35, // this set width of left title text widget
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),

                  /// boarder
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
          ],
        ),

    );
  }


  Widget leftTitles(double value, TitleMeta meta) {
    if( isThisValueFoundInAnyYPoint(value) == false  ) return Container();
    if(  value == 0   ) return Container();
    Log.i("leftTitles() - value: $value /meta: $meta");
    var  text =   ToolsNumber.roundToPlus1( value );


    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text( "$text", style: style),
    );
  }


  Widget bottomTitles(double value, TitleMeta meta) {
    String title = widget.titles[value.toInt()];
    final Widget text = Text(
      title,
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }



  ///----------------------------------------------------------- touch


}