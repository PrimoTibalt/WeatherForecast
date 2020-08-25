import 'package:weather/Models/Weather/WeatherModel.dart';

import 'WeatherState.dart';

class WeatherIsLoaded extends WeatherState {
  final List<WeatherModel> _weather;

  WeatherIsLoaded(this._weather);

  List<WeatherModel> get getWeather {
    return this._weather;
  }

  @override
  List<Object> get props => [this._weather];
}
