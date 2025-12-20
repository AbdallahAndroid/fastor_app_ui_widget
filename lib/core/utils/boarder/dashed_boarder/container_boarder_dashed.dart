
import 'package:flutter/material.dart';

class ContainerBoarderDashed extends StatelessWidget {

  double width;
  double height;
  double radius;
  Color  colorBackgroundCard;
  Color colorDashedBoarderLine;
  Widget child;

  ContainerBoarderDashed({
   required this.width,
   required this.height,
   required this.radius,
   required this.colorBackgroundCard,
   required this.colorDashedBoarderLine,
   required this.child
});

  @override
  Widget build(BuildContext context) {
      return Container(
        width: width,
        height: height ,
        color: colorBackgroundCard ,
        child:   CustomPaint(
        painter: _DashedBorderPainter(
            radius: radius,
            color: colorDashedBoarderLine,
          ),
        child:  child,
        ),
    ) ;
  }
}


class _DashedBorderPainter extends CustomPainter {
  final double radius;
  final Color color;

  _DashedBorderPainter({
    required this.radius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          Radius.circular(radius),
        ),
      );

    const dashWidth = 6.0;
    const dashSpace = 4.0;

    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final extractPath = metric.extractPath(
          distance,
          distance + dashWidth,
        );
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
