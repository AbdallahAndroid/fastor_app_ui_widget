import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:flutter/material.dart';


class ImageCustomPlaceholderSquare extends StatelessWidget {

  double width;
  double height;
  String? url;
  Color? colorBackground;
  AssetImage? assetPlaceHolder;
  double? radius; //crop radius

  ImageCustomPlaceholderSquare({
    required this.width,
    required this.height,
    required this.url,
    this.radius,
    this.assetPlaceHolder,
    this.colorBackground
}) {
    colorBackground ??= Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return ImageApp(
      context: context,
      width: width,
      height: height,
      urlBackground: url,
      radius: radius,
      assetAspectRatio: assetPlaceHolder, //??AssetImage("assets/images/placeholder_logo_square.png"), /// placeholder icon
      colorBackground:   colorBackground!    , /// placeholder color
    );
  }
}