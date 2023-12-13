part of 'models.dart';

class HourModel extends Hour {
  const HourModel({
    required super.time,
    required super.tempC,
    required super.conditionText,
    required super.conditionIcon,
    required super.feelslikeC,
  });

  factory HourModel.fromJson(dynamic json) {
    return HourModel(
      time:
          json['time'] == null ? '' : json['time'].toString().substring(11, 16),
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

extension HourMapper on HourModel {
  Hour toEntity() {
    return Hour(
      time: time,
      tempC: tempC,
      conditionText: conditionText,
      conditionIcon: conditionIcon,
      feelslikeC: feelslikeC,
    );
  }
}
