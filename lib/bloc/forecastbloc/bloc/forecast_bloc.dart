import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/models/forecastmodel.dart';
import 'package:weather_app/service/weatherservice.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  ForecastBloc() : super(ForecastInitial()) {
    on<ForeCastInitialize>(getForecastingdata);
  }

  FutureOr<void> getForecastingdata(ForeCastInitialize event, Emitter<ForecastState> emit)async {
    emit(ForeCastLoadingState());
    try {
      var data = await WeatherService.getweatherforecast(event.location, event.day); 

      var currentforecastWeather = ForeCast.fromJson(data);

      emit(ForeCastingSuccessState(foreCast:currentforecastWeather ));

    } catch (e) {
      emit(ForeCastingErrorState(error: e.toString()));
    }

  }
}
