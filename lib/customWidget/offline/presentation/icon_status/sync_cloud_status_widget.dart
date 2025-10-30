import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/KeyboardTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/cubit/offline_network/offline_mode_cubit.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/cubit/sync_cloud/sync_cloud_cubit.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/network_wrapper_widget/network_wrapper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncCloudStatusWidget extends StatelessWidget {
  bool isSyncLoading = false;
  bool isNoInternetConnection = false;
  bool isCompleteSync = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SyncCloudCubit, SyncCloudState>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          // Log.i("sync - SyncCloudStatusWidget - SyncCloudState: $state");

          /// case not need icon
          // if (UserHelper.isOnlineMode()) return SizedBox();

          return BlocBuilder<OfflineModeCubit, OfflineModeState>(
              builder: (ctx, state) {
            // Log.i("sync - SyncCloudStatusWidget - OfflineModeState: $state");
            return contentUI(ctx);
          });
        });
  }

  Widget contentUI(BuildContext context) {
    isSyncLoading = SyncCloudCubit.get(context).state
        is SyncCloudUploadOfflineOrdersLoadingState;
    isNoInternetConnection =
        NetworkWrapperController.isConnectedLastStatus == false;
    isCompleteSync = SyncCloudCubit.get(context).state
        is SyncCloudUploadOfflineOrdersCompleteState;

    return GestureDetector(

      child: Container(
        decoration: AppDecoration.buttonWhite(),
        child: Icon( isNoInternetConnection
            ? Icons.sync_disabled
            : isCompleteSync
            ? Icons.done
            : Icons.sync,
          color: AppColors.white,
          size: 40.h ,
        ),
        // : Icons.local_airport,
        // : Icons.signal_wifi_connected_no_internet_4

      ),
      onTap: () {
        ToolsKeyboard.dismiss(context);
        SyncCloudCubit.get(context).setupTimer();
      },
    );
  }
}
