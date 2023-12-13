part of 'repositories_impl.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  WeatherRepositoryImpl(this.weatherDatasource);

  final IWeatherDatasource weatherDatasource;

  @override
  Future<Either<Failure, List<LocationModel>>> searchLocation(
    String location,
  ) async {
    try {
      return Right(
        await weatherDatasource.searchLocation(location),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryWeather,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryWeather);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }

  @override
  Future<Either<Failure, ForecastModel>> getForecast(String location) async {
    try {
      return Right(
        await weatherDatasource.getForecast(location),
      );
    } on DioException catch (error) {
      log(
        '$error ${error.response?.data}',
        name: Repositories.repositoryWeather,
      );
      return Left(
        Failure(
          error.response != null && error.response!.statusCode == 400
              ? error.response!.data.toString()
              : Errors.errorNetwork,
        ),
      );
    } catch (error) {
      log(error.toString(), name: Repositories.repositoryWeather);
      return const Left(
        Failure(Errors.errorNetwork),
      );
    }
  }
}
