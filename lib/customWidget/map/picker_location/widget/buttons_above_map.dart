import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/effect/icon/glass_shadow/icon_effect_shadow_and_glass_widget.dart';
import 'package:fastor_app_ui_widget/customWidget/map/picker_location/picker_location_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

extension  ButtonsAboveMap on PickerLocationScreenState {
  ///-------------------------------------------------------- map type


  buttonChangeMapType(){
    return IconEffectShadowAndGlassWidget(
      radiusSize: 50.r,
      colorBackground: AppColors.whiteTransparent,
      assetName: "assets/icons/satatlite_figma.png",
      // assetName: "assets/images/satellite_waves_${LangApp.activeLanguageCode}.png",
      // color: cubit!.mapType == MapType.normal ? AppColor.textColor : AppColor.primaryDark,
      containerSize: AppDimension.iconContainer,
      sizeIcon: AppDimension.icon,
      onTap: (){
        changeMapType();
      },
    );
  }

  void changeMapType(){
    if(  mapType == MapType.normal ) {
      mapType = MapType.satellite;
    } else  if(  mapType == MapType.satellite ) {
      mapType = MapType.normal;
    }
    setState(() {

    });
  }

  ///-------------------------------------------------------- go to current location

  buttonGoToCurrentLocation(){
    return IconEffectShadowAndGlassWidget(
      radiusSize: 50.r,
      colorBackground: AppColors.iconGlassBackgroundWhiteTransparent,
      assetName: "assets/icons/gps.png",
      containerSize: AppDimension.iconContainer,
      sizeIcon: AppDimension.icon,
      onTap: (){
        clickGoToCurrentLocation();
      },
    );
  }

  Future<void> clickGoToCurrentLocation() async {
    final permissionStatus = await Permission.location.request();
    Log.i('clickGoToCurrentLocation() - permissionStatus: $permissionStatus');
    if (permissionStatus.isGranted) {
      var  currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      Log.i('clickGoToCurrentLocation() - currentLocation: ${ currentLocation}');
      if(  currentLocation == null ) return;
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(
            LatLng( currentLocation!.latitude,  currentLocation!.longitude),
            16
        ),
      );
    } else {
      // Handle permission denied
      Log.i('clickGoToCurrentLocation() - Location permission denied');
      await Permission.locationWhenInUse.request();
    }
  }


}