part of 'models.dart';

class CurrentModel extends Current {
  const CurrentModel({
    required super.location,
    required super.tempC,
    required super.conditionText,
    required super.conditionIcon,
    required super.feelslikeC,
  });

  factory CurrentModel.fromJson(dynamic json) {
    return CurrentModel(
      location: json['location'] == null
          ? Location.empty()
          : LocationModel.fromJson(
              json['location'] as Map<String, dynamic>,
            ),
      tempC: json['temp_c'] == null
          ? ''
          : '${int.tryParse(json['temp_c'].toString().split('.').first) ?? 0}°',
      conditionText: json['condition']['text'] == null
          ? ''
          : json['condition']['text'].toString(),
      conditionIcon: json['condition']['icon'] == null
          ? ''
          : json['condition']['icon'].toString(),
      feelslikeC: json['feelslike_c'] == null
          ? ''
          : '${int.tryParse(json['feelslike_c'].toString().split('.').first) ?? 0}°',
    );
  }
}

extension CurrentMapper on CurrentModel {
  Current toEntity() {
    return Current(
      location: location,
      tempC: tempC,
      conditionText: conditionText,
      conditionIcon: conditionIcon,
      feelslikeC: feelslikeC,
    );
  }
}
