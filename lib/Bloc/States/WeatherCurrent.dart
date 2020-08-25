import 'package:weather/Bloc/States/WeatherIsLoaded.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';

class WeatherCurrent extends WeatherIsLoaded {
  WeatherCurrent(List<WeatherModel> weather) : super(weather);

  @override
  List<WeatherModel> get getWeather {
    final List<WeatherModel> currentWeather = [];
    currentWeather.add(super.getWeather[0]);
    return currentWeather;
  }
}
