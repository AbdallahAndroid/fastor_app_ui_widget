
import 'package:fastor_app_ui_widget/core/network/parse/ApiParserApp.dart';
import 'package:fastor_app_ui_widget/customWidget/map/picker_location/picker_location_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension PreviousSelectedLogic on PickerLocationScreenState {

  void setMarkerPreviousSelectedLocation() {
    if( widget.dataSelectedPreviousLat == null ) return;
    if( widget.dataSelectedPreviousLng == null ) return;
    // remove previous)
    // build marker set using the initial location as a marker (optional - we keep it)
    latLngPreviousSelected = LatLng( makeDouble(widget.dataSelectedPreviousLat ), makeDouble( widget.dataSelectedPreviousLng ));
    markers.add(Marker(
      markerId: MarkerId('selected_location'),
      position:  latLngPreviousSelected! ,)
    ) ;
  }

}