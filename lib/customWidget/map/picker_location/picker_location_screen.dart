
import 'package:fastor_app_ui_widget/core/constant/env.dart';
import 'package:fastor_app_ui_widget/core/lang/PositionedApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_decoration.dart';
import 'package:fastor_app_ui_widget/core/utils/KeyboardTools.dart';
import 'package:fastor_app_ui_widget/core/utils/device/DeviceTools.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/core/tablet_phone_size.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/core/utils/size/NotchBarSizeHelper.dart';
import 'package:fastor_app_ui_widget/customWidget/appbar/simple/AppBarSimple.dart';
import 'package:fastor_app_ui_widget/customWidget/button/ButtonApp.dart';
import 'package:fastor_app_ui_widget/customWidget/map/picker_location/logic/SetterInitPoisitonMapToCurrentLocation.dart';
import 'package:fastor_app_ui_widget/customWidget/map/picker_location/logic/previous_selected_logic.dart';
import 'package:fastor_app_ui_widget/customWidget/map/picker_location/widget/buttons_above_map.dart';
import 'package:fastor_app_ui_widget/customWidget/places/search_textfiled_google_places.dart';
import 'package:fastor_app_ui_widget/customWidget/scaffold/ScaffoldApp.dart';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/progressView/ProgressCircleApp.dart';
// import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart' as placesSdk;
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';

typedef PickerLocationOnComplete = Function( String lat, String lng );

class PickerLocationScreen extends StatefulWidget {


  final PickerLocationOnComplete onComplete;
  String? dataSelectedPreviousLat, dataSelectedPreviousLng;

  PickerLocationScreen( {
    this.dataSelectedPreviousLat,
    this.dataSelectedPreviousLng,
    required this.onComplete }   );

  @override
  PickerLocationScreenState createState() => PickerLocationScreenState();

}

class PickerLocationScreenState extends State<PickerLocationScreen> {

  //-------------------------------------------------------------- variable
  var controllerPlaces = TextEditingController();
  LatLng?  initialLatLng;
  LatLng? defaultCenterCanSeeAllCities = LatLng(30.5852, 36.2384);
  bool  loadingLocation = true;
  final Set<Marker> markers = {};
  MapType mapType = MapType.normal;

  // keep the last camera target during moves (avoid calling setState on every camera move)
  LatLng? _lastMapCenter;
  LatLng? latLngPreviousSelected;

