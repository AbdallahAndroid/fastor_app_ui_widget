
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/services/location_service.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreviewRoutesBetweenTwoPointsWidget extends StatefulWidget {

   double zoomCamera ;
  LatLng  startPoint;
  LatLng  endPoint;
  double height;

  /// assets name
  String markerA, markerB;


  MapPreviewRoutesBetweenTwoPointsWidget( {
    required this.startPoint,
    required this.endPoint,
    required this.height,
    required this.zoomCamera,
    required this.markerA,
    required this.markerB
});

  @override
  State<MapPreviewRoutesBetweenTwoPointsWidget> createState() => _MapPreviewRoutesBetweenTwoPointsWidgetState();
}

class _MapPreviewRoutesBetweenTwoPointsWidgetState extends State<MapPreviewRoutesBetweenTwoPointsWidget> {

  final LocalLocationService _locationService = LocalLocationService();
  LatLng? _currentLocation;
  bool _isLoadingCurrentLocation = false;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  BitmapDescriptor? _markerIconA;
  BitmapDescriptor? _markerIconB;

  LatLng? mapCenter;

  @override
  void initState() {
    mapCenter = widget.startPoint;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if( !mounted ) return;
      await _loadMarkerIcons();
      _downloadRouteDirection();
      _setMapCenterFromTwoPoints();
    });
  }


  void _setMapCenterFromTwoPoints()async  {
    mapCenter = await  _locationService.getCenterBetweenTwoPoints( widget.startPoint, widget.endPoint);
  }


  Future<void> _loadMarkerIcons() async {
    if( !mounted ) return;
    var imageConfiguration = ImageConfiguration(devicePixelRatio: MediaQuery.of(context).devicePixelRatio);
    _markerIconA = await BitmapDescriptor.asset(imageConfiguration,  widget.markerA);
    _markerIconB = await BitmapDescriptor.asset(imageConfiguration,  widget.markerB);
  }


  Future<void> _downloadRouteDirection() async {
    var origin = widget.startPoint  ;
    var destination = widget.endPoint;
    if( origin == null || destination == null ) return;

    var routePoints = await _locationService.generateRoutesDirection(origin: origin, destination: destination);
    if( !mounted || routePoints.isEmpty ) return;

    setState(() {
      _markers
        ..clear()
        ..addAll([
          Marker(markerId: const MarkerId('startPoint'), position: origin, icon: _markerIconA ?? BitmapDescriptor.defaultMarker),
          Marker(markerId: const MarkerId('endPoint'), position: destination, icon: _markerIconB ?? BitmapDescriptor.defaultMarker),
        ]);
      _polylines
        ..clear()
        ..add(Polyline(
          polylineId: const PolylineId('routeDirection'),
          points: routePoints,
          color: AppColors.primary,
          width: 4,
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    if( _isLoadingCurrentLocation ) {
      return SizedBox(
        width: double.infinity,
        height: widget.height,
        child: ProgressCircleApp(),
      );
    }

    /// case not failed download location current
      mapCenter = widget.startPoint ?? _currentLocation;
    if(mapCenter == null ) return SizedBox(
      width: double.infinity,
      height: widget.height ,
    );


    return _googleMap();
  }


  Widget _googleMap() {
    Log.i("_googleMap() - startPoint: ${widget.startPoint} /mapCenter: $mapCenter");

    return Container(
      height: widget.height,
      width: double.infinity,
      color: AppColors.backgroundAllScreens,
      child: GoogleMap(
        zoomControlsEnabled: false,  //hide button + - for zooming
        zoomGesturesEnabled: true , /// allow see routes
        scrollGesturesEnabled: true  , /// allow see routes only map
        myLocationButtonEnabled: true , // Hide "go to my location" button
        myLocationEnabled: true ,
        indoorViewEnabled: true,
        compassEnabled: true ,
        tiltGesturesEnabled: false,

        /// force camera to be north
        rotateGesturesEnabled: false,
        minMaxZoomPreference: MinMaxZoomPreference( widget.zoomCamera, widget.zoomCamera ),
        initialCameraPosition:  CameraPosition(
            target: mapCenter!,
            zoom: widget.zoomCamera ),
        markers: _markers,
        polylines: _polylines,

      ),

    );
  }


}
