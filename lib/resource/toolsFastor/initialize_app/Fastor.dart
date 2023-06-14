import 'package:fastor_app_ui_widget/resource/toolsFastor/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/iphoneNotchBar/NotchBarConstant.dart';
import 'package:fastor_app_ui_widget/resource/uiFastor/statusBar/StatusBarConstant.dart';
import 'package:flutter/cupertino.dart';

class Fastor {


  /// write under MyApp() constructor
  static Future initializeApp(BuildContext context) async {
    DeviceTools.initFullSize( context  );///    //set full width
    StatusBarConstant.initStatusBarValues( context  );
    NotchBarConstant.initNotchBarValues( context );
  }


}