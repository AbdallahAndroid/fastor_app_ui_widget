import 'package:flutter/material.dart';

class ChooseWrapWidgetBySizeSpin extends StatelessWidget {
  final int rowIndex;
  final int spin;
  final List<Widget> children;
  final double? marginBetweenItemsHorizontal;

  const ChooseWrapWidgetBySizeSpin({
    Key? key,
    required this.rowIndex,
    required this.spin,
    required this.children,
    this.marginBetweenItemsHorizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int startIndex = rowIndex * spin;
    List<Widget> rowCells = [];

    double spacing = marginBetweenItemsHorizontal ?? 0.0;

    for (int i = 0; i < spin; i++) {
      int currentItemIndex = startIndex + i;

      // 1. Add the actual item or a placeholder
      if (currentItemIndex < children.length) {
        rowCells.add(
          Expanded(
            child: children[currentItemIndex],
          ),
        );
      } else {
        rowCells.add(
          const Expanded(
            child: SizedBox.shrink(),
          ),
        );
      }

      // 2. ONLY add a spacer if this is NOT the last item in the row
      // This puts the space strictly *between* the items (e.g., middle of item1 and item2)
      if (i < spin - 1) {
        rowCells.add(
          SizedBox(width: spacing),
        );
      }
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rowCells,
      ),
    );
  }
}