import 'package:bloc/bloc.dart';
import 'package:weather_app/app/core/domain/entities/entities.dart';

class ForecastCubit extends Cubit<Day> {
  ForecastCubit({
    required Day day,
  }) : super(day);

  void selectDay(Day daySelected) {
    emit(daySelected);
  }
}
