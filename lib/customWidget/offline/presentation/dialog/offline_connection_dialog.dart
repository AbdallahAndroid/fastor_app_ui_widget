import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/theme/app_text_styles.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/offline/cubit/offline_network/offline_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineConnectionDialog extends StatelessWidget {
  const OfflineConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: IntrinsicWidth(
            child: IntrinsicHeight(
              child: Container(
                width: (size.width * .9),
                padding: EdgeInsets.all(20.hr),
                decoration: AppDecoration.dialogWhite(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.wifi_off,
                      size: 64.hr,
                      color: AppColors.red,
                    ),
                    SizedBox(height: 16.hr),
                    Text(
                      "no_internet_connection".tr(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.hr),
                    Text(
                      "please_check_internet_connection".tr(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greenDark,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.hr),
                    BlocBuilder<OfflineModeCubit, OfflineModeState>(
                      builder: (context, state) {
                        bool isOnline = false;
                        if (state is FoundNetworkConnectionChangedState) {
                          isOnline = state.isConnected;
                        }
                        return Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "network_status".tr(),
                                    style: AppTextStyles.font10Primary500,
                                  ),
                                  TextSpan(text: " "),
                                  TextSpan(
                                    text: isOnline
                                        ? "${"online".tr()}"
                                        : "${"offline_name".tr()}",
                                    style: isOnline
                                        ? AppTextStyles.font10Primary500
                                        : AppTextStyles.font10Error500,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 14.hr),
                            ButtonApp(
                               "ok".tr(),
                                isOnline
                                  ? () => Navigator.of(context).pop()
                                  : () => Log.i(
                                        "OfflineConnectionDialog - OK button pressed - But offline, ignoring",
                                      ),
                              background: isOnline
                                  ? AppColors.primary
                                  : AppColors.grey,
                              textColor: AppColors.white,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
