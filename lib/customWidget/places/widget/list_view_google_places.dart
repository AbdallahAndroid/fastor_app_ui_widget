
import 'package:fastor_app_ui_widget/core/resource/ColorProject.dart';
import 'package:fastor_app_ui_widget/core/utils/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/places/core/model/response_google_places.dart';
import 'package:fastor_app_ui_widget/customWidget/text/TextApp.dart';
import 'package:flutter/material.dart';

/// Callback when a place is selected from the list
typedef OnPlaceItemSelected = Function(PlaceResult place);

/// ListView widget to display Google Places search results
class ListViewGooglePlaces extends StatelessWidget {
  final List<PlaceResult> searchResults;
  final OnPlaceItemSelected onPlaceSelected;

  const ListViewGooglePlaces({
    Key? key,
    required this.searchResults,
    required this.onPlaceSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: searchResults.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: AppColors.textFieldBoarder,
      ),
      itemBuilder: (context, index) {
        final place = searchResults[index];
        return _buildPlaceItem(place);
      },
    );
  }

  Widget _buildPlaceItem(PlaceResult place) {
    return ListTile(
      dense: true,
      leading: Icon(
        Icons.location_on,
        color: AppColors.primary,
        size: 20.0.w,
      ),
      title: TextApp(
        place.mainText,
        fontSize: 14.0.sp,
        color: AppColors.textFieldText,
      ),
      subtitle: place.secondaryText.isNotEmpty
          ? TextApp(
              place.secondaryText,
              fontSize: 12.0.sp,
              color: AppColors.textFieldHint,
            )
          : null,
      onTap: ()  {
        Log.i("_buildPlaceItem() - onTap selected place: ${place.description}");
        onPlaceSelected(place);
      } ,
    );
  }
}
