import 'package:fastor_app_ui_widget/core/resource/ColorResource.dart';
import 'package:fastor_app_ui_widget/core/utils/boarder/BoarderHelper.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';

abstract class AppDecoration {


  ///------------------------------------------------------------- dialog
  ///
  static dialogWhite() {
    return BoarderHelper.cardView(
        radiusSize: 30.h,
        colorLine: ColorResource.greenLight,
        colorBackground: ColorResource.white);
  }
}