
import 'package:fastor_app_ui_widget/core/boarder/BoarderHelper.dart';
import 'package:flutter/material.dart';

class ItemDicatorWidget extends StatelessWidget {

  bool isSelected;

  ItemDicatorWidget( this.isSelected );

  @override
  Widget build(BuildContext context) {
    if( isSelected ) {
      return Container(
        width: 20,
        height: 10,
        margin: EdgeInsets.only(left: 5),
        decoration: BoarderHelper.cardView(
          radiusSize: 5,
          colorLine: Colors.transparent,
          colorBackground: Colors.green, //ColorResource.tapSelectedBackground,
        ),
      ) ;
    } else {
      return Container(
        width: 10,
        height: 10,
        margin: EdgeInsets.only(left: 10),
        decoration: BoarderHelper.cardView(
          radiusSize: 5,
          colorLine: Colors.transparent,
          colorBackground: Colors.grey , //ColorResource.tapUnSelectedBackground,
        ),
      ) ;
    }
  }


}