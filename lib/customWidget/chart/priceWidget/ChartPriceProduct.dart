import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/core/ChartDataEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/core/ChartDataModel.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/core/ChatDataCalculator.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/core/EnumShapePrice.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/priceWidget/logic/ChartPriceController.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/priceWidget/widget/AxisChartPrice.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPriceProduct extends StatefulWidget {

  double width;

  List<ChartDataModel> data  ;
  EnumChartPriceShape shape;

  ChartPriceProduct( {
    required this.width,
    required this.data,
    required this.shape,
  })  {

    setDefaultValues();
  }


  setDefaultValues(){
    if( width < 30 ) { width = 30; }
  }


  @override
  ChartPriceProductState createState() => ChartPriceProductState();

}
class  ChartPriceProductState extends State<ChartPriceProduct> {

  bool showWidget = false;


  @override
  void initState() {
    super.initState();
     waitAndShowWidget();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ,
      height: getHeightFixedOrNotByChooseShapeOfChart(),
      padding: EdgeInsets.only(
        right: Figma.w( isDetailShape() ?  5 : 0  )  ,
      ),
      child: showWidget ? chartContentUI() : placeholderLoading(),
    );
  }


  double? getHeightFixedOrNotByChooseShapeOfChart(){
    if( isDetailShape() ) return null;
    if( isSmallShape() ) return  widget.width * 1 ;
    return null;
  }

  Widget placeholderLoading(){
    return Container(
      width: widget.width,
      height:  isDetailShape() ? Figma.h( 310 ) : null   ,
      child: isDetailShape() ? ProgressCircleApp( color: ColorResource.textPrimary, size: 40, ) : null ,
    );
  }


  Widget chartContentUI() {
    return  SfCartesianChart(

        /// color indicator line
        palette:   <Color>[
          chooseColorVoteUpOrDown(),
      ],

      /// line right and top
      plotAreaBorderColor: colorBoarderLineOutlineChart(),
      plotAreaBorderWidth: getWidthBoarderLineOutlineChart(),

      primaryXAxis: axisX(),
      primaryYAxis:  axisY(),
      series: <LineSeries<ChartDataEntity, double>>[
        LineSeries<ChartDataEntity, double>(
          dataSource: widget.data,
          xValueMapper: (ChartDataEntity data, _) => data.pointX,
          yValueMapper: (ChartDataEntity data, _) => data.pointY,
        )
      ],
    );
  }


  Color colorBoarderLineOutlineChart(){return ColorResource.textSecondary;}

  double getWidthBoarderLineOutlineChart(){
    if( isDetailShape() ) {
      return 0.5 ;
    } else {
      return 0;
    }
  }

  double getWidthLineIndicatorChart(){
    if( isDetailShape() ) {
      return 0.5 ;
    } else {
      return 0;
    }
  }



  Color chooseColorVoteUpOrDown(){
    if( ChatDataCalculator.isVoteUp( widget.data)  ) {
      return  ColorResource.greenDark;
    } else {
      return ColorResource.red;
    }
  }


}

