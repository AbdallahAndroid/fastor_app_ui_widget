import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';

import 'package:fastor_app_ui_widget/customWidget/chart/CounterChart/logic/MapperPieData.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/CounterChart/logic/RequestMapperToPioChart.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/CounterChart/widget/IndicatorColorTitle.dart';
import 'package:flutter/material.dart';


import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class CounterChart extends StatefulWidget {

  List<String> titles;
  List<double> values;
  List<Color> colors;
  TextStyle? textStyle;

  CounterChart( {
   required this.titles,
    required this.values,
    required this.colors,
    this.textStyle
});


  @override
  CounterChartState createState() => CounterChartState();
}

class CounterChartState extends State<CounterChart> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        cardWithChart(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children:  childrenIndicatorColor(),
        )
      ],
    );
  }


  cardWithChart() {
    return Container(
      decoration: BoarderHelper.cardView(
          colorBackground: ColorResource.backgroundCardTransparent,
          radiusSize: 15
      ),
      //color: ,
      width: Figma.h(320),
      height: Figma.h(280 ),
      child: PieChart(
        PieChartData(
          sections: getChildrenPieChartSectionData(),
          centerSpaceRadius: 20,
        ),
      ),

    );
  }


  List<PieChartSectionData> getChildrenPieChartSectionData() {
    List<PieChartSectionData> dataChart = [];

    for (int i = 0; i < widget.titles.length; i++) {

      /// get info
      var request = RequestMapperToPioChart();
      request.title = widget.titles[i];
      request.value = 0;
      if (widget.values.length > i) {
        request.value = widget.values[i];
      }
      request.color = Colors.black;
      if (widget.colors.length > i) {
        request.color = widget.colors[i];
      }

      dataChart.add(mapMetaDataIntoObjectPieChartSectionData(request));
    }
    return dataChart;
  }


  List<IndicatorColorTitle> childrenIndicatorColor() {
    List<IndicatorColorTitle> ls = [];
    for (int i = 0; i < widget.titles.length; i++) {

      /// get info
      var request = RequestMapperToPioChart();
      request.title = widget.titles[i];
      request.color = Colors.black;
      if (widget.colors.length > i) {
        request.color = widget.colors[i];
      }
      ls.add(IndicatorColorTitle(title: request.title!, color:  request.color!,));
    }
    return ls;
  }



}
