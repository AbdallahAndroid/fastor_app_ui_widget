import 'package:ibbil/core/utils/device/DeviceTools.dart';
import 'package:ibbil/core/utils/figma/Figma.dart';
import 'package:ibbil/core/utils/log/Log.dart';
import 'package:ibbil/core/utils/timer/ToolsWait.dart';
import 'package:ibbil/customWidget/progressView/progress_circle_container.dart';
import 'package:ibbil/customWidget/scrollview/scroll_on_complete_controller.dart';
import 'package:flutter/material.dart';


typedef PageinateListviewOnScrollBottomChange = Function(   );


/// see example at "README.md"
class PaginateAutoProgress extends StatelessWidget {


  /**
   * ::: easily way to convert List<Model> to List<Widget>  :
   *
   *         List<DriverModel> data = cubit.driversResponse?.drivers??[];
   *          List<Widget> widgets = data.map((e) => DriverMangeItem( e)).toList();
   */
  List<Widget> children;

  /// this fire onChange in case user arrive bottom of screen,
  /// While not fire change in case there isLoadingNextPage next scaffold
  PageinateListviewOnScrollBottomChange  onScrollArriveBottomAndValidToGetNextPageChange;

  /// refresh
  RefreshCallback onRefresh;

  EdgeInsets? padding;
  bool isLoading;

  /// variable : Private
  final ScrollController _scrollController = ScrollController();

  Widget  emptyDataWidget;

  int len = 0;

  int currentPage ;
  bool hasReachedMax;

  PaginateAutoProgress({
    Key? key,
    required this.children,
    required this.onScrollArriveBottomAndValidToGetNextPageChange,
    required this.isLoading ,
    required this.currentPage  ,
    required this.onRefresh,
    required this.emptyDataWidget,
    required this.hasReachedMax,
    this.padding,
  }) {
    len = children.length;
    Log.i("PaginateAutoProgress() - len: ${len}");
    _addEmptyDataWidgetInCaseNoData();
    _setProgressViewWidgetToListChildren();
    _setupOnScrollComplete();

  }


  _setProgressViewWidgetToListChildren(){
    if(isLoading ) {
      children.add(
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(top: 20.h ),
            child: Center( child: ProgressCircleContainer(),),
          )
      );
      // Log.i("PaginateAutoProgress - _setProgressViewWidgetToListChildren() - add progress view");
      _autoJumpToScrollBottomAfterAddingProgress();
    };
  }


  _addEmptyDataWidgetInCaseNoData() {
    if(isLoading )  return;
    if(  len != 0 ) return;
    double heightScreen = DeviceTools.getHeightGlobal( )??0;

    children.add( emptyDataWidget );
    Log.i("PaginateAutoProgress - _addEmptyDataWidgetInCaseNoData() - add empty data widget");

    /// add space bottom to allow scroll to top to fixing the "swipe to refresh"
    // children.add( Container(
    //   width: DeviceTools.getWidthGlobal( ),
    //   constraints: BoxConstraints( minHeight: heightScreen   ),
    //   alignment: Alignment.center,
    //   margin: EdgeInsets.only(top: 160.hr),
    //   color: Colors.grey.withOpacity(0.5 ),
    // ) );
    // Log.i("PaginateListview - _addEmptyDataWidgetInCaseNoData()  ");
  }


  void _setupOnScrollComplete() {
    ScrollOnCompleteController(
        scrollController: _scrollController,
        isLoadingNextPage: isLoading,
        onCompleteCallback: (){
          if( hasReachedMax ) return;
          onScrollArriveBottomAndValidToGetNextPageChange();
        }
    );
  }

  ///--------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    // return Expanded(child: RefreshIndicator(
    //   onRefresh: onRefresh,
    //   child:   listBuilderShapeHaveData(),
    // )
    // );
    return RefreshIndicator(
      onRefresh: onRefresh,
      child:   listBuilderShapeHaveData(),
    );
  }


  listBuilderShapeHaveData() {
    // Log.i("PaginateListview - listBuilderShapeHaveData()  - children.length: ${children.length}");
    return ListView.builder(
        physics: len == 0 ? AlwaysScrollableScrollPhysics() : null ,
        controller: _scrollController,
        itemCount: children.length,
        padding: padding??EdgeInsets.zero,
        itemBuilder:  (ctx, index ) {
          return children[index];
        }
    );
  }

  void _autoJumpToScrollBottomAfterAddingProgress() {
    WidgetsBinding.instance.addPostFrameCallback( (t ) {
      ToolsWait.waitToDo(300,  (){
        if( _scrollController.hasClients == false ) return;
        double lastPosition = _scrollController.position.maxScrollExtent;
        Log.i("PaginateAutoProgress - _autoJumpToScrollBottomAfterAddingProgress() - jumpTo lastPostion: $lastPosition");
        _scrollController.jumpTo( lastPosition ) ;
      });
    });
  }


}

