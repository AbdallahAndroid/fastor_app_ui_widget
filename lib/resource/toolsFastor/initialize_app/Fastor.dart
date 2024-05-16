import 'package:fastor_app_ui_widget/resource/toolsFastor/cache/SaveFastor.dart';
class Fastor {


  /// write under MyApp() constructor
  static Future initializeApp( ) async {
    // DeviceTools.initFullSize( context  );
    // StatusBarConstant.initStatusBarValues( context  );
    // NotchBarConstant.initNotchBarValues( context );
    SaveFastor.init();
  }


}