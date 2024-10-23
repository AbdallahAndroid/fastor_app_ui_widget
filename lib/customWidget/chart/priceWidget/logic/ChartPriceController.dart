import 'package:fastor_app_ui_widget/customWidget/chart/core/EnumShapePrice.dart';
import 'package:fastor_app_ui_widget/customWidget/chart/priceWidget/ChartPriceProduct.dart';

extension ChartPriceController on ChartPriceProductState {


  //------------------------------------------------------------- progress shape

  void  waitAndShowWidget() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
       showWidget = true;
    });
  }

  //------------------------------------------------------------- shape methods

  bool isDetailShape(){ return EnumChartPriceShape.detail == widget.shape; }


  bool isSmallShape(){ return EnumChartPriceShape.smallIndicator == widget.shape; }



}