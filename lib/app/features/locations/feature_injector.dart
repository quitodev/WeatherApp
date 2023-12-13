import 'package:weather_app/app/features/locations/domain/usecases/usecases.dart';
import 'package:weather_app/injection_container.dart';

Future<void> initLocationsDependencies() async {
  getIt
    ..registerLazySingleton<SearchLocation>(
      () => SearchLocation(getIt.call()),
    )
    ..registerLazySingleton<GetForecast>(
      () => GetForecast(getIt.call()),
    );
}
