part of 'entities.dart';

class Hour extends Equatable {
  const Hour({
    required this.time,
    required this.tempC,
    required this.conditionText,
    required this.conditionIcon,
    required this.feelslikeC,
  });

  factory Hour.empty() {
    return const Hour(
      time: '',
      tempC: '',
      conditionText: '',
      conditionIcon: '',
      feelslikeC: '',
    );
  }

  Hour copyWith({
    String? time,
    String? tempC,
    String? conditionText,
    String? conditionIcon,
    String? feelslikeC,
  }) {
    return Hour(
      time: time ?? this.time,
      tempC: tempC ?? this.tempC,
      conditionText: conditionText ?? this.conditionText,
      conditionIcon: conditionIcon ?? this.conditionIcon,
      feelslikeC: feelslikeC ?? this.feelslikeC,
    );
  }

  final String time;
  final String tempC;
  final String conditionText;
  final String conditionIcon;
  final String feelslikeC;

  @override
  List<Object?> get props => [
        time,
        tempC,
        conditionText,
        conditionIcon,
        feelslikeC,
      ];
}
