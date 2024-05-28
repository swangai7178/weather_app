// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'days_forecast_bloc.dart';

sealed class DaysForecastEvent extends Equatable {
  const DaysForecastEvent();

  @override
  List<Object> get props => [];
}


class DayInitializeForecast extends DaysForecastEvent {
  final String location;
  const DayInitializeForecast({
    required this.location,
  });

  @override
  bool operator ==(covariant DayInitializeForecast other) {
    if (identical(this, other)) return true;
  
    return 
      other.location == location;
  }

  @override
  int get hashCode => location.hashCode;

  DayInitializeForecast copyWith({
    String? location,
  }) {
    return DayInitializeForecast(
      location: location ?? this.location,
    );
  }

  @override
  String toString() => 'DayInitializeForecast(location: $location)';
}
