import 'package:flutter/material.dart';

/**
 * wraps "child" and reports its rendered size (after every layout/build) via "onChange".
 * useful to track dynamic height of a widget that grows/shrinks (ex: multi-line TextField).
 *
 * usage:
 *
 *  double textFieldHeight = 0;
 *
 *  MeasureSize(
 *    onChange: (size) {
 *      setState(() {
 *        textFieldHeight = size.height;
 *      });
 *    },
 *    child: TextFormField(
 *      minLines: 1,
 *      maxLines: null,
 *    ),
 *  )
 */
class MeasureSize extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onChange;

  const MeasureSize({
    super.key,
    required this.child,
    required this.onChange,
  });

  @override
  State<MeasureSize> createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = context.size;
      if (size != null && oldSize != size) {
        oldSize = size;
        widget.onChange(size);
      }
    });

    return widget.child;
  }
}