  // add a map controller to animate camera when a place is selected
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    setInitialCameraToCurrentLocationOnCreateScreen();
  }

  //------------------------------------------------------------------ state

  @override
  Widget build(BuildContext context) {
    setMarkerPreviousSelectedLocation();
    return ScaffoldApp(
        appBarCustom:  AppBarSimple(  context, "Picker Location".tr(),
        ),
        body: SingleChildScrollView(child: bodyRealestateContentUI()),
        bottomSheet: buttonConfirm(  )
    );
  }

  //------------------------------------------------------------ body

  Widget bodyRealestateContentUI() {
    return Container(
      child:  Stack(
        children: [

          /// map
          SizedBox(
            width: DeviceTools.getWidth(context),
            height: DeviceTools.getHeightInsideSafeArea(context) - AppBarSimple.frameHeight ,
            child:       _contentGoogleMap(),
          ),

          /// center marker overlay (always shown at center of map)
          // Placed after map so it renders above it but below the search field
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                  size: 48.w,
                ),
              ),
            ),
          ),

          /// search field
          Container(
            margin: EdgeInsets.only(top: 16.h,
              left: 20.w,
              right: 20.w
            ),
            // color: Colors.amber,
            child: SearchTextFiledGooglePlaces(
                width: _getSearchFieldWidth( ) ,
                googleAPIKey: env.googleApiKeyPlaces ,
                controller: controllerPlaces,
              onPlaceSelected: ( place ){

                setThePlaceLocationToCameraGoogleMap(place);
              },
            ),
          ),

          PositionedApp.langApp(child: buttonChangeMapType(),  bottom: 194.h  , left: 16.w )  ,
          PositionedApp.langApp(child: buttonGoToCurrentLocation(), bottom: 124.h  , left: 16.w )  ,


        ],
      ),
    );
  }


  progressWhileLoadingDetail() {
    return Center(
      child: ProgressCircleApp(),
    );
  }


  Widget _contentGoogleMap() {

    // while we are fetching the device location, show a loading indicator
    if ( loadingLocation ||  initialLatLng == null) {
      return progressWhileLoadingDetail();
    }

    return  GoogleMap(
        markers: markers,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        myLocationButtonEnabled: false , //hide  "go to my location" button
        myLocationEnabled: true,
        indoorViewEnabled: true,
        compassEnabled: false,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,

        /// force camera to be north
        rotateGesturesEnabled: false,

        /// Allow zooming out to see entire country/region easily
        // minMaxZoomPreference: MinMaxZoomPreference( 4, 23 ),

        mapType:  mapType,
        initialCameraPosition: CameraPosition(
          target:  latLngPreviousSelected??initialLatLng!,
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;

        },
        // track camera movement to keep the center marker logically linked to the map center
        onCameraMove: (CameraPosition position) {
          // update internal last center; avoid calling setState here because it is called frequently
          _lastMapCenter = position.target;
        },
        onCameraIdle: () {
          // when camera stops moving, update the selected coordinates shown/used by the screen
          if (_lastMapCenter != null) {
            setState(() {
              initialLatLng = _lastMapCenter;
            });
          }
        },
      onTap: (latLng) async {
        Log.i( "_contentGoogleMap() - onTap - latLng: $latLng"    );
        initialLatLng = latLng;
        await mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));
      },


    );
  }


  // searchFiledPlaces() {
  //   return Theme(
  //
  //     /// fix text selected background by cursor in text field
  //     data: Theme.of(context).copyWith(
  //       textSelectionTheme: TextSelectionThemeData(
  //         selectionColor: AppColor.textFieldCursorSelectedTextBackground,
  //         cursorColor: AppColor.textFieldCursorColor,
  //         selectionHandleColor: AppColor.primary,
  //       ),
  //     ),
  //     child: GooglePlaceAutoCompleteTextField(
  //       textEditingController: controllerPlaces,
  //       googleAPIKey: env.googleApiKeyPlaces ,
  //       inputDecoration: InputDecoration(
  //         filled: true ,
  //         fillColor: AppColor.textFieldBackground,
  //         contentPadding: EdgeInsets.symmetric( vertical: 12.h , horizontal: 16.w  ),
  //         hintText: "Search location".tr(),
  //         hintStyle: TextStyle( fontSize: 12.sp , color: AppColor.textFieldHint  ),
  //         border: _defaultBoarderTextField(),
  //         enabledBorder: _defaultBoarderTextField(),
  //         focusedBorder: _defaultBoarderTextField(),
  //         errorBorder: _defaultBoarderTextField(),
  //         focusedErrorBorder: _defaultBoarderTextField(),
  //
  //       ),
  //       debounceTime: 800 ,// default 600 ms,
  //       countries:  env.placesSearchByTextFilterByCountries, // 🇯🇴 Jordan + 🇪🇬 Egypt >> ["jo", "eg"]
  //       isLatLngRequired:true,// if you required coordinates from place detail
  //       getPlaceDetailWithLatLng: (Prediction prediction) async {
  //         // this method will return latlng with place detail
  //         Log.i("searchFiledPlaces() - lat " + prediction.lng.toString());
  //         await ToolsKeyboard.dismiss(context);
  //         await setThePlaceLocationToCameraGoogleMap(prediction);
  //       }, // this callback is called when isLatLngRequired is true
  //       itemClick: (Prediction prediction) async {
  //         // controllerPlaces.text = prediction.description ??"";
  //         // controllerPlaces.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description?.length??0));
  //         Log.i("searchFiledPlaces() - item click" + prediction.description.toString());
  //         await ToolsKeyboard.dismiss(context);
  //       },
  //       // if we want to make custom list item builder
  //       itemBuilder: (context, index, Prediction prediction) {
  //           return Container(
  //             padding: EdgeInsets.all(10),
  //             child: Row(
  //               children: [
  //                 Icon(Icons.location_on, color: AppColor.black, size: 24.w,),
  //                 SizedBox(
  //                   width: 7.w ,
  //                 ),
  //                 Expanded(child: TextApp("${prediction.description??""}", fontSize: 12.sp , color: AppColor.black,))
  //               ],
  //             ),
  //           );
  //   },
  //   // if you want to add seperator between list items
  //   seperatedBuilder: Divider(),
  //   // want to show close icon
  //     isCrossBtnShown: true,
  //     containerHorizontalPadding: 0,
  //
  //   // place type
  //   // placeType: PlaceType.geocode, // default is geocode
  //   // keyboard type (defaults to TextInputType.streetAddress)
  //     keyboardType: TextInputType.text, // optional - defaults to streetAddress for better address input
  //
  //   ),
  //   );
  // }

  // OutlineInputBorder _defaultBoarderTextField() {
  //   return  OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular( AppDimension.textFieldRadiusBoarder)),
  //       borderSide: BorderSide( color: AppColor.textFieldBoarder, width: 1)
  //   );
  // }

  ///-------------------------------------------------------- button confirm



  Widget buttonConfirm( ) {
    return Container(
      width: DeviceTools.getWidth(context),
      height: 72.hr ,


      /// fix for make ui above notch bar in android devices system bar
      margin: EdgeInsets.only(bottom:   NotchBarSizeHelper.getBottom(context ) ),

      decoration: AppDecoration.navigationBottom(),
      padding: EdgeInsets.symmetric( horizontal:  8.w, vertical: 8.hr  ),
      child: ButtonApp(
        "Confirm Location".tr(),
            showProgress: loadingLocation,
            (){
          // return selected coordinates if available
          if (initialLatLng == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No location selected".tr())));
            return;
          }

          widget.onComplete(initialLatLng!.latitude.toString(), initialLatLng!.longitude.toString());
          ToolsKeyboard.dismiss(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  double _getSearchFieldWidth() {
    /// case : tablet
     if(DeviceTools.isLandscapeOrSemiBox(context) )return 300.w;

    /// case: mobile
    return DeviceTools.getWidth(context) - 40.w;
  }





}