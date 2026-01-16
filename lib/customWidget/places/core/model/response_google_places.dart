/// Model class for Google Places API v1 (New) responses
class ResponseGooglePlaces {
  final List<PlaceResult> places;

  ResponseGooglePlaces({required this.places});

  /// Create ResponseGooglePlaces from JSON
  factory ResponseGooglePlaces.fromJson(Map<String, dynamic> json) {
    final placesList = json['places'] as List?;

    return ResponseGooglePlaces(
      places: placesList != null
          ? placesList.map((place) => PlaceResult.fromJson(place)).toList()
          : [],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'places': places.map((place) => place.toJson()).toList(),
    };
  }
}

/// Individual place result from Google Places API
class PlaceResult {
  final String id;
  final String? formattedAddress;
  final PlaceLocation? location;
  final DisplayName? displayName;

  PlaceResult({
    required this.id,
    this.formattedAddress,
    this.location,
    this.displayName,
  });

  /// Create PlaceResult from JSON
  factory PlaceResult.fromJson(Map<String, dynamic> json) {
    return PlaceResult(
      id: json['id'] ?? '',
      formattedAddress: json['formattedAddress'],
      location: json['location'] != null
          ? PlaceLocation.fromJson(json['location'])
          : null,
      displayName: json['displayName'] != null
          ? DisplayName.fromJson(json['displayName'])
          : null,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'formattedAddress': formattedAddress,
      'location': location?.toJson(),
      'displayName': displayName?.toJson(),
    };
  }


  String getName(){
    if( displayName != null && displayName!.text.isNotEmpty ){
      return displayName!.text ;
    } else if( formattedAddress != null && formattedAddress!.isNotEmpty ){
      return formattedAddress! ;
    } else {
      return '' ;
    }
  }

  /// Get the main text (place name)
  String get mainText => displayName?.text ?? '';

  /// Get the secondary text (formatted address)
  String get secondaryText => formattedAddress ?? '';

  /// Get the description (formatted address or name)
  String get description =>
      formattedAddress?.isNotEmpty == true ? formattedAddress! : mainText;

  /// Get latitude
  double? get lat => location?.latitude;

  /// Get longitude
  double? get lng => location?.longitude;

  /// Convert to simple Map format (for backward compatibility)
  Map<String, dynamic> toSimpleMap() {
    return {
      'place_id': id,
      'description': description,
      'main_text': mainText,
      'secondary_text': secondaryText,
      'lat': lat,
      'lng': lng,
    };
  }
}

/// Location coordinates from Google Places API
class PlaceLocation {
  final double latitude;
  final double longitude;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
  });

  /// Create PlaceLocation from JSON
  factory PlaceLocation.fromJson(Map<String, dynamic> json) {
    return PlaceLocation(
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

/// Display name from Google Places API
class DisplayName {
  final String text;
  final String? languageCode;

  DisplayName({
    required this.text,
    this.languageCode,
  });

  /// Create DisplayName from JSON
  factory DisplayName.fromJson(Map<String, dynamic> json) {
    return DisplayName(
      text: json['text'] ?? '',
      languageCode: json['languageCode'],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'languageCode': languageCode,
    };
  }
}

/// Place details response model
class PlaceDetailsResponse {
  final String id;
  final String? formattedAddress;
  final PlaceLocation? location;
  final DisplayName? displayName;

  PlaceDetailsResponse({
    required this.id,
    this.formattedAddress,
    this.location,
    this.displayName,
  });

  /// Create PlaceDetailsResponse from JSON
  factory PlaceDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PlaceDetailsResponse(
      id: json['id'] ?? '',
      formattedAddress: json['formattedAddress'],
      location: json['location'] != null
          ? PlaceLocation.fromJson(json['location'])
          : null,
      displayName: json['displayName'] != null
          ? DisplayName.fromJson(json['displayName'])
          : null,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'formattedAddress': formattedAddress,
      'location': location?.toJson(),
      'displayName': displayName?.toJson(),
    };
  }

  /// Convert to simple Map format (for backward compatibility)
  Map<String, dynamic> toSimpleMap() {
    return {
      'lat': location?.latitude,
      'lng': location?.longitude,
      'formatted_address': formattedAddress ?? '',
      'name': displayName?.text ?? '',
    };
  }
}
