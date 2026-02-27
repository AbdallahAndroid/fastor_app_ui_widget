import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/theme/app_text_styles.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/cubit/offline_network/offline_mode_cubit.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/dialog/offline_connection_dialog.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/dialog/sync_cloud_required_dialog.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/network_wrapper_widget/network_wrapper_controller.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class PopupOfflineModeSwitcher {
  static void showSyncCloudRequiredDialog() async {
    /// validate already open dialog
    if (NetworkWrapperController.isAlreadyOpenDialog) {
      Log.i("showSyncCloudRequiredDialog() - isAlreadyOpenDialog - stop !");
      return;
    }
    NetworkWrapperController.isAlreadyOpenDialog = true;

    final navigatorContext = GlobalApp.getNavigatorContext();
    if (navigatorContext == null) {
      Log.i(
        "showSyncCloudRequiredDialog() - No navigator context available - stop !",
      );
      return;
    }

    Log.i("showSyncCloudRequiredDialog() - Showing dialog");

    await showDialog(
      context: navigatorContext,
      barrierDismissible: false,
      builder: (context) => SyncCloudRequiredDialog(),
    ).then((s) {
      NetworkWrapperController.isAlreadyOpenDialog = false;
    });
  }

  static void showInternetLostDialog() async {
    /// validate already open dialog
    if (NetworkWrapperController.isAlreadyOpenDialog) {
      Log.i(
          "NetworkListenerWrapperWidget - showInternetLostDialog - isAlreadyOpenDialog - stop !");
      return;
    }
    NetworkWrapperController.isAlreadyOpenDialog = true;
    final navigatorContext = GlobalApp.getNavigatorContext();
    if (navigatorContext == null) {
      Log.i(
        "OfflineOverlayService - showInternetLostDialog - No navigator context available",
      );
      return;
    }

    Log.i("OfflineOverlayService - showInternetLostDialog - Showing dialog");

    await showDialog(
      context: navigatorContext,
      barrierDismissible: false,
      builder: (context) => OfflineConnectionDialog(),
    ).then((s) {
      NetworkWrapperController.isAlreadyOpenDialog = false;
    });
  }

  static chooseMode({required BuildContext context}) {
    /// validate already open dialog
    if (NetworkWrapperController.isAlreadyOpenDialog) {
      Log.i(
          "NetworkListenerWrapperWidget - PopupOfflineModeSwitcher.showInternetLostDialog - isAlreadyOpenDialog - stop !");
      return;
    }
    NetworkWrapperController.isAlreadyOpenDialog = true;

    showDialog(
      context: context,
      barrierDismissible: true,
      // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              width: AppDimension.dialogWidth( ),
              padding: EdgeInsets.all(20.wr),
              decoration: AppDecoration.dialogWhite(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.wifi,
                    size: 80.hr,
                    color: AppColors.primaryDark,
                  ),
                  SizedBox(
                    height: 20.hr,
                  ),
                  TextApp("Switch Mode Connection".tr(),
                      maxLines: 4, textStyle: AppTextStyles.font18lack500),
                  SizedBox(
                    height: 35.hr,
                  ),
                  Center(
                    child: ButtonApp(
                          "Offline Mode".tr(),
                        background: AppColors.white,
                        textColor: AppColors.black,
                        borderLine: AppColors.black,
                        width: AppDimension.dialogWidth( ),
                         () {
                          Navigator.pop(context);
                          OfflineModeCubit.get(context)
                              .toggleOfflineMode(isIamOffline: true);
                        }),
                  ),
                  SizedBox(
                    height: 15.hr,
                  ),
                  Center(
                    child: ButtonApp(
                         "Online Mode".tr(),
                        width: AppDimension.dialogWidth( ),
                         () {
                          Navigator.pop(context);
                          OfflineModeCubit.get(context)
                              .toggleOfflineMode(isIamOffline: false);
                        }),
                  ),
                  SizedBox(
                    height: 10.hr,
                  ),
                ],
              ),
            ));
      },
    ).then((t) {
      NetworkWrapperController.isAlreadyOpenDialog = false;
    });
  }

  static mustBeOfflineMode({required BuildContext context}) {
    /// validate already open dialog
    if (NetworkWrapperController.isAlreadyOpenDialog) {
      Log.i(
          "NetworkListenerWrapperWidget - PopupOfflineModeSwitcher.mustBeOfflineMode - isAlreadyOpenDialog - stop !");
      return;
    }
    NetworkWrapperController.isAlreadyOpenDialog = true;

    showDialog(
      context: context,
      barrierDismissible: true,
      // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              width: AppDimension.dialogWidth( ),
              padding: EdgeInsets.all(20.wr),
              decoration: AppDecoration.dialogWhite(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.wifi,
                    size: 80.hr,
                    color: AppColors.primaryDark,
                  ),
                  SizedBox(
                    height: 20.hr,
                  ),
                  TextApp("Must be offline mode".tr(),
                      maxLines: 4, textStyle: AppTextStyles.font18lack500),
                  SizedBox(
                    height: 35.hr,
                  ),
                  Center(
                    child: ButtonApp(
                         "Offline Mode".tr(),
                        background: AppColors.white,
                        textColor: AppColors.black,
                        borderLine: AppColors.black,
                        width: AppDimension.dialogWidth( ),
                         () {
                          Navigator.pop(context);
                          OfflineModeCubit.get(context)
                              .toggleOfflineMode(isIamOffline: true);
                        }),
                  ),
                  SizedBox(
                    height: 10.hr,
                  ),
                ],
              ),
            ));
      },
    ).then((t) {
      NetworkWrapperController.isAlreadyOpenDialog = false;
    });
  }
}
