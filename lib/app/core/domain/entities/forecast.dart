part of 'entities.dart';

class Forecast extends Equatable {
  const Forecast({
    required this.location,
    required this.current,
    required this.days,
  });

  factory Forecast.empty() {
    return Forecast(
      location: Location.empty(),
      current: Current.empty(),
      days: List.empty(),
    );
  }

  Forecast copyWith({
    Location? location,
    Current? current,
    List<Day>? days,
  }) {
    return Forecast(
      location: location ?? this.location,
      current: current ?? this.current,
      days: days ?? this.days,
    );
  }

  final Location location;
  final Current current;
  final List<Day> days;

  @override
  List<Object?> get props => [
        location,
        current,
        days,
      ];
}
