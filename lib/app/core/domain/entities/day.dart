part of 'entities.dart';

class Day extends Equatable {
  const Day({
    required this.date,
    required this.maxtempC,
    required this.mintempC,
    required this.conditionText,
    required this.conditionIcon,
    required this.hours,
  });

  factory Day.empty() {
    return Day(
      date: '',
      maxtempC: '',
      mintempC: '',
      conditionText: '',
      conditionIcon: '',
      hours: List.empty(),
    );
  }

  Day copyWith({
    String? date,
    String? maxtempC,
    String? mintempC,
    String? conditionText,
    String? conditionIcon,
    List<Hour>? hours,
  }) {
    return Day(
      date: date ?? this.date,
      maxtempC: maxtempC ?? this.maxtempC,
      mintempC: mintempC ?? this.mintempC,
      conditionText: conditionText ?? this.conditionText,
      conditionIcon: conditionIcon ?? this.conditionIcon,
      hours: hours ?? this.hours,
    );
  }

  final String date;
  final String maxtempC;
  final String mintempC;
  final String conditionText;
  final String conditionIcon;
  final List<Hour> hours;

  @override
  List<Object?> get props => [
        date,
        maxtempC,
        mintempC,
        conditionText,
        conditionIcon,
        hours,
      ];
}
