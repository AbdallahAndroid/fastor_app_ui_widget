
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/core/ChatDataCalculator.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/priceWidget/ChartPriceProduct.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/priceWidget/logic/ChartPriceController.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

extension AxisChartPrice on ChartPriceProductState {


  axisX() {
    // Log.i("axisX() - length: ${widget.data.length.toDouble()}");
    return  NumericAxis(
        title: isDetailShape() ? monthTitle() : null ,
        interval: 1,
        isInversed: LangApp.isArabic,
        maximum:   widget.data.length.toDouble(),
        maximumLabels:  widget.data.length ,
        majorTickLines: MajorTickLines( color: Colors.transparent, width: 0),
        minorTickLines: MinorTickLines(color: Colors.transparent, width: 0),
        minorGridLines: MinorGridLines( color: Colors.transparent, width: 0 ),

        /// color grid vertical line
        majorGridLines: MajorGridLines( color: Colors.transparent, width: 0 ),

        /// line above label
        axisLine: AxisLine( color: colorBoarderLineOutlineChart(), width: getWidthBoarderLineOutlineChart() ),
        labelStyle: TextStyle(
            color: ColorResource.textPrimary,
            // fontFamily: FontResources.regular,
            fontSize: isDetailShape() ?  Figma.w( 12 ) : 0
        )
    );
  }


  axisY() {
    return NumericAxis(
        // isInversed: LangApp.isArabic,
        minimum: ChatDataCalculator.getMinimumValuePointY( widget.data ),
        maximum: maximueValueShowToRightYAxis(),
        majorTickLines: MajorTickLines( color: Colors.transparent, width: 0),
        minorTickLines: MinorTickLines(color: Colors.transparent, width: 0),
        minorGridLines: MinorGridLines( color: Colors.transparent, width: 0 ),

        /// color grid horizontal line
        majorGridLines: MajorGridLines( color: Colors.black, width: getWidthLineIndicatorChart() ),

        /// line left of value
        axisLine: AxisLine( color: colorBoarderLineOutlineChart(), width: getWidthBoarderLineOutlineChart() ),

        labelStyle: TextStyle(
            color: ColorResource.textPrimary,
            // fontFamily: FontResources.regular,
            fontSize: isDetailShape() ?  Figma.w( 12 ) : 0
        )
    );
  }

  double maximueValueShowToRightYAxis() {
    double maxValue = ChatDataCalculator.getMaximumValuePointY( widget.data );
    double stepUnitValue = ChatDataCalculator.getStepOfPointY( widget .data );
    return maxValue + stepUnitValue;
  }

  AxisTitle monthTitle() {
    return  AxisTitle(
        text: "Months".tra(),
        textStyle: TextStyle(
            color: Colors.black,
            fontSize: Figma.h( 14 ),
          // fontFamily: FontResources.semiBold
        )
    );
  }




}