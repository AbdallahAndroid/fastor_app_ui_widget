import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/customWidget/page/ScaffoldApp.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class DialogQrcodePreview extends StatelessWidget {


  String value;

  DialogQrcodePreview( this.value );

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      shapeTransparent: true,
      body:  Container(
        width: DeviceTools.getWidth(context),
        height: DeviceTools.getHeight(context),
        child: qr(),
        alignment: Alignment.center,
      ),
    );

  }

  qr() {
    return  QrImageView(
      data: value,
      version: QrVersions.auto,
      size: 180.wr,
      padding: EdgeInsets.all( 15.wr ),
      foregroundColor: AppColor.white,
      backgroundColor: AppColor.black,
    );
  }

}