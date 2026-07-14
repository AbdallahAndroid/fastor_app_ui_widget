import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/progress_circle_container.dart';
import 'package:flutter/material.dart';


typedef PaginateNestedScrollOnScrollBottomChange = Function(   );


/// --------- when used this class
/// when the paginate list in nested inside long page already have scroll
class PaginateNestedScroll extends StatelessWidget {


  /**
   * ::: easily way to convert List<Model> to List<Widget>  :
   *
   *         List<DriverModel> data = cubit.driversResponse?.drivers??[];
   *          List<Widget> widgets = data.map((e) => DriverMangeItem( e)).toList();
   */
  List<Widget> children;

  /// this fire onChange in case user arrive bottom of screen,
  /// While not fire change in case there isLoadingNextPage next scaffold
  PaginateNestedScrollOnScrollBottomChange  onScrollArriveBottom;

  /// refresh
  RefreshCallback onRefresh;

  EdgeInsets? padding;
  bool isLoadingNextPage;

  /// variable : Private
   ScrollController  scrollController;

  Widget  emptyDataWidget;

  int len = 0;



  PaginateNestedScroll({
    required this.children,
    required this.onScrollArriveBottom,
    required this.isLoadingNextPage ,
    required this.onRefresh,
    required this.emptyDataWidget,
    required this.scrollController ,
    this.padding,
  }) {
    len = children.length;
    Log.i("PaginateNestedScroll() - len: ${len} /isLoading: $isLoadingNextPage");
    _setProgressViewWidgetToListChildren();
    _setupOnScrollComplete();
    _addEmptyDataWidgetInCaseNoData();
  }


  _setProgressViewWidgetToListChildren(){
    if(isLoadingNextPage ) children.add( 
      Container(
        margin: EdgeInsets.only(top: 20.h ),
        child: Center( child: ProgressCircleContainer(),),
      )
    );
  }


  _addEmptyDataWidgetInCaseNoData() {
        if(isLoadingNextPage )  return;
    if( len != 0 ) return;
    double heightScreen = DeviceTools.getHeightGlobal( )??0;

    children.add( emptyDataWidget );

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
    scrollController.addListener( (){
      bool isArriveMaxBottom = scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100 ;
      if (  isArriveMaxBottom     ) {
        if(   ! isLoadingNextPage ) {
          Log.i("PaginateNestedScroll - _setupOnScrollComplete() - isArriveMaxBottom");
          onScrollArriveBottom();
        }
      }
    });

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
        // physics:   NeverScrollableScrollPhysics()  ,
        // controller:  scrollController,
        shrinkWrap: true ,
        itemCount: children.length,
        padding: padding??EdgeInsets.zero,
        itemBuilder:  (ctx, index ) {
          return children[index];
        }
    );
  }


}

