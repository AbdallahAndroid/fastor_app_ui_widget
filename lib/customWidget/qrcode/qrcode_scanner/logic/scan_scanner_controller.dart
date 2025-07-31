import 'package:fastor_app_ui_widget/core/utils/timer/ToolsWait.dart';
import 'package:fastor_app_ui_widget/core/utils/values/ToolsValidation.dart';
import 'package:fastor_app_ui_widget/customWidget/qrcode/qrcode_scanner/scan_scanner_screen.dart';
import 'package:flutter/material.dart';


extension ScanScannerController on ScanScannerState {


  Future readQrcode(String barcodeData ) async {
    // if( ToolsValidation.isEmpty( barcodeData)) refreshQrCodeSurfaceReading();
    if( ToolsValidation.isEmpty( barcodeData)) return;
    if(isScannedBefore ) return;
    isScannedBefore = true;

    await closeScreenAndReturnCallback(barcodeData);
  }

  closeScreenAndReturnCallback(String barcodeData) async {


    Navigator.pop(context);

    ToolsWait.waitToDo(100,  (){
      widget.callback(barcodeData);
    });

    }

  refreshQrCodeSurfaceReading(){
    setState(() {
      isFetching = true;
    });

    ToolsWait.waitToDo(1000,  (){

      setState(() {
        isFetching = false;
      });

    });
  }
}