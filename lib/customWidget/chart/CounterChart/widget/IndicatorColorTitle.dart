import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/resource/DimensionResource.dart';

import 'package:fastor_app_ui_widget/customWidget/text/text_custom/TextCustomSemiBold.dart';
import 'package:flutter/material.dart';

class IndicatorColorTitle extends StatelessWidget {

  Color color;
  String title;

  IndicatorColorTitle({
    required this.color,
    required this.title
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: DimensionResource.marginBetweenItemInSingleSections),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox( width: Figma.w( 10),),

          /// color
          Container(
            width: Figma.h( 16),
            height: Figma.h( 12),
            color: color,
          ),
          SizedBox( width: Figma.w( 10),),

          /// title
          TextCustomSemiBold( title.trim(), fontSize: Figma.h( 16 ), )
        ],
      ),
    );
  }
}