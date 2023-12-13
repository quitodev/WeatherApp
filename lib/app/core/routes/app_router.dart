import 'package:go_router/go_router.dart';
import 'package:weather_app/app/core/domain/entities/entities.dart';
import 'package:weather_app/app/core/presentation/widgets/widgets.dart';
import 'package:weather_app/app/core/utils/utils.dart';
import 'package:weather_app/app/features/forecast/forecast.dart';
import 'package:weather_app/app/features/locations/locations.dart';
import 'package:weather_app/app/features/splash/splash.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Routes.routeSplash.path,
    routes: [
      _getSplashRoutes(),
      _getLocationsRoutes(),
    ],
  );

  static GoRoute _getSplashRoutes() {
    return GoRoute(
      name: Routes.routeSplash.name,
      path: Routes.routeSplash.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const SplashPage(),
        );
      },
    );
  }

  static GoRoute _getLocationsRoutes() {
    return GoRoute(
      name: Routes.routeLocations.name,
      path: Routes.routeLocations.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: const LocationsPage(),
        );
      },
      routes: [
        _getForecastRoutes(),
      ],
    );
  }

  static GoRoute _getForecastRoutes() {
    return GoRoute(
      name: Routes.routeForecast.name,
      path: Routes.routeForecast.path,
      pageBuilder: (_, state) {
        return CustomSlideTransition(
          key: state.pageKey,
          child: ForecastPage(
            forecast: state.extra! as Forecast,
          ),
        );
      },
    );
  }
}
