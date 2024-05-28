import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/models/currentweathermodel.dart';
import 'package:weather_app/service/weatherservice.dart';

part 'currentweather_event.dart';
part 'currentweather_state.dart';

class CurrentweatherBloc extends Bloc<CurrentweatherEvent, CurrentweatherState> {
  CurrentweatherBloc() : super(CurrentweatherInitial()) {
    on<InitializeWeatherEvent>(getCurrentWeatherdata);
  }

  FutureOr<void> getCurrentWeatherdata(InitializeWeatherEvent event, Emitter<CurrentweatherState> emit) async{
    emit(CurrentWeatherLoadingState());
    try {
    var data = await WeatherService.getweathercurrent(event.city); 
     print(data);

    var currentWeather = CurrentWeather.fromJson(data);

    emit(CurrentWeatherSuccessState(current: currentWeather));
   
    } catch (e) {
     emit(CurrentWeatherErrorState(error: e.toString()));
    }

  }
}
