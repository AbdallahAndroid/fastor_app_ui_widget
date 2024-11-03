import 'package:fastor_app_ui_widget/customWidget/chart/TransactionDoublePriceChart/TransactionDoublePriceChart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

extension TouchChart on TransactionDoublePriceChartState {


  getTouchBarData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: ((group) {
          return Colors.grey;
        }),
        getTooltipItem: (a, b, c, d) => null,
      ),
      touchCallback: (FlTouchEvent event, response) {
        if (response == null || response.spot == null) {
          setState(() {
            touchedGroupIndex = -1;
            showingBarGroups = List.of(rawBarGroups);
          });
          return;
        }

        touchedGroupIndex = response.spot!.touchedBarGroupIndex;

        setState(() {
          if (!event.isInterestedForInteractions) {
            touchedGroupIndex = -1;
            showingBarGroups = List.of(rawBarGroups);
            return;
          }
          showingBarGroups = List.of(rawBarGroups);
          if (touchedGroupIndex != -1) {
            var sum = 0.0;
            for (final rod
            in showingBarGroups[touchedGroupIndex].barRods) {
              sum += rod.toY;
            }
            final avg = sum /
                showingBarGroups[touchedGroupIndex]
                    .barRods
                    .length;

            showingBarGroups[touchedGroupIndex] =
                showingBarGroups[touchedGroupIndex].copyWith(
                  barRods: showingBarGroups[touchedGroupIndex]
                      .barRods
                      .map((rod) {
                    return rod.copyWith(
                        toY: avg, color: widget.colorAverage);
                  }).toList(),
                );
          }
        });
      },
    );
  }
}