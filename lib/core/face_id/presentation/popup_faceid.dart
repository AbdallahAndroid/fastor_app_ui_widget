import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/theme/app_text_styles.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

class PopupFaceId {
  ///--------------------------------------------------------------- refresh

  static refreshButton(
      {required BuildContext context,
      required String msg,
      IconData? iconData,
      String? buttonTitle,
      bool? barrierDismissible,
      required GestureTapCallback onTapRefresh}) async {
    double? widthDialog = AppDimension.dialogWidthAwesome(context);

    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible ??
          true, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              width: widthDialog,
              padding: EdgeInsets.all(20.wr),
              decoration: AppDecoration.dialogWhite(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: onTapRefresh,
                    child: Icon(
                      iconData ?? Icons.refresh,
                      size: 80.hr,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(
                    height: 20.hr,
                  ),
                  TextApp(msg,
                      maxLines: 4,
                      textAlign: TextAlign.center,
                      textStyle: AppTextStyles.font18lack500),
                  SizedBox(
                    height: 35.hr,
                  ),
                  Center(
                    child: ButtonApp(buttonTitle ?? "Refresh".tr(), () {
                      Navigator.pop(context);
                      onTapRefresh();
                    }),
                  )
                ],
              ),
            ));
      },
    );
  }
}
