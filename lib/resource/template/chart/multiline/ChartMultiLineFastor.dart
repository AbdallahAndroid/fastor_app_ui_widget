import 'dart:math';


import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';


class ChartMultiLineFastor extends StatelessWidget {

  double width;
  double height;
  Color colorPrimary;
  Color? colorTouchWindows;
  Color? colorBoxChar;
  Color? colorTextTitle;
  List<Color>? linesDrawingColor;
  List<String> bottomTitleData;
  List<double>? leftTitleData;
  bool? showGridData;
  List<List<double> > linesDrawingData;

  ChartMultiLineFastor({
    required this.width,
    required this.height,
    required this.bottomTitleData,
    required this.leftTitleData,
    required this.colorPrimary,
    required this.linesDrawingData,
    this.colorTouchWindows,
    this.colorBoxChar,
    this.colorTextTitle,
    this.linesDrawingColor,
    this.showGridData
  }) {

    colorTouchWindows ??= colorPrimary;
    showGridData ??= true;
    colorBoxChar ??= colorPrimary;
    colorTextTitle ??= colorPrimary;

    setDefaultValueForLineDrawingColor();

    // generateLeftTitle();

    //print values
    // Log.i( "ChartLineFastor - constructor() - xTitleData: $bottomTitleData");
    // Log.i( "ChartLineFastor - constructor() - leftTitleData: $leftTitleData");
  }


  @override
  Widget build(BuildContext context) {
    var chart =  LineChart(
        sampleData1
    );

    return Container( child: chart,
      width: width,
      height: height,
    );
  }

  //------------------------------------------------------------- values default

  void setDefaultValueForLineDrawingColor() {
    if(linesDrawingColor != null ) return;

    linesDrawingColor  ??= [];
    linesDrawingData.forEach((element) {
      linesDrawingColor!.add( colorPrimary );
    });

  }

