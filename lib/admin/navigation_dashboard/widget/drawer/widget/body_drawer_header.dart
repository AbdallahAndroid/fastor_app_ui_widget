import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/navigate/RouterAdmin.dart';
import 'package:fastor_app_ui_widget/core/navigate/RouterPage.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/FontProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/cubit/navigation_dashboard_cubit.dart';
import 'package:fastor_app_ui_widget/admin/navigation_dashboard/widget/drawer/widget/menu_item_tab.dart';
import 'package:fastor_app_ui_widget/customWidget/camera/photo_picker_widget/shape_name/photo_picker_shape_name_widget.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class BodyDrawerHeader extends StatelessWidget {

  late NavigationDashboardCubit cubit;
  GlobalKey<ScaffoldState> keyDrawerScaffoldState;

  BodyDrawerHeader( this.keyDrawerScaffoldState);

  @override
  Widget build(BuildContext context) {
    cubit = NavigationDashboardCubit.get(context);

    return Container(
      child:  GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// photo
            PhotoPickerShapeNameWidget(
              width: 60.wr ,
              placeholderAssetName: "assets/logo/placeholder_logo_white.png",
              username: UserHelper.getUserName(),
              imageUrlPreviousSelected: UserHelper.getImageUrl(),
              isModePreviousOnly: true,
              photoCallback: ( xFile ){},
            ),
            SizedBox( height: 16.h ,),

            /// username
            TextApp(  UserHelper.getUserNameNullable()??"Dashboard".tr(),
              fontSize: 20.sp,
              color: AppColor.white,
              fontFamily: FontProject.w500,
            ),
            // SizedBox( height: 16.h ,),
          ],
        ),

        onTap: () {
          RouterAdmin.homeDashboard(context);
          // cubit.dismissDrawer( index: 0, keyDrawerScaffoldState: keyDrawerScaffoldState);
        },
      ),
    );
  }

}