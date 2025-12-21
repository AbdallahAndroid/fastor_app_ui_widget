
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {

  String? urlBackground;
  double width;
  double height;
  Color? colorBackground;
  BoxFit? boxFit;
  double? radius;

  ImagePlaceHolder({
    required this.width,
    required this.height,
    required this.urlBackground,
    this.radius,
    this.boxFit,
    this.colorBackground,
} );


  @override
  Widget build(BuildContext context) {

    return ImageApp(
      context: context,
      width: this.width,
      height: this.height,
      radiusAll: radius ,
      // onPressed: ,
      colorBackground: colorBackground?? AppColors.imageBackgroundPlaceHolder,
      assetAspectRatio: AssetImage("assets/logo/placeholder_logo.png"), // AssetImage("assets/logo/logo.png"),
      urlBackground: this.urlBackground,
      boxFitBackground: boxFit??BoxFit.cover,
    );
  }

  defaultAssetsPlaceHolder() {
    return Image.asset("assets/logo/placeholder_logo.png",
      width: width,
      height: height,
    );
  }


}