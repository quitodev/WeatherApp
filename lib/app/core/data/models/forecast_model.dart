part of 'models.dart';

class ForecastModel extends Forecast {
  const ForecastModel({
    required super.location,
    required super.current,
    required super.days,
  });

  factory ForecastModel.fromJson(dynamic json) {
    return ForecastModel(
      location: json['location'] == null
          ? Location.empty()
          : LocationModel.fromJson(
              json['location'] as Map<String, dynamic>,
            ),
      current: json['current'] == null
          ? Current.empty()
          : CurrentModel.fromJson(
              json['current'] as Map<String, dynamic>,
            ),
      days: json['forecast']['forecastday'] == null
          ? List.empty()
          : List.from(
              (json['forecast']['forecastday'] as List).map(
                (day) => DayModel.fromJson(
                  day as Map<String, dynamic>,
                ),
              ),
            ),
    );
  }
}

extension ForecastMapper on ForecastModel {
  Forecast toEntity() {
    return Forecast(
      location: location,
      current: current,
      days: days,
    );
  }
}
