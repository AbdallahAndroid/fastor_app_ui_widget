

import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/gridview/paginate/widget/ChooseWrapWidgetBySizeSpin.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/progress_circle_container.dart';
import 'package:fastor_app_ui_widget/customWidget/scrollview/scroll_on_complete_controller.dart';
import 'package:flutter/material.dart';


typedef PageinateGridViewOnScrollBottomChange = Function(   );


 
class PaginateGridView extends StatelessWidget {


  /**
   * ::: easily way to convert List<Model> to List<Widget>  :
   *
   *         List<DriverModel> data = cubit.driversResponse?.drivers??[];
   *          List<Widget> widgets = data.map((e) => DriverMangeItem( e)).toList();
   */
  List<Widget> children;

  /// this fire onChange in case user arrive bottom of screen,
  /// While not fire change in case there isLoadingNextPage next scaffold
  PageinateGridViewOnScrollBottomChange  onScrollArriveBottomAndValidToGetNextPageChange;

  /// refresh
  RefreshCallback onRefresh;

  EdgeInsets? paddingArroundList;
  bool isLoadingNextPage;

  /// variable : Private
  final ScrollController _scrollController = ScrollController();

  Widget  emptyDataWidget;

  int len = 0;

  int spin;
  double height;
  double? marginBetweenItemsHorizontal   ;
  
  PaginateGridView({
    Key? key,
    required this.spin,
    required this.height,
    required this.children,
    required this.onScrollArriveBottomAndValidToGetNextPageChange,
    required this.isLoadingNextPage ,
    required this.onRefresh,
    required this.emptyDataWidget,
    this.paddingArroundList,
    this.marginBetweenItemsHorizontal,
  }) {
    len = children.length;
    Log.i("PaginateGridView() - len: ${len}");
    _setupOnScrollComplete(); 
  }




  void _setupOnScrollComplete() {
    ScrollOnCompleteController(
        scrollController: _scrollController,
        isLoadingNextPage: isLoadingNextPage,
        onCompleteCallback: (){
          onScrollArriveBottomAndValidToGetNextPageChange();
        }
    );
  }

  ///--------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        /// listview
        Container(
          color: Colors.red,
          width: DeviceTools.getWidth(context),
          height: height ,
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child:   listBuilderShapeHaveData(),

          )
        ),
        /// placeholder
        if( isShowEmptyPlaceholder()  ) Container(
          margin: EdgeInsets.only(top: 20.h ),
          child: Center( child: emptyDataWidget ,),
        ),

        /// progress
        if( isLoadingNextPage ) Container(
            margin: EdgeInsets.only(top: 20.h ),
            child: Center( child: ProgressCircleContainer(),),
          ),


      ],
    );
  }


  bool isShowEmptyPlaceholder(){
    if(isLoadingNextPage )  return false ;
    if( len != 0 ) return false ;
    return true;
  }

  listBuilderShapeHaveData() {
    // Log.i("PaginateListview - listBuilderShapeHaveData()  - children.length: ${children.length}");
    return ListView.builder(
        physics: len == 0 ? AlwaysScrollableScrollPhysics() : null ,
        controller: _scrollController,
        itemCount: (children.length / spin  ).ceil(),
        padding: paddingArroundList??EdgeInsets.zero,
        itemBuilder:  (ctx, index ) {
          return ChooseWrapWidgetBySizeSpin(
            rowIndex: index ,
            children: children,
            spin: spin ,
              marginBetweenItemsHorizontal : marginBetweenItemsHorizontal,
          );
          // return children[index];
        }
    );
  }


}

