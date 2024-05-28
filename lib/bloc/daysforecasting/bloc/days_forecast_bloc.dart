import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/models/forecastmodel.dart';
import 'package:weather_app/service/weatherservice.dart';

part 'days_forecast_event.dart';
part 'days_forecast_state.dart';

class DaysForecastBloc extends Bloc<DaysForecastEvent, DaysForecastState> {
  DaysForecastBloc() : super(DaysForecastInitial()) {
    on<DayInitializeForecast>(getDaysForeCasting);
  }

  FutureOr<void> getDaysForeCasting(DayInitializeForecast event, Emitter<DaysForecastState> emit)async {
     emit(DaysForecastLoadingSate());
    try {
      var data = await WeatherService.getweatherforecastdays(event.location); 

      var currentforecastWeather = ForeCast.fromJson(data);

      emit(DayForeCastSucessState(foreCast:currentforecastWeather ));

    } catch (e) {
      emit(DayForeCastErrorState(error: e.toString())); 
    }
  }
}
