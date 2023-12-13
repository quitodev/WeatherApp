import 'package:dio/dio.dart';
import 'package:weather_app/app/core/data/datasources/datasources.dart';
import 'package:weather_app/app/core/data/repositories/repositories_impl.dart';
import 'package:weather_app/app/core/domain/repositories/repositories.dart';
import 'package:weather_app/injection_container.dart';

Future<void> initCoreDependencies() async {
  getIt
    ..registerLazySingleton<IWeatherDatasource>(
      () => WeatherDatasource(
        dio: getIt<Dio>(),
      ),
    )
    ..registerLazySingleton<IWeatherRepository>(
      () => WeatherRepositoryImpl(getIt.call()),
    );
}
