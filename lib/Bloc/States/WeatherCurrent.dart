import 'package:weather/Bloc/States/WeatherIsLoaded.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';

class WeatherCurrent extends WeatherIsLoaded {
  WeatherCurrent(List<WeatherModel> weather) : super(weather);
}
