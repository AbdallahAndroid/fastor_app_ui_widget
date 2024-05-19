import 'package:fastor_app_ui_widget/customWidget/scrollview/SingleChildScrollViewApp.dart';
import 'package:flutter/material.dart';



class ListViewApp {


  /**
   * must use class "ListViewTemplate" inside type "PageTemplate"
   */
  static Widget t(  {
    required BuildContext context,
    required List<Widget> children,
    required Axis axis,
    bool? axisBoth = false,           //used in "Table View"


    //
    // double? minWidth = 0, //fix hidden list untill api download
    // double? minHeight = 0,


  } ) {

    Widget typeWidget ;

    if( axisBoth! ) {
      typeWidget = _getAxisBoth(context, children);
    }  else if( Axis.vertical == axis ) {
      typeWidget =  _getColumn(children);
    } else { //horizontal
      typeWidget =  _getRow(context, children);
    }

    return typeWidget;
    /**
     * have problem make all alignemtn forever start
     * and make stack take match parent width
     *
     *    //remove minHeight when list have value
        if( children.length > 0 ){
        minHeight = 0;
        }


        //set min  size for loading
        var stack = Stack(
        children: [
        EmptyView.empty( minWidth!, minHeight!),
        typeWidget
        ],
        );
        return stack;
     */

  }


  static Widget _getColumn(List<Widget> children){
    var asList = Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children);
    return asList;
  }


  static Widget _getRow(BuildContext context, List<Widget> children){
    return SingleChildScrollViewApp.hList( context, children  ) ;
  }


  static Widget _getAxisBoth(BuildContext context, List<Widget> children){
    var vertical = _getColumn( children);
    return SingleChildScrollViewApp.hList( context, [
      vertical
    ]  ) ;
  }


}


