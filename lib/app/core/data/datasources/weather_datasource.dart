part of 'datasources.dart';

abstract class IWeatherDatasource {
  Future<List<LocationModel>> searchLocation(String location);
  Future<ForecastModel> getForecast(String location);
}

class WeatherDatasource implements IWeatherDatasource {
  WeatherDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<LocationModel>> searchLocation(String location) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/search.json',
        queryParameters: {
          'q': location,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data as List;
        return List<LocationModel>.from(
          data.map(LocationModel.fromJson).toList(),
        );
      }
    }
    throw Exception();
  }

  @override
  Future<ForecastModel> getForecast(String location) async {
    if (await AppUtils.userHasInternet()) {
      final response = await dio.get(
        '/forecast.json',
        queryParameters: {
          'q': location,
          'days': 14,
          'aqi': 'no',
          'alerts': 'no',
        },
      );
      if (response.statusCode == 200) {
        return ForecastModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      }
    }
    throw Exception();
  }
}
