import 'package:fastor_app_ui_widget/resource/template/emptyView/EmptyView.dart';
import 'package:fastor_app_ui_widget/resource/template/listview/ListViewTemplate.dart';
import 'package:fastor_app_ui_widget/resource/template/row/RowTemplate.dart';
import 'package:flutter/material.dart';

class GridViewFastor extends StatelessWidget {

  //constructor info
  int span;
  List<Widget> children = [];
  Axis axis ;
  double? minWidth = 0;
  double? minHeight = 0;

  //data result
  List<Widget> listRow = [];

  //provider information
  int size  = 0;
  double row_counter = 0;

  //loop info
  int remain_row = 0;
  int remain_child = 0;
  int current_startIndex = 0;
  int currentLoop_itemSize = 0;
  List<Widget> splitRowLoop = [];


  GridViewFastor( {
    required this.span,
    required this.children,
    required this.axis,

    //fix hidden list untill api download
    // double? minWidth ,
    // double? minHeight ,
  } ){

    //set default min
    minWidth ??= 0;
    minHeight ??= 0;
    this.minWidth = minWidth;
    this.minHeight = minHeight;

    //provider information
    size = children.length;
    row_counter = size/span;

    //loop info
    remain_row = _roundToPlus1(row_counter);
    remain_child = size;
    current_startIndex = 0;
    currentLoop_itemSize = span;

    //generate grid list
    convertListChildrenToListRowByExpandedFlex();
  }

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
      this.context = context;
    return getGridShape();
  }


  Widget getGridShape()  {
    return ListViewTemplate.t( context: context,
        children: listRow,
        axis: axis,
    // minWidth: minWidth,
    //     minHeight: minHeight
    );
  }

  void convertListChildrenToListRowByExpandedFlex(){
    //split
    do{
      //CHECK EMPTY
      if( size == 0 ) {
        continue;
      }

      //add row
      listRow.add( createSingleRowInLoop());

      updateValuesWhenCurrentLoopFinish();

    }while( remain_row > 0);

    //LogDebug.i( "ListViewTemplate result: " + listRow.length.toString() );
  }

  void updateValuesWhenCurrentLoopFinish(){
    //update remains values
    current_startIndex = current_startIndex + span;
    remain_row--;  //decrement
    remain_child = remain_child - span;
   // LogDebug.i( "remain_row: " + remain_row.toString() );

  }


  Widget createSingleRowInLoop(){

    // cut array
    splitRowLoop = children.sublist( current_startIndex, getIndexEndSpitRow() );

    //create single row
    List<Widget> listExpanded  = [];
    for( int expandedIndex = 0 ; expandedIndex < span ; expandedIndex++ ) {

      var exp = getExpandedItem( expandedIndex);

      listExpanded.add( exp);
    }

    //set row to list
    Widget rowSingle  = RowTemplate.wrapChildren( listExpanded);

    //log
    // LogDebug.i( "current_startIndex: " + current_startIndex.toString() );
    // LogDebug.i( "indexEndSpitRow: " + getIndexEndSpitRow().toString() );
    // LogDebug.i( "splitRowLoop: " + splitRowLoop.length.toString());
    // LogDebug.i( "currentLoop_itemSize: " + currentLoop_itemSize.toString());


    return rowSingle;
  }


  int getIndexEndSpitRow(){

    //end index
    int indexEndSpitRow = current_startIndex + span;
    if( indexEndSpitRow >= size ) {

      // now current loop less than normal size .
      /**
       * pages all lenght is 7, while span is 3. at loop thrid the size will be 1,2,"3"
       * the loop 3 will cause the lenght will be 1 not like span
       */
      currentLoop_itemSize = size - current_startIndex;

      /**
       * avoid indexOutBound Exception
       */
      indexEndSpitRow = size ;
    }
    return indexEndSpitRow;
  }

  Widget getExpandedItem(int expandedIndex) {

    //fix: span item empty
    /**
        //    -  case the last item found in row while there is more empty span not used
        //    - pages : the children len is 8, while the span is 3. now
        the third loop will have just 2 item children not three.
        now make create empty view instead of item children
     */

    if( currentLoop_itemSize < span ) {
      if( expandedIndex < currentLoop_itemSize) {
        return getItemChildren( expandedIndex);
      }
      var emptyViewExpanded = Expanded(child: EmptyView.zero(), flex: 1 );
      return emptyViewExpanded;
    }

    //default
    return getItemChildren(expandedIndex);
  }


  Widget getItemChildren(int expandedIndex ){
    Widget singleItem = splitRowLoop[expandedIndex];

    //expanded
    var exp= Expanded(child: singleItem, flex: 1 );
    return exp;
  }

  /**
   * means plus 1 . in case "2.333" round to "3.0"
   */
  static int _roundToPlus1(double row_counter ){
    //round
    double fraction =  row_counter -  row_counter.truncate();// '2.3555' >> "0.3555"
    if( fraction > 0.0 ) {
      row_counter = row_counter + 1 - fraction;
    }
    //LogDebug.i("gridview - t() - row_counter: $row_counter ");
    return row_counter.toInt();
  }



}