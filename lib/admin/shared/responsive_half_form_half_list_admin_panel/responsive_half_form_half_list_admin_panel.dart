import 'package:fastor_app_ui_widget/admin/shared/responsive_half_form_half_list_admin_panel/cubit/page_selection_cubit.dart';
import 'package:fastor_app_ui_widget/admin/shared/responsive_half_form_half_list_admin_panel/cubit/page_selection_state.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/navigate/RouterAdmin.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/scaffold/ScaffoldApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponsiveHalfFormHalfListAdminPanel extends StatefulWidget {
  /// the first page
  Widget pageList;

  /// the second page
  Widget pageForm;

  /// widgets scaffold
  Widget? floatingActionButtonShowAtFirstPageOnly;
  Widget? bottomSheet;

  ResponsiveHalfFormHalfListAdminPanel({
    required this.pageList,
    required this.pageForm,
    this.floatingActionButtonShowAtFirstPageOnly,
    this.bottomSheet,
  });

  @override
  ResponsiveHalfFormHalfListAdminPanelState createState() =>
      ResponsiveHalfFormHalfListAdminPanelState();
}

class ResponsiveHalfFormHalfListAdminPanelState
    extends State<ResponsiveHalfFormHalfListAdminPanel> {

  late PageSelectionDashboardHalfHalfShapeCubit cubit;

  @override
  void initState() {
    cubit = PageSelectionDashboardHalfHalfShapeCubit.get(context);
    cubit.initPagesWidget();
    cubit.addPageWidget( widget.pageList );
    cubit.addPageWidget( widget.pageForm );
    super.initState();
  }


  ///----------------------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    return PopScope(

        /// handle didPop
        canPop: false,
        onPopInvoked: (didPop) {
          cubit.onBackClicked(context);
          return;
        },

        /// bloc builder pageSelection
        child: BlocBuilder<PageSelectionDashboardHalfHalfShapeCubit, PageSelectionState>(
          builder: ( ctx, state ){
            cubit = PageSelectionDashboardHalfHalfShapeCubit.get(ctx);
            return listenerChangeWidthDynamicByWebsite();
          },
        )
    );
  }



  Widget listenerChangeWidthDynamicByWebsite(){
    return LayoutBuilder(
      builder: (context, constraints) {
        Figma.setup(context);
        // Log.i("LayoutBuilder - Width changed: ${constraints.maxWidth} /height: ${constraints.maxHeight}");
        // Log.i("LayoutBuilder - isLandscape: ${DeviceTools.isLandscape(context)} ");
        // Log.i("LayoutBuilder - isLandscape: ${DeviceTools.isLandscape(context)} ");


        return scaffoldWithBodyChooseShape();

      },
    );
  }

  Widget scaffoldWithBodyChooseShape(){
    return ScaffoldApp(
      floatingActionButton: cubit.isFirstPageViewedOnly(context) ? widget.floatingActionButtonShowAtFirstPageOnly : null ,
      bottomSheet: widget.bottomSheet,
      body: chooseShape(),
    );
  }




  Widget chooseShape(){
    if(cubit.pages.length == 0 ) return SizedBox();

    if ( cubit.isShapeHalfHalf(context)) {
      return shapeHalfFormHalfList();
    } else {
      return shapeSinglePage();
    }
  }


  Widget shapeSinglePage() {
    return Container(
      // color: Colors.yellow,
      width: DeviceTools.getWidth(context),
      height: DeviceTools.getHeight(context),
      alignment: LangApp.getAlignmentGeometryStartTop(),
      child: cubit.pages[ cubit.indexPage],
    );
  }


  Widget shapeHalfFormHalfList() {
    return Container(
      width: DeviceTools.getWidth(context),
      height: DeviceTools.getHeight(context),
      alignment: LangApp.getAlignmentGeometryStartTop(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// page list
          Container(
            // color: Colors.yellow,
            width: DeviceTools.getHalfWidth(context),
            height: DeviceTools.getHeight(context),
            alignment: LangApp.getAlignmentGeometryStartTop(),
            child: widget.pageList,
          ),

          /// page form
          Container(
            // color: Colors.lightBlueAccent,
            width: DeviceTools.getHalfWidth(context),
            height: DeviceTools.getHeight(context),
            alignment: LangApp.getAlignmentGeometryStartTop(),
            child: widget.pageForm,
          ),
        ],
      ),
    );
  }



}
