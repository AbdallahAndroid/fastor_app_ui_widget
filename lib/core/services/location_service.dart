import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/constant/env.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';


class LocalLocationService {
  Future<bool> _checkPermissions() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // throw LocationException('Location permissions are denied'.tr());
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // throw LocationException('Location permissions are permanently denied'.tr(), openAppSettings: true);
        return false;
      }

      return true;
    } catch (e) {
      Log.i("_checkPermissions() - Error: $e");
      return false;
    }
  }

  Future<void> _ensureLocationEnabled() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await _checkPermissions();
      // throw LocationException('Location services are disabled'.tr(), openAppSettings: true);
    }
  }

  Future<Position> getCurrentLocation() async {
    await _checkPermissions();
    await _ensureLocationEnabled();
    return await Geolocator.getCurrentPosition(locationSettings: const LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 10));
  }

  /// Reverse geoCodes latitude and longitude to get address
  Future<String?> getAddressFromCoordinates(double latitude, double longitude) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
    if (placeMarks.isEmpty) {
      // throw LocationException('No address found for the provided coordinates.'.tr());
      // return 'Unknown location'.tr();
      return null;
    }
    return placeMarks.first.street ?? null;
  }

  /// Calls Google Directions API to build a car (driving) route between two points,
  /// returns the decoded list of [LatLng] points to draw as a polyline on the map.
  Future<List<LatLng>> generateRoutesDirection({required LatLng origin, required LatLng destination}) async {
    try {
      var response = await Dio().get(
        'https://maps.googleapis.com/maps/api/directions/json',
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'mode': 'driving',
          'key': env.googleApiKeyPlaces,
        },
      );

      if (response.statusCode != 200 || response.data['status'] != 'OK') {
        Log.i("generateRoutesDirection() - status: ${response.data['status']}");
        return [];
      }

      String encodedPoints = response.data['routes'][0]['overview_polyline']['points'];
      return _decodePolyline(encodedPoints);
    } catch (e) {
      Log.i("generateRoutesDirection() - Error: $e");
      return [];
    }
  }

  /// Calls Google Directions API to get the driving distance between two points in kilometers.
  Future<int?> getDistanceInKm({required LatLng origin, required LatLng destination}) async {
    try {
      var response = await Dio().get(
        'https://maps.googleapis.com/maps/api/directions/json',
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'mode': 'driving',
          'key': env.googleApiKeyPlaces,
        },
      );

      if (response.statusCode != 200 || response.data['status'] != 'OK') {
        Log.i("getDistanceInKm() - status: ${response.data['status']}");
        return null;
      }

      int distanceInMeters = response.data['routes'][0]['legs'][0]['distance']['value'];
      return (distanceInMeters / 1000).round();
    } catch (e) {
      Log.i("getDistanceInKm() - Error: $e");
      return null;
    }
  }

  /// Decodes a Google encoded polyline string into a list of [LatLng] points.
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int shift = 0, result = 0, b;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      lat += (result & 1) != 0 ? ~(result >> 1) : (result >> 1);

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      lng += (result & 1) != 0 ? ~(result >> 1) : (result >> 1);

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }


  /// Returns the midpoint [LatLng] between two coordinates.
  Future<LatLng?> getCenterBetweenTwoPoints(LatLng startPoint, LatLng endPoint) async {
    try {
      double centerLat = (startPoint.latitude + endPoint.latitude) / 2;
      double centerLng = (startPoint.longitude + endPoint.longitude) / 2;
      return LatLng(centerLat, centerLng);
    } catch (e) {
      Log.i("getCenterBetweenTwoPoints() - Error: $e");
      return null;
    }
  }


}
