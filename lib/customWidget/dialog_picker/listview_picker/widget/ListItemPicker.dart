import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/DataPickerEntity.dart';
import 'package:fastor_app_ui_widget/customWidget/dialog_picker/listview_picker/core/typedef_dialog_picker.dart';
import 'package:fastor_app_ui_widget/customWidget/row/RowScrollApp.dart';
import 'package:fastor_app_ui_widget/core/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/log/Log.dart';
import 'package:fastor_app_ui_widget/core/values/ToolsValidation.dart';

class ListItemPicker extends StatelessWidget {
  BuildContext? context;
  DataPickerEntity entity;
  ListViewDialogPickerGenericListener listener;
  bool isHideImage;
  bool isFirstIndex;

  ListItemPicker(
      {required this.entity,
      required this.listener,
      required this.isFirstIndex,
      required this.isHideImage});

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return GestureDetector(
      child: Directionality(
        textDirection: LangApp.getTextDirection(),
        child: itemContent(),
      ),
      onTap: () {
        listener(entity);
      },
    );
  }

  Widget itemContent() {
    return Container(
      width: DeviceTools.getWidth(context!),
      height: Figma.w(40),
      padding: EdgeInsets.only(top: Figma.h(isFirstIndex ? 12 : 8)),
      alignment: LangApp.getAlignmentGeometryStart(),
      color: Colors.transparent,
      child: RowScrollApp(
        children: [
          if (isVisibleImage()) icon(),
          if (isVisibleImage())
            SizedBox(
              width: Figma.w(8),
            ),
          title()
        ],
      ),
    );
  }

  icon() {
    // Log.i("icon() - entity.imageUrl: ${entity.imageUrl}");
    return ImageApp(
      context: context!,
      width: Figma.w(33),
      height: Figma.w(21),
      colorBackground: Colors.grey.withOpacity(0.5),
      urlBackground: entity.image,
    );
  }

  title() {
    return TextApp(
      entity.title ?? "",
      fontSize: Figma.w(13),
      color: Colors.black,
    );
  }

  bool isVisibleImage() {
    // Log.i("isFoundImageData() - entity.imageUrl: ${entity.imageUrl}");
    if (isHideImage) {
      return false;
    }
    return ToolsValidation.isValid(entity.image);
  }
}
