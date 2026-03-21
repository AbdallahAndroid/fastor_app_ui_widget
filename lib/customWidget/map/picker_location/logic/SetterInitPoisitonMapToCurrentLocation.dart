
import 'package:fastor_app_ui_widget/core/network/parse/ApiParserApp.dart';
import 'package:fastor_app_ui_widget/customWidget/map/picker_location/picker_location_screen.dart';
import 'package:fastor_app_ui_widget/customWidget/places/core/model/response_google_places.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
import 'package:permission_handler/permission_handler.dart';


extension SetterCurrentPosition on PickerLocationScreenState {

  ///---------------------------------------------------------- current location

  // Try to get device current location; fall back to project default if denied/unavailable
  Future<void> setInitialCameraToCurrentLocationOnCreateScreen() async {
    try {
      // Request permission using permission_handler
      var status = await Permission.locationWhenInUse.status;
      if (!status.isGranted) {
        status = await Permission.locationWhenInUse.request();
      }

      if (status.isGranted) {
        // use geolocator to get current position
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        setState(() {
           initialLatLng = LatLng(position.latitude, position.longitude);
           loadingLocation = false;
        });
      } else {
        // permission denied -> fallback to project default center
        setState(() {
           initialLatLng = defaultCenterCanSeeAllCities;
           loadingLocation = false;
        });
      }
    } catch (e) {
      // on error fallback to default
      Log.e('PickerLocationScreen - _setInitialCameraToCurrentLocation error: $e');
      setState(() {
         initialLatLng = defaultCenterCanSeeAllCities;
         loadingLocation = false;
      });
    }
  }



  ///---------------------------------------------------------- place search

  Future setThePlaceLocationToCameraGoogleMap( PlaceResult place ) async{
    Log.i("setThePlaceLocationToCameraGoogleMap() - place: ${place.description} "
        ", lat: ${place.lat} , lng: ${place.lng} " );

    // if the prediction contains lat/lng, move the camera to that location and update the marker
    if (place.lat != null && place.lng != null) {
      // prediction.lat/lng can be returned as String; parse to double safely
      final parsedLat = makeDouble( place.lat );
      final parsedLng = makeDouble( place.lng );
      if (parsedLat != null && parsedLng != null) {
        final newPos = LatLng(parsedLat, parsedLng);
        setState(() {
          initialLatLng = newPos;
          loadingLocation = false;
        });
        Log.i("setThePlaceLocationToCameraGoogleMap() - newPos: ${newPos} " );
        try {
          await mapController.animateCamera(CameraUpdate.newLatLngZoom(newPos, 16));
        } catch (e) {
          Log.i("map animate error: $e");
        }
      } else {
        Log.i("Failed to parse lat/lng from prediction: lat=${place.lat}, lng=${place.lng}");
      }
    }
  }

}