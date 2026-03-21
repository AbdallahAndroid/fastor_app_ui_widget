import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreview extends StatelessWidget {

  LatLng? latLng;
  GestureTapCallback  onTap;

  MapPreview( { required this.latLng, required this.onTap} );


  @override
  Widget build(BuildContext context) {
      if(latLng == null  )  return SizedBox();
      return GoogleMap(

        markers: {
          Marker(
            markerId: MarkerId('adsMarker'),
            position: latLng!,
            // icon: BitmapDescriptor.defaultMarker, // not necessary, default anyway
          )
        },
        zoomControlsEnabled: false,  //hide button + - for zooming
        initialCameraPosition:  CameraPosition(
            target: latLng!,
            zoom: 14 ),
        zoomGesturesEnabled: false , /// preview only map
        myLocationButtonEnabled: false, // Hide "go to my location" button
        myLocationEnabled: false,
        indoorViewEnabled: true,
        compassEnabled: false,
        scrollGesturesEnabled: false , /// preview only map
        tiltGesturesEnabled: false,

        /// force camera to be north
        rotateGesturesEnabled: false,

        /// min camera avoid zarka city to go to city balka in jordon
        minMaxZoomPreference: MinMaxZoomPreference( 23, 23 ),

        onTap: (LatLng position) {
          // Do nothing on tap to prevent camera movement
          onTap();
        },

      );
    }

  }