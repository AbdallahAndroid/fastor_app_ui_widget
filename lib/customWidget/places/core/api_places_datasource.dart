
import 'package:dio/dio.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/core/utils/log/Log.dart';
import 'package:fastor_app_ui_widget/customWidget/places/core/model/response_google_places.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Data source for Google Places API v1 (New)
/// Handles all HTTP requests to Google Places API endpoints
class ApiPlacesDatasource {
  final String apiKey;

  ApiPlacesDatasource({required this.apiKey});

  /// Creates a Dio instance with PrettyDioLogger for debugging
  Dio _createDio() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return dio;
  }

  /// Search for places using text query
  ///
  /// Google Places API v1 (New) - searchText endpoint
  ///
  /// [textQuery] - The text query to search for places
  /// [languageCode] - Optional language code (e.g., "ar" for Arabic). Defaults to active language
  ///
  /// Returns a list of PlaceResult objects
  ///
  /// Example response from Google API:
  /// ```json
  /// {
  ///   "places": [
  ///     {
  ///       "id": "ChIJbySZVNMVWBQRRYP5GfZ_MVY",
  ///       "formattedAddress": "عمان، قسم عين شمس، محافظة القاهرة\u202c، مصر",
  ///       "location": {
  ///         "latitude": 30.1284397,
  ///         "longitude": 31.3481412
  ///       },
  ///       "displayName": {
  ///         "text": "عمان",
  ///         "languageCode": "ar"
  ///       }
  ///     }
  ///   ]
  /// }
  /// ```
  Future<List<PlaceResult>?> searchPlaces({
    required String textQuery,
    String? languageCode,

  }) async {
    if (textQuery.isEmpty) {
      Log.i("ApiPlacesDatasource.searchPlaces - empty search text");
      return null;
    }

    try {
      final String baseUrl = 'https://places.googleapis.com/v1/places:searchText';

      final dio = _createDio();

      // Build request body
      final Map<String, dynamic> requestBody = {
        "textQuery": textQuery,
        "languageCode": languageCode ?? LangApp.activeLanguageCode,
      };


      final response = await dio.post(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'X-Goog-Api-Key': apiKey,
          'X-Goog-FieldMask': 'places.id,places.displayName,places.formattedAddress,places.location',
        }),
        data: requestBody,
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data['places'] != null) {
          // Parse response using ResponseGooglePlaces model
          final googlePlacesResponse = ResponseGooglePlaces.fromJson(data);
          final places = googlePlacesResponse.places;

          Log.i("ApiPlacesDatasource.searchPlaces - found ${places.length} results");

          // Return PlaceResult objects directly
          return places;
        } else {
          Log.e("ApiPlacesDatasource.searchPlaces - No places found in response");
          return null;
        }
      } else {
        Log.e("ApiPlacesDatasource.searchPlaces - HTTP error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      Log.e("ApiPlacesDatasource.searchPlaces - Exception: $e");
      return null;
    }
  }

  /// Get detailed information about a place by its ID
  ///
  /// Google Places API v1 (New) - Get Place Details
  ///
  /// [placeId] - The place ID (format: "places/{place_id}" or just "{place_id}")
  ///
  /// Returns place details with the following structure:
  /// ```
  /// {
  ///   "lat": 31.9539,
  ///   "lng": 35.9106,
  ///   "formatted_address": "Amman, Jordan",
  ///   "name": "Amman"
  /// }
  /// ```
  ///
  /// Note: With the new API v1, lat/lng is already included in searchPlaces results,
  /// so this method is optional and can be used if additional details are needed.
  Future<Map<String, dynamic>?> getPlaceDetails(String placeId) async {
    if (placeId.isEmpty) {
      Log.i("ApiPlacesDatasource.getPlaceDetails - empty place_id");
      return null;
    }

    try {
      // Ensure place ID has the correct format
      final String formattedPlaceId = placeId.startsWith('places/') ? placeId : 'places/$placeId';
      final String baseUrl = 'https://places.googleapis.com/v1/$formattedPlaceId';

      final dio = _createDio();
      final response = await dio.get(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'X-Goog-Api-Key': apiKey,
          'X-Goog-FieldMask': 'id,displayName,formattedAddress,location',
        }),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null) {
          final location = data['location'];
          final displayName = data['displayName'];

          Log.i("ApiPlacesDatasource.getPlaceDetails - placeId: $placeId, lat: ${location?['latitude']}, lng: ${location?['longitude']}");

          return {
            'lat': location?['latitude'],
            'lng': location?['longitude'],
            'formatted_address': data['formattedAddress'] ?? '',
            'name': displayName?['text'] ?? '',
          };
        } else {
          Log.e("ApiPlacesDatasource.getPlaceDetails - No data in response");
          return null;
        }
      } else {
        Log.e("ApiPlacesDatasource.getPlaceDetails - HTTP error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      Log.e("ApiPlacesDatasource.getPlaceDetails - Exception: $e");
      return null;
    }
  }

  /// Search for nearby places based on location
  ///
  /// [latitude] - Latitude of the center point
  /// [longitude] - Longitude of the center point
  /// [radius] - Search radius in meters (optional, defaults to 5000m = 5km)
  /// [type] - Place type to search for (optional, e.g., "restaurant", "hospital")
  ///
  /// This is a placeholder for future implementation using the Nearby Search endpoint
  Future<List<Map<String, dynamic>>?> searchNearbyPlaces({
    required double latitude,
    required double longitude,
    int radius = 5000,
    String? type,
  }) async {
    // TODO: Implement Nearby Search using Google Places API v1 (New)
    // Endpoint: https://places.googleapis.com/v1/places:searchNearby
    Log.i("ApiPlacesDatasource.searchNearbyPlaces - Not yet implemented");
    throw UnimplementedError('searchNearbyPlaces is not yet implemented');
  }
}
