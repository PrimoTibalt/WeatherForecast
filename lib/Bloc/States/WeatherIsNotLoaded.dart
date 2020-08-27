import 'WeatherState.dart';

class WeatherIsNotLoaded extends WeatherState {
  final error;

  WeatherIsNotLoaded(this.error);
}
