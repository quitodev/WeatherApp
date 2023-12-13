part of 'repositories.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, List<Location>>> searchLocation(String location);
  Future<Either<Failure, Forecast>> getForecast(String location);
}
