part of 'models.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.name,
    required super.region,
    required super.country,
  });

  factory LocationModel.fromJson(dynamic json) {
    return LocationModel(
      name: json['name'] == null ? '' : json['name'] as String,
      region: json['region'] == null ? '' : json['region'] as String,
      country: json['country'] == null ? '' : json['country'] as String,
    );
  }
}

extension LocationMapper on LocationModel {
  Location toEntity() {
    return Location(
      name: name,
      region: region,
      country: country,
    );
  }
}
