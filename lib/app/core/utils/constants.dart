part of 'utils.dart';

class Api {
  static const String baseUrl = 'http://api.weatherapi.com/v1';
  static const String key = '6884904594f947efa3f123419231212';
}

class Repositories {
  static const String repositoryWeather = 'Weather Repository';
}

class Errors {
  static const String errorNetwork =
      'There was an error, check your connection please!';
}

class Routes {
  static final RouteData routeSplash = RouteData(
    'splash',
    '/',
  );
  static final RouteData routeLocations = RouteData(
    'locations',
    '/locations',
  );
  static final RouteData routeForecast = RouteData(
    'forecast',
    'forecast',
  );
}

class RouteData {
  RouteData(this.name, this.path);

  final String name;
  final String path;
}

class AppImages {
  static const String background = 'assets/images/background.jpg';
  static const String logo = 'assets/images/logo.png';
}
