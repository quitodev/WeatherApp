part of 'locations_cubit.dart';

class LocationsState extends Equatable {
  const LocationsState({
    required this.status,
    required this.locations,
    required this.forecast,
  });

  final LocationsStatus status;
  final List<Location> locations;
  final Forecast forecast;

  LocationsState copyWith({
    LocationsStatus? status,
    List<Location>? locations,
    Forecast? forecast,
  }) {
    return LocationsState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
      forecast: forecast ?? this.forecast,
    );
  }

  @override
  List<Object> get props => [
        status,
        locations,
        forecast,
      ];
}

abstract class LocationsStatus {}

class LocationsInitial extends LocationsStatus {}

class LocationsLoading extends LocationsStatus {}

class LocationsLoaded extends LocationsStatus {}

class LocationSelected extends LocationsStatus {}

class LocationsError extends LocationsStatus {
  LocationsError(this.text);

  final String text;
}
