
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/ProjectFigmaScreenInitializer.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/scale_text.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';

extension PortraitPhoneSize on num  {

  static double widthPortrait ( double figmaSize ) {
    double ratio = ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenWidth );
    // Log.i("figma.width() - figmaSize: $figmaSize /_figmaScreenWidth: $_figmaScreenWidth /ratio: $ratio");
    return  ratio * currentDeviceWidth;
  }


  static double heightPortrait ( double figmaSize ) {
    return ( figmaSize / ProjectFigmaScreenInitializer.figmaScreenHeight ) * currentDeviceHeight;
  }



  /// text
  double get spPortrait => scaleText() * numToDouble();

}
