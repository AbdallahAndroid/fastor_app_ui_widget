import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';

class NotchBarSizeHelper {
  static double? _paddingBottom;

  static void init(BuildContext context) {
    getBottom(context);
    getTop(context);
  }

  static double getTop(BuildContext context) {
    try {
      var result = MediaQuery.viewPaddingOf(context).top;
      return result;
    } catch (err) {
      return 65;
    }
  }

  static double getBottom(BuildContext context) {
    try {
      // Log.i(
      //     "getBottom() - viewPadding: ${MediaQuery.of(context).viewPadding.bottom}");
      if (_paddingBottom != null) {
        // Log.i("getBottom() - reuse r: $_paddingBottom");
        return _paddingBottom!;
      }
      _paddingBottom = MediaQuery.viewPaddingOf(context).bottom;
      // Log.i("getBottom() - r: $_paddingBottom");
      return _paddingBottom!;
    } catch (err) {
      Log.i("getBottom() - error: $err");
      return 65;
    }
  }

  static double getBottomWithFixingIOSHaveLongHeight(BuildContext context) {
    try {
      // Log.i(
      //     "getBottom() - viewPadding: ${MediaQuery.of(context).viewPadding.bottom}");
      if (_paddingBottom != null) {
        if (DeviceTools.isIOS() && _paddingBottom! > 0) {
          Log.i("getBottom() - reuse r: $_paddingBottom");
          var factorResult = _paddingBottom! * 0.75;
          return factorResult;
        } else {
          return _paddingBottom ?? 0;
        }
      }
      _paddingBottom = MediaQuery.viewPaddingOf(context).bottom;
      Log.i("getBottom() - r: $_paddingBottom");

      if (DeviceTools.isIOS() && _paddingBottom! > 0)
        return _paddingBottom! / 2;
      return _paddingBottom!;
    } catch (err) {
      Log.i("getBottom() - error: $err");
      return 65;
    }
  }

  static double getHeightTopAndDown(BuildContext context) {
    return getTop(context) + getBottom(context);
  }

  static bool isHaveValue(BuildContext context) {
    var paddingBottom = MediaQuery.viewPaddingOf(context).bottom;
    var paddingTop = MediaQuery.viewPaddingOf(context).top;
    double total = paddingTop + paddingBottom;
    Log.i("isHaveValue() - r: $total");
    return total >= 1;
  }
}
