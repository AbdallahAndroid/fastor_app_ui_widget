
import 'dart:math';

import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/ProjectFigmaScreenInitializer.dart';

extension FigmaScaleText on num {

  double scaleRadius() => min(scaleWidth(), scaleHeight());
  double scaleText() => scaleWidth();
  double scaleWidth() =>
      currentDeviceWidth / ProjectFigmaScreenInitializer.figmaScreenWidth;
  double scaleHeight() =>
      currentDeviceHeight / ProjectFigmaScreenInitializer.figmaScreenHeight;
}

extension FigmaFactory on Figma {

  //---------------  user change font size of device

  static bool isTextFactoryLarge(){
    return textScaleFactorFigma > 1;
  }

  static double factoryText() { return textScaleFactorFigma; }

  static double getFactoryTextLarger() { return textScaleFactorFigma; }


}
