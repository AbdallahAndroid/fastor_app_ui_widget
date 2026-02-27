import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/navigate/RouterAdmin.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:flutter/material.dart';

class ButtonsAdminBar extends StatelessWidget {


  bool isShowButtonDelete;
  final VoidCallback onPressedConfirmDelete;
  final VoidCallback onPressedEdit;
  bool? isShowButtonSave;
  Widget? leftWidget;
  String? titleDelete;

  ButtonsAdminBar({
    required this.isShowButtonDelete,
    required this.onPressedEdit,
    required this.onPressedConfirmDelete,
    this.leftWidget,
    this.isShowButtonSave = true  ,
    this.titleDelete,
}) {

    isShowButtonSave ??= true ;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: DeviceTools.getWidth(context),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          if(leftWidget != null ) leftWidget!,
          if(isShowButtonSave! ) ButtonApp("Save".tr(),
                ()  => onPressedEdit(),
            width: AppDimension.adminButtonWidth ,
            background: AppColors.primary,
          ),


          if( isShowButtonDelete )ButtonApp(titleDelete??"Delete".tr(),
                () async {

              dialogConfirmDelete(context);

            },
            width: AppDimension.adminButtonWidth ,
            background: AppColors.buttonGrey,
          )

        ],
      ),
    );
  }


  void dialogConfirmDelete(BuildContext context ) {
    RouterAdmin.dialogConfirmDelete(
        context: context ,
        onPressedConfirm: () => onPressedConfirmDelete()
    );
  }

}