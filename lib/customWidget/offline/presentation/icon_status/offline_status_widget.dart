import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/KeyboardTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/button/icon/IconCustomWidget.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/cubit/offline_network/offline_mode_cubit.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/presentation/network_wrapper_widget/network_wrapper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OfflineModeCubit, OfflineModeState>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return GestureDetector(

            child: Container(
              decoration: AppDecoration.buttonWhite(),
              child: Icon( NetworkWrapperController.isConnectedLastStatus
                  ? Icons.wifi
                  : Icons.signal_wifi_connected_no_internet_4,
                color: AppColors.white,
                size: 40.h ,
              ),
              // : Icons.local_airport,
              // : Icons.signal_wifi_connected_no_internet_4

            ),
            onTap: () {
              ToolsKeyboard.dismiss(context);
              // PopupOfflineModeSwitcher.chooseMode(context: context);
            },
          ); ;
        });
  }
}
