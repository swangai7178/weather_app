// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'currentweather_bloc.dart';

abstract class CurrentweatherEvent extends Equatable {
  const CurrentweatherEvent();

  @override
  List<Object> get props => [];
}

class InitializeWeatherEvent extends CurrentweatherEvent {
  final String  city;
  const InitializeWeatherEvent({
    required this.city,
  });

  @override
  bool operator ==(covariant InitializeWeatherEvent other) {
    if (identical(this, other)) return true;
  
    return 
      other.city == city;
  }

  @override
  int get hashCode => city.hashCode;
}
