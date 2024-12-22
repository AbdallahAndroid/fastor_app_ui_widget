import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BorderRadiusTools.dart';
import 'package:fastor_app_ui_widget/customWidget/TabBar/rounded/TabBarRoundApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

extension ItemTabBarAppExtenstion on TabBarRoundState {
  Widget ItemTabBarApp(String name, int index) {
    return GestureDetector(
        child: contentUIItemTab(name, index),
        onTap: () {
          setState(() {
            selectedIndex = index;
          });

          widget.pressed(index, name);
        });
  }

  Widget contentUIItemTab(String name, int index) {
    return Container(
      width: widget.widthItemTab,
      height: widget.height,
      // color:  getColorBackgroundSelected(),
      decoration: chooseDecorationMiddleOrFirstOrLast(index),
      padding: EdgeInsets.all(10),
      child: _textTabItem(name, index),
      alignment: Alignment.center,
    );
  }

  Decoration? chooseDecorationMiddleOrFirstOrLast(int index) {
    bool isFirstTab = index == 0;
    bool isLastTab = index == (widget.names.length - 1);
    bool isMiddleTab = isFirstTab == false && isLastTab == false;

    /// no radius needed in middle item
    if (isMiddleTab) {
      return BoarderHelper.cardView(
          colorBackground: selectedIndex == index
              ? widget.selectedColorBackground
              : widget.unselectedColorBackground,
          colorLine: selectedIndex == index
              ? widget.selectedColorLine
              : widget.unselectedColorLine,
          radiusSize: 0);
    }

    if (isFirstTab) {
      return BoarderHelper.cardView(
          colorBackground: selectedIndex == index
              ? widget.selectedColorBackground
              : widget.unselectedColorBackground,
          colorLine: selectedIndex == index
              ? widget.selectedColorLine
              : widget.unselectedColorLine,
          radiusBorder: BorderRadiusTools.getByLang(
              radius_bottomRight: widget.radiusLeftRight,
              radius_topRight: widget.radiusLeftRight));
    }

    if (isLastTab) {
      return BoarderHelper.cardView(
          colorBackground: selectedIndex == index
              ? widget.selectedColorBackground
              : widget.unselectedColorBackground,
          colorLine: selectedIndex == index
              ? widget.selectedColorLine
              : widget.unselectedColorLine,
          radiusBorder: BorderRadiusTools.getByLang(
              radius_bottomLeft: widget.radiusLeftRight,
              radius_topLeft: widget.radiusLeftRight));
    }
    return null;
  }

  Widget _textTabItem(String name, int index) {
    return TextApp(
      name,
      fontFamily: widget.fontFamily,
      fontSize: widget.fontSize ?? 18,
      textAlign: TextAlign.center,
      color: selectedIndex == index
          ? widget.unselectedColorBackground
          : widget.selectedColorBackground,
    );
  }
}
