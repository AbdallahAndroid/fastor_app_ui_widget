
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/places/core/api_places_datasource.dart';
import 'package:fastor_app_ui_widget/customWidget/places/core/model/response_google_places.dart';
import 'package:fastor_app_ui_widget/customWidget/places/search_textfiled_google_places.dart';

extension GooglePlacesSearchController on SearchTextFiledGooglePlaces {

  /// Create a datasource instance with the API key
  ApiPlacesDatasource _getDatasource() {
    return ApiPlacesDatasource(apiKey: googleAPIKey);
  }

  /// Search for places using text query
  ///
  /// Delegates to ApiPlacesDatasource.searchPlaces
  /// Returns List<PlaceResult> with typed model objects
  Future<List<PlaceResult>?> performGoogleSearchPlaces(String textToSearch) async {
    if (textToSearch.isEmpty) {
      Log.i("GooglePlacesSearchController.performGoogleSearchPlaces - empty search text");
      return null;
    }

    final datasource = _getDatasource();
    return await datasource.searchPlaces(
      textQuery: textToSearch,
    );
  }



}

