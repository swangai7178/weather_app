// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'days_forecast_bloc.dart';

sealed class DaysForecastState extends Equatable {
  const DaysForecastState();
  
  @override
  List<Object> get props => [];
}

abstract class ActionStateForeDaysCasting extends DaysForecastState{}

class DaysForecastInitial extends DaysForecastState {}

class DaysForecastLoadingSate extends DaysForecastState{}

class DayForeCastSucessState extends DaysForecastState {
  final ForeCast foreCast;
  const DayForeCastSucessState({
    required this.foreCast,
  });


 
}

class DayForeCastErrorState extends DaysForecastState {
  final String error;
  const DayForeCastErrorState({
    required this.error,
  });

  @override
  String toString() => 'DayForeCastErrorState(error: $error)';
}
