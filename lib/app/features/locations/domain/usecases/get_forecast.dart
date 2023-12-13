part of 'usecases.dart';

class GetForecast {
  GetForecast(this.weatherRepository);

  final IWeatherRepository weatherRepository;

  Future<Either<Failure, Forecast>> call(String location) async {
    return weatherRepository.getForecast(location);
  }
}
