import 'package:flutter/material.dart';
import 'package:log_debug/log_debug.dart';



typedef ListViewCreateCallBack = Function(List<Widget> listWidget, List<dynamic> listState);


abstract class  ItemListController {

  //---------------------------------------------------------------- backend

  /**
   * - pages calcuate ratio:
      width:height . pages width 548, height 730, now ratio height is 1.34
   */
  double itemHeightRatio  = 1;

  double itemWidth = 0;

  //backend
  List<dynamic> listData = [];
  List<Widget> listWidget = [];
  List<dynamic> listState = [];  //pages: ItemListProductHorizontalState
  late ListViewCreateCallBack callBack;

  //------------------------------------------------------------------- create

  Future createList(  {
    required List<dynamic> list,
    required double itemWidth,
    required double itemHeightRatio,
    required ListViewCreateCallBack callBack
  })  ;

  //-------------------------------------------------------------------- map

  Future  mapListModelToListWidget( )  async {
    int i = 0;
    listData.forEach((element) {
      mapSingle(element, i);
      i++;
    });
  }

  void mapSingle(dynamic element, int position);

  //------------------------------------------------------------------- size

  double getWidthItem(){
    return itemWidth;
  }


  double getHeightItem(){
    var r =   getWidthItem() * itemHeightRatio ;//+ (DesignSystemDimen.elevation_level_2 * 2);
    //Log.i( "getHeightItem() - r: " + r.toString() + "/width: " +   getWidthItem().toString() );
    return r;
  }

  //------------------------------------------------------------------- size frame

  double getHeightFrame(double radiusUsed, double elevationUsed){

    var elevation = (elevationUsed  * 2) /3 ;
    var radius = radiusUsed  * 4;
    var r = this.getHeightItem() +   elevation + radius;
    LogDebug.i( "getHeightFrame() - r: " + r.toString()  );
    return r; //225
  }


}