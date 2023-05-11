import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';

import 'package:fastor_app_ui_widget/resource/template/placeholder/PlaceholderTemplate.dart';
import 'package:flutter/material.dart';

@Deprecated( "use instead 'RowScrollFastor()'")
class RowTemplate {

  @Deprecated( "Under Testing")
  static Row leftAndRight ( Widget childLeft, Widget childRight){
    return Row(
      children: [
        childLeft,
        Expanded(child: PlaceholderTemplate.emptyView() ),
        childRight
      ],
    );
  }

  @Deprecated( "Under Testing")
  static Row child1_expanded_child2_wrapWidth ( Widget child1, Widget child2){
    return Row(
      children: [
        Expanded(child: child1 ),
        child2
      ],
    );
  }

  @Deprecated( "Under Testing")
  static Row child1_WrapWidth_child2_expanded ( Widget child1, Widget child2,
  {
    Alignment? gravityLayout
  }){
    gravityLayout ??= Alignment.topLeft;

    return Row(
      children: [
        child1,
        Expanded(child: Container( alignment: gravityLayout, child:  child2 ) )
      ],
    );
  }

  static Row wrapChildren(List<Widget> children, {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.min,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    var row = Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );

    return row;
  }


  static Widget scroll( BuildContext context, List<Widget> children){
    return ListViewTemplate.t(context: context, children: children, axis: Axis.horizontal);
  }

  static Row wrapChildren_gravityCenter(List<Widget> children) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );

    return row;
  }



}