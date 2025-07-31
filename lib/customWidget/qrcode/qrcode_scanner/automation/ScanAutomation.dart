
import 'package:fastor_app_ui_widget/core/constant/env.dart';
import 'package:fastor_app_ui_widget/core/utils/timer/ToolsWait.dart';
import 'package:fastor_app_ui_widget/customWidget/qrcode/qrcode_scanner/scan_scanner_screen.dart';

extension ScanAutomation on ScanScannerState {


  Future setupAutomation() async {
    if( isLiveEnvironment ) return;
    ToolsWait.waitToDo( 700,  (){
      caseValidOffer();

    });
  }


  void caseValidOffer() {
  }


  void caseValidRefund(){
  }


  void caseInvalid() {
  
  }



}