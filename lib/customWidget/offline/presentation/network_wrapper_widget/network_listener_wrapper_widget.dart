import 'package:fastor_app_ui_widget/core/cache/UserHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/globa/GlobalApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/cubit/offline_network/offline_mode_cubit.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/cubit/sync_cloud/sync_cloud_cubit.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/dialog/popup_offline_mode_switcher.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/network_wrapper_widget/network_wrapper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkListenerWrapperWidget extends StatefulWidget {
  Widget child;

  NetworkListenerWrapperWidget({
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => NetworkListenerWrapperState();
}

class NetworkListenerWrapperState extends State<NetworkListenerWrapperWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OfflineModeCubit, OfflineModeState>(
      listener: (context, state) async {
        final navigatorContext = GlobalApp.getNavigatorContext();

        /// update is connected status
        Log.i("NetworkListenerWrapperWidget -  state: $state"
            " /NetworkWrapperController.isConnectedLastStatus: ${NetworkWrapperController.isConnectedLastStatus}");

        /// validate splash finished
        if (NetworkWrapperController.isFinishSplash == false) {
          Log.i(
              "NetworkListenerWrapperWidget -  isFinishSplash not yet - stop !");
          return;
        }

        /// open dialog
        // log("AppBlocListenerWrapper - BlocListener - State changed: ${state.runtimeType}");
        if (state is FoundNetworkConnectionChangedState) {
          // log("AppBlocListenerWrapper - BlocListener - Connection state: ${state.isConnected}");

          // Connection lost - show offline dialog

            if (state.isConnected) {
              // Connection restored - dialog will close automatically via BlocBuilder
              Log.i("AppBlocListenerWrapper - BlocListener - Connection restored");
              // check if the dialog is opened and close it else do nothing
            } else {
              Log.i("AppBlocListenerWrapper - Non-seller user - showing OfflineOverlayService dialog");
              PopupOfflineModeSwitcher.showInternetLostDialog();
            }

          Log.i("AppBlocListenerWrapper - BlocListener - Dialog shown");
        }
      },
      child: BlocConsumer<SyncCloudCubit, SyncCloudState>(
        listener: (ctx, state) {
          if (state is TimerSyncCloudTimeOutAfterLongTimeNoInternetFoundState) {
            Log.i(
                "NetworkListenerWrapperWidget -  SyncCloudCubit need sync ###");
            PopupOfflineModeSwitcher.showSyncCloudRequiredDialog();
          }
        },
        builder: (ctx, state) {
          // Log.i(
          //     "NetworkListenerWrapperWidget - SyncCloudCubit - state: $state");
          return widget.child;
        },
      ),
    );
  }

  void chooseSellerDialog(BuildContext? navigatorContext, bool isConnected) {
    Log.i(
        "NetworkListenerWrapperWidget - chooseSellerDialog() - UserHelper.isOnlineMode(): ${UserHelper.isOnlineMode()} "
        " /isConnected: ${isConnected}");

    ///cases can switch mode
    if (UserHelper.isOnlineMode() && isConnected == false) {
      Log.i(
          "NetworkListenerWrapperWidget - chooseSellerDialog() - Showing mustBeOfflineMode dialog");
      PopupOfflineModeSwitcher.mustBeOfflineMode(context: navigatorContext!);
    } else if (UserHelper.isOnlineMode() && isConnected) {
      Log.i(
          "NetworkListenerWrapperWidget - chooseSellerDialog() - Online mode and connected - DoNothing");

      /// DoNothing
    } else if (UserHelper.isOfflineMode() && isConnected) {
      Log.i(
          "NetworkListenerWrapperWidget - chooseSellerDialog() - Showing chooseMode dialog");
      PopupOfflineModeSwitcher.chooseMode(context: navigatorContext!);
    } else if (UserHelper.isOfflineMode() && isConnected == false) {
      Log.i(
          "NetworkListenerWrapperWidget - chooseSellerDialog() - Offline mode and disconnected - DoNothing");

      /// DoNothing or may show dialog to choose mode
      PopupOfflineModeSwitcher.chooseMode(context: navigatorContext!);
    }
  }
}
