import 'package:fastor_app_ui_widget/customWidget/TabBar/rounded/widget/ItemTabBarApp.dart';
import 'package:flutter/material.dart';

typedef TabBarRadiusLeftRightOnPressed = Function(int position, String title);

class TabBarRoundApp extends StatefulWidget {
  double width;
  double height;
  double widthItemTab = 0;
  List<String> names;

  Color selectedColorBackground;
  Color unselectedColorBackground;

  Color selectedColorLine;
  Color unselectedColorLine;

  double radiusLeftRight;

  TabBarRadiusLeftRightOnPressed pressed;

  int initialSelectIndex = 0;
  double? fontSize;
  String? fontFamily;

  TabBarRoundApp({
    required this.width,
    required this.height,
    required this.names,
    required this.selectedColorBackground,
    required this.unselectedColorBackground,
    required this.radiusLeftRight,
    required this.pressed,
    this.initialSelectIndex = 0,
    this.fontSize,
    this.fontFamily,
    this.selectedColorLine = Colors.grey,
    this.unselectedColorLine = Colors.grey,
  }) {
    calculateItemTabWidth();
  }

  void calculateItemTabWidth() {
    int sizeTabs = names.length;
    double sizeDouble = double.parse(sizeTabs.toString() + ".0");
    widthItemTab = width / sizeDouble;
  }

  @override
  TabBarRoundState createState() => TabBarRoundState();
}

class TabBarRoundState extends State<TabBarRoundApp> {
  int selectedIndex = 0;

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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: childrenTabs(),
        ),
      ),
    );
  }

  List<Widget> childrenTabs() {
    List<Widget> ls = [];
    int index = 0;
    widget.names.forEach((singleName) {
      Widget tab = ItemTabBarApp(singleName, index);
      ls.add(tab);
      index += 1;
    });
    return ls;
  }
}
