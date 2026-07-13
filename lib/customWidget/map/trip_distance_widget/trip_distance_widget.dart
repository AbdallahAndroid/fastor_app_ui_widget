
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/resource/app_dimension.dart';
import 'package:fastor_app_ui_widget/core/services/location_service.dart';
import 'package:fastor_app_ui_widget/core/theme/app_text_styles.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripDistanceWidget extends StatefulWidget {

  LatLng startPoint;
  LatLng endPoint;

  TripDistanceWidget( {
    required this.startPoint,
    required this.endPoint
});

  @override
  State<TripDistanceWidget> createState() => _TripDistanceWidgetState();
}

class _TripDistanceWidgetState extends State<TripDistanceWidget> {

  LocalLocationService locationService = LocalLocationService();

  int? distanceKm;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var result = await locationService.getDistanceInKm(origin: widget.startPoint, destination: widget.endPoint);
      if (!mounted) {
        return;
      }
      setState(() {
        distanceKm = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return showTripDistance();
  }



  Widget showTripDistance() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundAllScreens,
        borderRadius: BorderRadius.circular(AppDimension.radiusCard),
      ),
      child: Row(
        children: [
          Icon(
            Icons.route_outlined,
            color: AppColors.textColor,
            size: 20.w,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
            //  AppString.transportationTripDistance.tr(),
              distanceKm != null ? '$distanceKm' :  "K".ar("K"),
              style: AppTextStyles.fontGrey,
            ),
          ),
          Text(
             "K",
            style: AppTextStyles.fontGrey,
          ),
        ],
      ),
    );
  }

}