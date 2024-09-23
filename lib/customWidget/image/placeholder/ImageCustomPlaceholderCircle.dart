import 'package:fastor_app_ui_widget/customWidget/image/ImageApp.dart';
import 'package:flutter/material.dart';


class ImageCustomPlaceholderCircle extends StatelessWidget {

  double size;
  String? url;
  Color? colorBackground;
  AssetImage? assetPlaceHolder;
  double? radius; //crop radius

  ImageCustomPlaceholderCircle({
    required this.size,
    required this.url,
    this.radius,
    this.assetPlaceHolder,
    this.colorBackground
}) {
    colorBackground ??= Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return  ClipOval(
      child: imageContent(context),
    ) ;
  }

  Widget imageContent(BuildContext context) {
    return ImageApp(
      context: context,
      width: size,
      height: size,
      urlBackground: url,
      radius: radius,
      assetAspectRatio: assetPlaceHolder, //??AssetImage("assets/images/placeholder_logo_square.png"), /// placeholder icon
      colorBackground:   colorBackground!    , /// placeholder color
    );
  }


}