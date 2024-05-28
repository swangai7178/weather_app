// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forecast_bloc.dart';

sealed class ForecastState extends Equatable {
  const ForecastState();
  
  @override
  List<Object> get props => [];
}
abstract class ActionStateForeCast extends ForecastState{}

class ForecastInitial extends ForecastState {}

class ForeCastLoadingState extends ForecastState{

}

class ForeCastingSuccessState extends ForecastState {

  final ForeCast foreCast;
  const ForeCastingSuccessState({
    required this.foreCast,
  });

  @override
  String toString() => 'ForeCastingSuccessState(foreCast: $foreCast)';
}

class ForeCastingErrorState extends ForecastState {
  final String error;
  const ForeCastingErrorState({
    required this.error,
  });
  

  @override
  bool operator ==(covariant ForeCastingErrorState other) {
    if (identical(this, other)) return true;
  
    return 
      other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
