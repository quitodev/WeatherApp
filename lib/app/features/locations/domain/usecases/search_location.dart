part of 'usecases.dart';

class SearchLocation {
  SearchLocation(this.weatherRepository);

  final IWeatherRepository weatherRepository;

  Future<Either<Failure, List<Location>>> call(String location) async {
    return weatherRepository.searchLocation(location);
  }
}
