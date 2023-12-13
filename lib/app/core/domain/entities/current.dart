part of 'entities.dart';

class Current extends Equatable {
  const Current({
    required this.location,
    required this.tempC,
    required this.conditionText,
    required this.conditionIcon,
    required this.feelslikeC,
  });

  factory Current.empty() {
    return Current(
      location: Location.empty(),
      tempC: '',
      conditionText: '',
      conditionIcon: '',
      feelslikeC: '',
    );
  }

  Current copyWith({
    Location? location,
    String? tempC,
    String? conditionText,
    String? conditionIcon,
    String? feelslikeC,
  }) {
    return Current(
      location: location ?? this.location,
      tempC: tempC ?? this.tempC,
      conditionText: conditionText ?? this.conditionText,
      conditionIcon: conditionIcon ?? this.conditionIcon,
      feelslikeC: feelslikeC ?? this.feelslikeC,
    );
  }

  final Location location;
  final String tempC;
  final String conditionText;
  final String conditionIcon;
  final String feelslikeC;

  @override
  List<Object?> get props => [
        location,
        tempC,
        conditionText,
        conditionIcon,
        feelslikeC,
      ];
}
