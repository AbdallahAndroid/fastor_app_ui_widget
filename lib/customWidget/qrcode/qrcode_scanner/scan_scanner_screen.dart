// class

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/customWidget/scaffold/ScaffoldApp.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:fastor_app_ui_widget/customWidget/qrcode/qrcode_scanner/automation/ScanAutomation.dart';
import 'package:fastor_app_ui_widget/customWidget/qrcode/qrcode_scanner/logic/scan_scanner_controller.dart';
import 'package:flutter/material.dart';

import 'package:native_barcode_scanner/barcode_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

typedef QRCodeScannerCallback = Function(String qrcodeData );


class QrScanScannerScreen extends StatefulWidget {

  QRCodeScannerCallback callback;

  QrScanScannerScreen( {required this.callback });

  @override
  ScanScannerState createState()  => ScanScannerState();

}

class ScanScannerState extends State<QrScanScannerScreen> {

  final scrollController = ScrollController();

  bool isFetching = false;
  bool isScannedBefore = false;

  @override
  void initState() {
    permissionQr();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setupAutomation();

    });
  }

  permissionQr() async{
    PermissionStatus status = await Permission.camera.status;
    if( status == PermissionStatus.permanentlyDenied ) return;
    if( status == PermissionStatus.granted ) return;
    await Permission.camera .request();
  }

  //--------------------------------------------------------------------- build content

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: scaffoldQr(),
        onWillPop: ( ) async {
      return true;
    });
  }

  scaffoldQr(){
    return ScaffoldApp(
      putBodyInsideScroll: true,
      putBodyInsideSafeArea: true,
      scrollController: scrollController,
      titleAppbar:   "Scan QR code".tr() ,
      body: scanQrSurfaceView() ,
    );
  }

  //------------------------------------------------------- scan surface

  scanQrSurfaceView(){
    return Container(
      width: DeviceTools.getWidth(context),
      height: DeviceTools.getHeight(context),
      color: AppColors.black.withOpacity( 0.5),
      child:  Stack(
        children: [
          if( isFetching)    progressViewFullScreen(),
        if( isFetching == false )     BarcodeScannerWidget(
            onBarcodeDetected: (Barcode barcode) async {
              await readQrcode(barcode.value);
            },
            onError: (error) {
            },
          )

        ],
      ),
    );
  }


  Widget progressViewFullScreen() {
    return  Container(
      color: AppColors.black.withOpacity( 0.5),
      width: DeviceTools.getWidth(context),
      height: DeviceTools.getHeight(context),
      alignment: Alignment.center,
      child: ProgressCircleApp( size: 80,),
    );
  }
}