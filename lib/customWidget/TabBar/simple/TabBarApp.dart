
import 'package:fastor_app_ui_widget/customWidget/TabBar/simple/ItemTabBarApp.dart';
import 'package:fastor_app_ui_widget/customWidget/row/RowScrollApp.dart';
import 'package:flutter/material.dart';

typedef TabBarPressed = Function(int position, String title );

class TabBarApp extends StatefulWidget {

  double width;
  double height;
  double widthItemTab = 0;
  List<String> names;
  Color  indicatorColor; //colorActive;
  Color unselectedLabelColor;
  TabBarPressed pressed;
  int? initialSelectIndex  = 0;
  double? fontSize;
  String? fontFamily;
  double? spaceBetweenLabelAndUnderline;
  Decoration? decorationTabBar;
  double? heightUnderline ;
  bool? underlineShownBelowAllTabs;

  TabBarApp( {
    required this.width,
    required this.height,
    required this.names,
    required this.indicatorColor,
    required this.unselectedLabelColor,
    required this.pressed,
    this.initialSelectIndex,
    this.fontSize,
    this.fontFamily,
    this.spaceBetweenLabelAndUnderline,
    this.decorationTabBar,
    this.heightUnderline,
    this.underlineShownBelowAllTabs
  }) {
    calculateItemTabWidth();
    initDefaultValue();
  }


  void calculateItemTabWidth(){
    int sizeTabs = names.length;
    double sizeDouble =  double.parse( sizeTabs.toString() + ".0");
    widthItemTab = width / sizeDouble;
  }

  void initDefaultValue(){
    initialSelectIndex ??= 0;
    heightUnderline ??= 1;
    underlineShownBelowAllTabs ??= false;
  }


  @override
  TabBarAppState createState()  => TabBarAppState();

}

class TabBarAppState extends State<TabBarApp>  {

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
    return RowScrollApp(children:  childrenTabs());
  }


  List<Widget> childrenTabs(){
    List<Widget> ls = [];
    int index = 0;
    widget.names.forEach(( singleName) {
      Widget tab = ItemTabBarApp(singleName, index );
      ls.add( tab);
      index += 1;
    });
    return ls;
  }


}