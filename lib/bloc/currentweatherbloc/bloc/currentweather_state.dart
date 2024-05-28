// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'currentweather_bloc.dart';

abstract class CurrentweatherState extends Equatable {
  const CurrentweatherState();
  
  @override
  List<Object> get props => [];
}
class ActionCurrentWeatherState extends CurrentweatherState{}
class CurrentweatherInitial extends CurrentweatherState {}

class CurrentWeatherLoadingState extends CurrentweatherState{}

class CurrentWeatherSuccessState extends CurrentweatherState {
  final CurrentWeather current;
  const CurrentWeatherSuccessState({
    required this.current,
  });

  
}


class CurrentWeatherErrorState extends CurrentweatherState {
 
  final String error;
  const CurrentWeatherErrorState({
    required this.error,
  });
}
