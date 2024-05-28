// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forecast_bloc.dart';

sealed class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class ForeCastInitialize extends ForecastEvent {
  final String location;
  final String day;
  const ForeCastInitialize({
    required this.location,
    required this.day,
  });

  @override
  bool operator ==(covariant ForeCastInitialize other) {
    if (identical(this, other)) return true;
  
    return 
      other.location == location &&
      other.day == day;
  }

  @override
  int get hashCode => location.hashCode ^ day.hashCode;
}
