import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart';
import 'package:fastor_app_ui_widget/resource/template/TabBar/simple/ItemTabBarFastor.dart';
import 'package:flutter/material.dart';

typedef TabBarPressedFastor = Function(int position, String title );

class TabBarFastor extends StatefulWidget {

  double width;
  double? height;
  double widthItemTab = 0;
  List<String> names;
  Color  indicatorColor; //colorActive;
  Color unselectedLabelColor;
  TabBarPressedFastor pressed;
  int? initialSelectIndex  = 0;
  double? fontSize;
  String? fontFamily;
  double? spaceBetweenLabelAndUnderline;
  Decoration? decorationTabBar;
  double? heightUnderline ;

  TabBarFastor( {
    required this.width,
    this.height,
    required this.names,
    required this.indicatorColor,
    required this.unselectedLabelColor,
    required this.pressed,
    this.initialSelectIndex,
    this.fontSize,
    this.fontFamily,
    this.spaceBetweenLabelAndUnderline,
    this.decorationTabBar,
    this.heightUnderline
  }) {
    calculateItemTabWidth();
    initDefaultValue();
  }


  void calculateItemTabWidth(){
    int sizeTabs = names.length;
    double sizeDouble = sizeTabs as double;
    widthItemTab = width / sizeDouble;
  }

  void initDefaultValue(){
    initialSelectIndex ??= 0;
    heightUnderline ??= 1;
  }


  @override
  TabBarFastorState createState()  => TabBarFastorState();

}

class TabBarFastorState extends State<TabBarFastor>  {

  int selectedIndex = 0 ;

  @override
  void initState() {
    selectedIndex = widget.initialSelectIndex!;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: widget.decorationTabBar,
      child: contentUIBars(),
    );
  }

  //------------------------------------------------------------ tab bar

  Widget contentUIBars(){
    return RowScrollFastor(children:  childrenTabs());
  }


  List<Widget> childrenTabs(){
    List<Widget> ls = [];
    int index = 0;
    widget.names.forEach(( singleName) {
      Widget tab = ItemTabBarFastor(singleName, index );
      ls.add( tab);
    });
    return ls;
  }


}