
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:flutter/material.dart';

class DashedVerticalLineBoarderWidget extends StatelessWidget {

  final double height;
  const DashedVerticalLineBoarderWidget({ required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const dashHeight = 4.0;
          const dashSpace = 3.0;
          final totalHeight = constraints.maxHeight;
          final dashCount = (totalHeight / (dashHeight + dashSpace)).floor();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(dashCount, (_) {
              return Padding(
                padding: EdgeInsets.only(bottom: dashSpace),
                child: Container(
                  width: 1.5,
                  height: dashHeight,
                  color: AppColors.boarderLineCardItem,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}