import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app/core/feature_injector.dart';
import 'package:weather_app/app/core/utils/utils.dart';
import 'package:weather_app/app/features/locations/feature_injector.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await initServices();
  await initCoreDependencies();
  await initLocationsDependencies();
}

Future<void> initServices() async {
  getIt
    ..registerLazySingleton(
      Connectivity.new,
    )
    ..registerLazySingleton(
      () => Dio(
        BaseOptions(
          baseUrl: Api.baseUrl,
          queryParameters: {
            'key': Api.key,
          },
        ),
      ),
    );
}
