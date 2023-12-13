part of 'models.dart';

class DayModel extends Day {
  const DayModel({
    required super.date,
    required super.maxtempC,
    required super.mintempC,
    required super.conditionText,
    required super.conditionIcon,
    required super.hours,
  });

  factory DayModel.fromJson(dynamic json) {
    return DayModel(
      date:
          json['date'] == null ? '' : json['date'].toString().substring(8, 10),
      maxtempC: json['day']['maxtemp_c'] == null
          ? ''
          : '${int.tryParse(json['day']['maxtemp_c'].toString().split('.').first) ?? 0}°',
      mintempC: json['day']['mintemp_c'] == null
          ? ''
          : '${int.tryParse(json['day']['mintemp_c'].toString().split('.').first) ?? 0}°',
      conditionText: json['day']['condition']['text'] == null
          ? ''
          : json['day']['condition']['text'].toString(),
      conditionIcon: json['day']['condition']['icon'] == null
          ? ''
          : json['day']['condition']['icon'].toString(),
      hours: json['hour'] == null
          ? List.empty()
          : List.from(
              (json['hour'] as List).map(
                (hour) => HourModel.fromJson(
                  hour as Map<String, dynamic>,
                ),
              ),
            ),
    );
  }
}

extension DayMapper on DayModel {
  Day toEntity() {
    return Day(
      date: date,
      maxtempC: maxtempC,
      mintempC: mintempC,
      conditionText: conditionText,
      conditionIcon: conditionIcon,
      hours: hours,
    );
  }
}