  //------------------------------------------------------------- data

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesBuildAllSides1,
    borderData: borderData,
    lineBarsData: getMulitLineDrawingData(),
    minX: 0,
    maxX: double.parse( bottomTitleData.length.toString()+".0"),
    minY: 0,
    maxY: double.parse( leftTitleData!.length.toString()+".0"),
  );

  //------------------------------------------------------------- launch

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: colorTouchWindows,
    ),
  );

  //------------------------------------------------------------- title build

  FlTitlesData get titlesBuildAllSides1 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles ,
    ),
    rightTitles:  axisEmpty ,
    topTitles:   axisEmpty,
  );

  AxisTitles get axisEmpty  => AxisTitles(
    sideTitles: emptySideTitle,
  );

  SideTitles get emptySideTitle => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: emptyTitleWidgets ,
  );

  Widget emptyTitleWidgets(double value, TitleMeta meta) {
    return Text("");
  }

  //---------------------------------------------------------- bottom title

  int _indexBottomTitle = 0;

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // Log.i( "bottomTitleWidgets() - value $value");

    /**
        the chart when draw first 0.0 value
     */
    if( value == 0.0 ) {
      _indexBottomTitle = 0;
    }

    //get text value
    String textTitleCurrentPosition = "";
    if(value != 0.0 ) {
      String title  =  bottomTitleData[_indexBottomTitle - 1 ]  ;
      textTitleCurrentPosition = title;
    }

    //textWidget
    var styleText = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: colorTextTitle!
    );
    var textDynamic = Text(  textTitleCurrentPosition , style: styleText,);
    //Log.i( "bottomTitleWidgets() - textTitleCurrentPosition $textTitleCurrentPosition");

    //increment
    _indexBottomTitle = _indexBottomTitle + 1;
    // Log.i( "bottomTitleWidgets() - _indexBottomTitle: $_indexBottomTitle");

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: textDynamic,
    );
  }

  //---------------------------------------------------------- left title

  int _indexLeftTitle = 0;

  SideTitles get leftTitles => SideTitles(
    showTitles: true,
    reservedSize: 70,
    interval: 1,
    getTitlesWidget: leftTitleWidgets,
  );


  Widget leftTitleWidgets(double value, TitleMeta meta) {
    // Log.i( "leftTitleWidgets() - value $value");

    /**
        the chart when draw first 0.0 value
     */
    if( value == 0.0 ) {
      _indexLeftTitle = 0;
    }
    bool isNotHalfValue = value.toString().endsWith( ".5") == false ;
    // Log.i( "leftTitleWidgets() - isNotHalfValue $isNotHalfValue");

    //get text value
    String textTitleCurrentPosition =  "" ;
    if(value != 0.0  && isNotHalfValue ) {
      // Log.i( "leftTitleWidgets() - _indexLeftTitle: $_indexLeftTitle");
      String str = leftTitleData![_indexLeftTitle ].toString();
      textTitleCurrentPosition =   removeFraction( str  );
      // Log.i( "leftTitleWidgets() - textTitleCurrentPosition $textTitleCurrentPosition");

      //increment
      _indexLeftTitle = _indexLeftTitle + 1;
    }

    //textWidget
    var styleText = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: colorTextTitle!
    );
    var textDynamic = Text(  textTitleCurrentPosition , style: styleText,);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: textDynamic,
    );
  }

  //--------------------------------------------------------------- fix number

  static String removeFraction(String? org  ) {
    if( org == null  ) return "0";

    //get fraction
    double d = double.parse( org );
    var integer = _roundToPlus1 ( d );

    //prefix
    return integer.toString();
  }

  static int _roundToPlus1(double row_counter ){
    //round
    double fraction =  row_counter -  row_counter.truncate();// '2.3555' >> "0.3555"
    if( fraction > 0.0 ) {
      row_counter = row_counter + 1 - fraction;
    }
    // Log.i("gridview - t() - row_counter: $row_counter ");
    return row_counter.toInt();
  }

  //--------------------------------------------------------------- theme chart

  FlGridData get gridData =>   FlGridData(
    show: showGridData,
  );

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom:   BorderSide(color: colorBoxChar!  ),
      left:    BorderSide(color: colorBoxChar!),
      right:    BorderSide(color: colorBoxChar!),
      top:   BorderSide(color: colorBoxChar!),
    ),
  );

  //--------------------------------------------------------------- multi line build


  List<LineChartBarData> getMulitLineDrawingData() {
    List<LineChartBarData> linesBarData = [];
    for( int positionLine = 0 ; positionLine < linesDrawingData.length; positionLine++ ) {
      var dataDoubleValue = linesDrawingData[positionLine];
      LineChartBarData singleBar = mapDoubleValueArrayToObjectLineChartBarData( positionLine, dataDoubleValue);
      linesBarData.add( singleBar );
    }
    return linesBarData;
  }

  //-----------------------------------------  map doubleValueArray to object LineChartBarData

  LineChartBarData mapDoubleValueArrayToObjectLineChartBarData(int linePosition, List<double> dataDoubleValue) {

    return  LineChartBarData(
        isCurved: false,
        color: _getLineColorByNumber(linePosition),
        barWidth: 3,
        isStrokeCapRound: false,
        dotData:   FlDotData(show: false),
        spots: _getFlSpotsArray(dataDoubleValue)

      // spots:   [
      //   FlSpot(1, 1),
      //   FlSpot(2, 1.5),
      //   FlSpot(3, 10),
      //   // FlSpot(7, 3.4),
      //   // FlSpot(10, 2),
      //   FlSpot(12, 2),
      //   FlSpot(29.91, 10.69),
      //   // FlSpot(13, 1.8),  //xSpot: 29.916666666666668 /ySpot: 10.699
      // ],
    );
  }

  List<FlSpot> _getFlSpotsArray(List<double> dataDoubleValue) {
    List<FlSpot> ls = [];

    for(int i = 0 ; i < dataDoubleValue.length; i++ ) {
      double xSpot = getXAxisByIndexOfDataValue(dataDoubleValue, i);
      double yValueData = dataDoubleValue[i];
      double ySpot = getYAxisFromValue( yValueData);
      // Log.i("_getFlSpotsArray() - loop - xSpot: $xSpot /ySpot: $ySpot");
      FlSpot spot = FlSpot( xSpot,  ySpot );
      ls.add( spot );
    }
    // Log.i("_getFlSpotsArray() - ls: $ls");
    return ls;
  }


  Color _getLineColorByNumber(int linePosition) {
    return linesDrawingColor![linePosition];
  }


  double getYAxisFromValue(double valueData ) {
    double maxHeightValueForYAxis = leftTitleData![ leftTitleData!.length - 1];
    double ratio = valueData / maxHeightValueForYAxis;
    int maxWidthYAxis = leftTitleData!.length;
    double result = ratio * maxWidthYAxis;
    // Log.i( "getYAxisFromValue() - valueData: $valueData /ratio: $ratio /result: $result");
    return result;
  }

  double getXAxisByIndexOfDataValue(List<double> dataDoubleValue, int indexOfDataYValue ) {
    int totalYCounter = dataDoubleValue.length;
    int maxWidthXAxis = bottomTitleData.length;
    double singleItemTakeWidth = maxWidthXAxis /  totalYCounter ;
    // Log.i( "getXAxisByIndexOfDataValue() - totalYCounter: $totalYCounter /maxWidthXAxis: $maxWidthXAxis");
    double ratio =   singleItemTakeWidth *  indexOfDataYValue;
    // Log.i( "getXAxisByIndexOfDataValue() - indexOfDataYValue: $indexOfDataYValue"
    //     " /ratio: $ratio /singleItemTakeWidth $singleItemTakeWidth");
    return ratio;
  }

//------------------------------------------------------------- left title
/**

    double min_left_value = 999999999;
    double max_left_value = 0;


    void generateLeftTitle() {
    initTheMinAndMaxValueForLeftDataTile();
    double singleItemHeight =  100  ;
    leftTitleData!.add( min_left_value - singleItemHeight );

    for( int i = 1 ; i < 12 ; i++ ) {

    var value = singleItemHeight  * i + min_left_value;

    //check little height
    bool minNotAllowed = (value + singleItemHeight) < min_left_value ;
    if( minNotAllowed ) continue;

    //add now

    leftTitleData!.add( value);

    //check more height
    bool maxAllowed = value > (max_left_value  + singleItemHeight ) ;
    if( maxAllowed )break;
    }
    }




    void initTheMinAndMaxValueForLeftDataTile() {
    leftTitleData = [];

    linesDrawingData.forEach((singleLineData) {

    singleLineData.forEach((singleValueAtSingleLine) {
    if(singleValueAtSingleLine < min_left_value ) {
    min_left_value = singleValueAtSingleLine;
    }
    if(singleValueAtSingleLine > max_left_value ) {
    max_left_value = singleValueAtSingleLine;
    }
    });
    });
    }
 *
 */

}
