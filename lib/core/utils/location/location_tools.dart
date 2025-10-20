import 'dart:math' show asin, cos, pi, sin, sqrt;

import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:permission_handler/permission_handler.dart';

class LocationTools {
  ///----------------------------------------------- location get and permission

  /// Get current location after checking permissions.
  static Future<Position?> getCurrentLocation(BuildContext context) async {
    bool hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) {
      Log.i("getCurrentLocation() - hasPermission - failed ");
      return null;
    }
    var result = await Geolocator.getCurrentPosition(
        // desiredAccuracy: accuracy??LocationAccuracy.high,
        );
    Log.i("getCurrentLocation() - result: $result");
    return result;
  }

  /// Handle permission logic and show popup if denied.
  static Future<bool> _handleLocationPermission(BuildContext context) async {
    var permission = await Permission.location.status;

    if (permission.isGranted) return true;

    if (permission.isDenied) {
      bool? shouldAsk = await showPermissionPopup(context);
      if (shouldAsk == true) {
        var result = await Permission.location.request();
        return result.isGranted;
      }
      return false;
    }

    if (permission.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    return false;
  }

  /// Show popup asking the user for permission.
  static Future<bool?> showPermissionPopup(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Location Permission Required'.tr()),
        content: Text(
          'This app needs access to your location for determine your position with the school location.'
              .tr(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: TextApp('Cancel'.tr()),
          ),
          ButtonApp(
             'Allow'.tr(),
              () => Navigator.pop(ctx, true),
          ),
        ],
      ),
    );
  }

  ///----------------------------------------------- location distance calculation

  /// Calculate distance between two coordinates in kilometers.
  static double calculateDistanceInKiloBetween(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // Radius of the Earth in km

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  static double _toRadians(double degree) => degree * pi / 180.0;

  static isDistanceBetweenTwoPointLessRange({
    required double rangeInKilo,
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    double distance =
        LocationTools.calculateDistanceInKiloBetween(lat1, lon1, lat2, lon2);
    Log.i(
        'isDistanceBetweenTwoPointLessRange() - distance: ${distance.toStringAsFixed(2)} km');
    return distance <= rangeInKilo;
  }
}
