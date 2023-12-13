import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/domain/entities/entities.dart';
import 'package:weather_app/app/core/utils/utils.dart';
import 'package:weather_app/app/features/locations/domain/usecases/usecases.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit({
    required SearchLocation searchLocation,
    required GetForecast getForecast,
  })  : _searchLocation = searchLocation,
        _getForecast = getForecast,
        super(
          LocationsState(
            status: LocationsInitial(),
            locations: List.empty(),
            forecast: Forecast.empty(),
          ),
        );

  final SearchLocation _searchLocation;
  final GetForecast _getForecast;

  void _showLoading() {
    emit(
      state.copyWith(
        status: LocationsLoading(),
      ),
    );
  }

  void _showError(Failure failure) {
    emit(
      state.copyWith(
        status: LocationsError(
          failure.message,
        ),
      ),
    );
  }

  Future<void> searchLocation(String location) async {
    final either = await _searchLocation.call(
      '${location[0].toUpperCase()}${location.substring(1).toLowerCase()}',
    );
    either.fold(
      (failure) => _showError(failure),
      (result) async {
        emit(
          state.copyWith(
            status: LocationsLoaded(),
            locations: result,
          ),
        );
      },
    );
  }

  Future<void> selectLocation(String location) async {
    _showLoading();
    final either = await _getForecast.call(location);
    either.fold(
      (failure) => _showError(failure),
      (result) async {
        emit(
          state.copyWith(
            status: LocationSelected(),
            forecast: result,
          ),
        );
      },
    );
  }
}
