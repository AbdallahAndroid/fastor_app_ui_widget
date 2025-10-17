import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/intent/IntentTools.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapPreviewWidget extends StatelessWidget {

  double width;
  double height;
  LatLng latLng;
  String titleMarker;

  GoogleMapPreviewWidget({
    required this.width,
    required this.height,
    required this.latLng,
    required this.titleMarker
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppColor.grey,
      child:  GoogleMap(
        initialCameraPosition: CameraPosition(
          target:  latLng ,//
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId('preview'),
            position: latLng,
            infoWindow: InfoWindow(title:  titleMarker),
          ),
        },
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        scrollGesturesEnabled: false,
        zoomGesturesEnabled: false,
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,
        mapToolbarEnabled: false,
        onMapCreated: (GoogleMapController controller) {},
        onTap: ( c ){
          IntentTools.mapNavigation( latLng.latitude , latLng.longitude );
        },
      ),
    );
  }
}